close all;
clear;

% Define parameters
d_phi_deg = -rad2deg(pi):rad2deg(pi)/500:rad2deg(pi); % Phase error interval for the detector
EbNo_dB = 100; % Eb/No in dB
EbNo = 10^(EbNo_dB/10);
N_symb = 50000; % Number of symbols sent

% Generate 8PSK symbols
symb_emis = pskmod(randi([0, 1], 1, N_symb), 8);

% Calculate sigma for thermal noise
sigma = sqrt(1/(2*3*EbNo));

% Generate noise vector
noise = sigma * (randn(1, N_symb) + 1j * sigma * randn(1, N_symb));
S_curve = zeros(1, length(d_phi_deg));

% Loop over phase errors
for jj = 1:length(d_phi_deg)
    % Received signal with phase error
    recu = symb_emis .* exp(1j * d_phi_deg(jj) * (pi/180)) + noise;

    % Decision and phase estimation
    symb_est = pskmod(pskdemod(recu, 8), 8);

    % Phase error detector
    out_det = imag(conj(symb_est) .* recu);

    % Calculate mean output of detector
    S_curve(jj) = mean(out_det);

    % Display phases (every 10 iterations)
    if mod(jj, 10) == 0
        disp(d_phi_deg(jj));
    end
end

% Compute slope (S-Curve) around 0 between -pi and pi
index = find(d_phi_deg >= -10*pi/180 & d_phi_deg <= 10*pi/180);
y = S_curve(index);
x = d_phi_deg(index);

% Use polyfit function to compute slope
p = polyfit(x, y, 1);
slope_DD_8PSK = p(1);

% Save the value of the slope
save slope_DD_8PSK ;

% Plotting
PED_approx = polyval(p, x);
figure;
plot(d_phi_deg*180/pi, S_curve, '-', 'DisplayName', 'S Curve');
hold on;
plot(x*180/pi, PED_approx, '--', 'DisplayName', 'Slope Tangential Line');
title('8PSK PED S Curve');
xlabel('Phase Error (degrees)');
ylabel('PED Output');
grid on;
