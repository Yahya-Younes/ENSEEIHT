close all;
clear;

% Load detector slope from file
load slope_DD_QPSK.mat

% User inputs
d_phi_deg = input('Phase offset in degrees? ');
df_Rs = input('Frequency offset / Symbol Rate = ? ');
BlT = input('Loop bandwidth? ');
ordre = input('Loop order (1 or 2)? ');

% Loop filter parameters
if ordre == 2
    zeta = sqrt(2) / 2;
    wnT = 2 * BlT ./ (zeta + 1 / (4 * zeta));
    A = wnT .* (2 + wnT) ./ (1 + 3 * wnT + wnT.^2);
    B = wnT.^2 ./ (1 + 3 * wnT + wnT.^2);
elseif ordre == 1
    B = 0 * BlT;
    A = 4 * BlT;
else
    disp('Order 1 assumed');
    B = 0 * BlT;
    A = 4 * BlT;
end

% More user inputs
EbNodB = input('Eb/No dB=? ');
EbNo = 10.^(EbNodB / 10);

% QPSK parameters and initialization
N_symb = 1000;
M = 4; % QPSK
NCO_mem = 0;
filtre_mem = 0;
phi_est(1) = 0;

% Symbol generation
symb_emis = (2 * randi([0 1], 1, N_symb) - 1) + 1j * (2 * randi([0 1], 1, N_symb) - 1);
sigma = sqrt(1 / (2 * EbNo)); % Thermal noise sigma
noise = sigma * (randn(1, N_symb) + 1j * sigma * randn(1, N_symb));
deph = 2 * pi * df_Rs * [0:N_symb - 1];
deph = deph + d_phi_deg * pi / 180; % Phase offset in received signal
recu = symb_emis .* exp(1j * deph) + noise; % Received signal

% DPLL simulation
out_det = zeros(1, N_symb);
w = zeros(1, N_symb);
for ii = 1:N_symb
    % Display current index at intervals
    if mod(ii, 1000) == 0
        disp(ii);
    end
    % Signal processing
    recu_deph = exp(-1j * phi_est(ii)) .* recu + noise;
    symb_est = sign(real(recu_deph)) + 1j * sign(imag(recu_deph));
    out_det(ii) = imag(conj(symb_est) .* recu_deph(ii)) / slope_DD_QPSK;
    
    % Loop filter
    w(ii) = filtre_mem + out_det(ii);
    filtre_mem = w(ii);
    out_filtre = A * out_det(ii) + B * w(ii);

    % Integrator
    phi_est(ii + 1) = (out_filtre + NCO_mem);
    NCO_mem = phi_est(ii + 1);
end

% Plotting results
figure(1);
plot(phi_est * 180 / pi);
grid on;
xlabel('Time');
ylabel('Phi-est [degrees]');
title('Estimated phase');

figure(2);
plot(out_det);
grid on;
xlabel('Time');
ylabel('Detector output');
title('Output of the detector');

figure(3);
plot(B * w / (2 * pi));
grid on;
xlabel('Time');
ylabel('Frequency error');
