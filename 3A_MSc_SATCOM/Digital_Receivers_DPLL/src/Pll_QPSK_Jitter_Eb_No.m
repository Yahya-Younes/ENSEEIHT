close all;
clear;

% Load necessary data
load slope_NDA_QPSK;
load slope;

% DPLL parameters
BlT = 10^(-2.5);
EbNodB = 2:5:50;
EbNo = 10.^(EbNodB / 10);
N_symb = 1000;
M = 4; % QPSK

% Loop filter parameters
zeta = sqrt(2) / 2;
wnT = 2 * BlT ./ (zeta + 1 / (4 * zeta));
A = wnT .* (2 + wnT) ./ (1 + 3 * wnT + wnT.^2);
B = wnT.^2 ./ (1 + 3 * wnT + wnT.^2);

% QPSK symbol generation
symb_emis = (2 * randi([0, 1], 1, N_symb) - 1) + 1j * (2 * randi([0, 1], 1, N_symb) - 1);

% DPLL Simulation
jitter = zeros(1, length(EbNo));
for jj = 1:length(EbNo)
    % Initialization
    NCO_mem = 0;
    filtre_mem = 0;
    phi_est = zeros(1, N_symb + 1);
    
    % Noise generation
    sigma = sqrt(1 / (2 * EbNo(jj)));
    noise = sigma * (randn(1, N_symb) + 1j * randn(1, N_symb));
    recu = symb_emis .* exp(1j * 0) + noise; % Received signal

    % DPLL loop
    for ii = 1:N_symb
        % Phase error detection
        out_det = -imag((recu(ii) .* exp(-1j * phi_est(ii))).^4) / slope;

        % Loop filter
        w = filtre_mem + out_det;
        filtre_mem = w;
        out_filtre = A * out_det + B * w;

        % Integrator
        phi_est(ii + 1) = out_filtre + NCO_mem;
        NCO_mem = phi_est(ii + 1);
    end

    % Calculate jitter
    jitter(jj) = mean((0 - phi_est(1:N_symb)).^2);
end

% Plot results
figure(1);
loglog(EbNo, jitter);
xlabel('Eb/No (dB)');
ylabel('Jitter');
title('Phase Jitter as a Function of Eb/No');
grid on;
