close all
clear

% Load precomputed slope for the DPLL
load slope_DD_8PSK

% User input for phase shift, frequency shift, loop parameters, and Eb/No
d_phi_deg = input('Phase shift in degrees?');  % only one value!
df_Rs = input('Frequency shift wrt Rs= ?'); % only one value!
BlT = input('Loop noise bandwidth?');  % ex: 0.01
order = input('Loop order (1 or 2)?');

% Loop parameters calculation based on the selected order
if order == 2
    zeta = sqrt(2)/2;
    wnT = 2 * BlT / (zeta + 1/(4*zeta));
    A = wnT * (2 + wnT) / (1 + 3 * wnT + wnT.^2);
    B = wnT.^2 / (1 + 3 * wnT + wnT.^2);
elseif order == 1
    B = 0 * BlT;
    A = 4 * BlT;
else
    display('Order 1 assumed');
    B = 0 * BlT;
    A = 4 * BlT;
end

% User input for Eb/No in dB
EbNodB = input('Eb/No dB=?');
EbNo = 10.^(EbNodB/10);

% Number of symbols, modulation order, and initialization
N_symb = 1000;
M = 8;   % 8PSK
NCO_mem = 0;      % NCO initialization
filtre_mem = 0;   % Filter memory initialization
phi_est(1) = 0;  % Initial value of estimated phase

% Generate 8PSK symbols
symb_emis = pskmod(randi([0 1], 1, N_symb), 8);

% Thermal noise
sigma = sqrt(1/(3 * EbNo));
noise = sigma * randn(1, N_symb) + 1j * sigma * randn(1, N_symb);

% Phase error due to frequency shift
deph = 2 * pi * df_Rs * [0:N_symb-1] + d_phi_deg * pi / 180;

% DPLL input
recu = symb_emis .* exp(1j * deph) + noise;

% DPLL loop
for ii = 1:N_symb
    % Display ii
    if mod(ii, 1000) == 0
        ii
    end
    
    % Signal after phase adjustment
    recu_deph(ii) = exp(-1j * phi_est(ii)) * recu(ii) + noise(ii);
    
    % Symbol estimation
    symb_est(ii) = pskmod(pskdemod(recu(ii), 8), 8);
    
    % Phase error detector
    out_det(ii) = imag(conj(symb_est(ii)) .* recu_deph(ii)) / slope_DD_8PSK;
    
    % Loop filter F(z) = A + B/(1 - z^-1)
    w(ii) = filtre_mem + out_det(ii);
    filtre_mem = w(ii);
    out_filtre = A * out_det(ii) + B * w(ii);
    
    % NCO update
    phi_est(ii + 1) = (out_filtre + NCO_mem);
    NCO_mem = phi_est(ii + 1);
end

% Plotting the results
figure(1)
plot(phi_est * 180/pi)
grid on
xlabel('time')
ylabel('phi-Est [degree]')

figure(2)
plot(out_det)
grid on
xlabel('time')
ylabel('detector Output')

figure(3)
plot(B * w / (2 * pi))
grid on
xlabel('time')
ylabel('frequency Error')
