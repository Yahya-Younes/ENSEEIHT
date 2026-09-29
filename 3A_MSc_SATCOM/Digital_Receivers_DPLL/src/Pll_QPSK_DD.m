close all;
clear;

% Define a phase error interval for the detector
d_phi_deg = -rad2deg(pi):rad2deg(pi)/500:rad2deg(pi);

% Input Eb/No in dB and convert it to linear scale
EbNodB = input('Eb/No dB=?');  
EbNo = 10.^(EbNodB/10);

% Number of transmitted symbols
N_symb = 1000;

% Generating QPSK symbols
symb_emis = (2 * randi([0, 1], 1, N_symb) - 1) + 1j * (2 * randi([0, 1], 1, N_symb) - 1);

% Standard deviation of thermal noise
sigma = sqrt(1 / (2 * EbNo));

% Noise vector
noise = sigma * randn(1, N_symb) + 1j * sigma * randn(1, N_symb);

% Initializing S-curve array
S_curve = zeros(1, length(d_phi_deg));

% Loop over phase error
for jj = 1:length(d_phi_deg)
    
    % Display phase errors at every 10th iteration
    if mod(jj, 10) == 0
        disp(d_phi_deg(jj));
    end
    
    % Received signal
    recu = symb_emis .* exp(1j * d_phi_deg(jj) * (pi/180)) + noise;
    
    % Detector output
    out_det = imag(conj(symb_emis) .* recu);
    S_curve(jj) = mean(out_det);
end

% Calculating the slope of the S-curve around 0 degrees
p = 3;
index_center = (length(S_curve) + 1) / 2;
slope = S_curve(index_center + p) - S_curve(index_center - p);
slope = slope / (2 * p * (d_phi_deg(2) - d_phi_deg(1)) * pi / 180);

% Plotting
figure(1);
plot(d_phi_deg, S_curve, 'g-');
grid on;
hold on;
plot([-p:1:p], [-p:1:p] * slope * pi / 180, 'r-');
xlabel('Phase Error (degrees)');
ylabel('Detector Output');
title('S-Curve Characteristic of the Detector');

save slope_DD_QPSK slope;
