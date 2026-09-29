close all;
clear all;

% Define phase error range from -π to π, with 1001 equally spaced points
d_phi_deg = -rad2deg(pi):rad2deg(pi)/500:rad2deg(pi);

% Set the Energy per Bit to Noise Power Spectral Density ratio (Eb/No)
EbNo = 10;

% Number of symbols to be sent
N_symb = 1000; % Number of sent symbols

% Generate QPSK symbols, each symbol is a complex number
symb_emis = (2*randi([0 1], 1, N_symb)-1) + 1j*(2*randi([0 1], 1, N_symb)-1);

% Calculate the standard deviation of thermal noise
sigma = sqrt(1/(2*EbNo));

% Generate complex Gaussian noise vector
noise = sigma*randn(1, N_symb) + 1j*sigma*randn(1, N_symb);

% Loop to compute S-curve for different phase errors
for jj = 1:length(d_phi_deg)
    % Apply phase error to transmitted symbols and add noise
    ped_input = symb_emis .* exp(1j * d_phi_deg(jj) * (pi/180)) + noise;

    % Estimate the transmitted symbols
    symb_estim = sign(real(ped_input)) + 1j * sign(imag(ped_input));

    % Detector output calculation
    out_det = imag(conj(symb_estim) .* ped_input);

    % Compute mean of detector output for S-curve
    S_curve(jj) = mean(out_det);
end

% Compute the slope of the S-Curve around zero phase error
% Select a narrow phase error range around zero for slope calculation
index = find(d_phi_deg >= -10*pi/180 & d_phi_deg <= 10*pi/180);
y = S_curve(index);
x = d_phi_deg(index);

% Use linear regression (polyfit) to compute the slope of the S-curve in the selected range
p = polyfit(x, y, 1);
slope_DD_QPSK = p(1); % First coefficient is the slope

% Save the calculated slope for later use
save slope_DD_QPSK

% Plot the S-curve and its linear approximation around zero phase error
PED_approx = polyval(p, x); % Evaluate the linear polynomial at the selected points
figure;
plot(d_phi_deg*180/pi, S_curve, '-', 'DisplayName', 'S Curve');
hold on;
plot(x*180/pi, PED_approx, '--', 'DisplayName', 'Slope Tangent Line');

% Label the axes and add a title to the plot
xlabel('Phase error (degrees)');
ylabel('PED output');
title('QPSK PED S Curve');
grid on; % Enable grid for better readability
