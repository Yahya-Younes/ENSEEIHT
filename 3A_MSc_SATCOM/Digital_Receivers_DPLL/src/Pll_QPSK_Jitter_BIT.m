close all;
clear;
load slope_NDA_QPSK;
load slope;

% Define parameters
BlT = 10.^(-4:0.01:-3);
EbNodB = 10;
EbNo = 10^(EbNodB/10);
N_symb = 1000;
M = 4; % QPSK
sigma = sqrt(1/(2*EbNo)); % Standard deviation of thermal noise

% Generate QPSK symbols
symb_emis = (2*randi([0, 1], 1, N_symb) - 1) + 1j*(2*randi([0, 1], 1, N_symb) - 1);

% Initialize variables
phi = zeros(1, N_symb+1);
bruit = sigma * (randn(1, N_symb) + 1j*randn(1, N_symb)); % Noise vector
deph = 0;
recu = symb_emis .* exp(1j*deph) + bruit; % Received samples in DPLL

% Preallocate arrays for efficiency
phi_est = zeros(1, N_symb+1);
jitter = zeros(1, length(BlT));
out_det = zeros(1, N_symb);
w = zeros(1, N_symb);

% Loop over BlT values
for jj = 1:length(BlT)
    zeta = sqrt(2)/2;
    wnT = 2*BlT(jj) / (zeta + 1/(4*zeta));
    A = wnT * (2 + wnT) / (1 + 3*wnT + wnT^2);
    B = wnT^2 / (1 + 3*wnT + wnT^2);

    % Reset loop variables
    NCO_mem = 0;
    filtre_mem = 0;
    phi_est(1) = 0;

    % DPLL processing
    for ii = 1:N_symb
        % Phase detector
        out_det(ii) = -imag((recu(ii) * exp(-1j * phi_est(ii)))^4) / slope;

        % Loop filter
        w(ii) = filtre_mem + out_det(ii);
        filtre_mem = w(ii);
        out_filtre = A * out_det(ii) + B * w(ii);

        % Integrator with delay
        phi_est(ii+1) = out_filtre + NCO_mem;
        NCO_mem = phi_est(ii+1);
    end

    % Calculate jitter
    jitter(jj) = mean((phi - phi_est).^2);
end

% Plot results
figure(1);
loglog(BlT, jitter);
xlabel('BlT');
ylabel('Jitter');
title('Phase jitter as a function of the phase noise band');
grid on;
