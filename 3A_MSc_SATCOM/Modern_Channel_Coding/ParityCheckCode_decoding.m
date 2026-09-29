% Clear workspace and figures for a fresh start
clear all;
close all;

%% Description
% Author: EL Mendili Youssef
% This script demonstrates decoding for a parity-check code using Direct MAP, MAP with Belief Propagation, and ML methods.

%% Parameters Setup
N = 4; % Codeword length
K = 3; % Number of information bits
G = [eye(K) ones(K,1)]; % Generator matrix for parity-check code
SNR = 0:1:5; % Range of SNR values in dB

%% Codeword Generation
% Generate all possible combinations of information bits
u = de2bi((0:2^K-1)', 'left-msb');
% Generate codewords by multiplying information bits with the generator matrix and applying modulo-2
ctable = rem(u*G,2);
% Map codewords to BPSK symbols
Filterbank = 1 - 2*ctable;

%% Decoding Process
for snri = 1:length(SNR)
    Ncwd = 1000; % Set number of codewords to transmit
    Info = randi([0,1], Ncwd, K); % Generate random information bits
    Cwds = rem(Info*G,2); % Generate corresponding codewords
    x = 1 - 2*Cwds; % BPSK modulation of codewords
    
    % Add AWGN to the transmitted symbols based on current SNR
    [y, Pn] = awgn(x, SNR(snri));

    % Direct MAP and ML Decoding
    for i = 1:Ncwd
        % MAP Decoding
        yrep = repmat(y(i,:), 2^K, 1);
        de = sum(abs(yrep - Filterbank).^2, 2);
        Pyx = exp(-de/(2*Pn));
        llr = log((1-ctable)'*Pyx) - log(ctable'*Pyx);
        c_hat_MAP_D(i,:) = (1 - sign(llr))/2;

        % ML Decoding
        ycorr = Filterbank*y(i,:)';
        [~, ymax_index] = max(ycorr);
        u_hat_ML_D(i,:) = de2bi(ymax_index-1, K, 'left-msb');
    end
    u_hat_MAP_D = c_hat_MAP_D(:, 1:K);

    % MAP Decoding with Belief Propagation
    Nbr_conver = 1; % Number of BP iterations
    llr_ch_y = 2*y/Pn;
    llr_BP = llr_ch_y; % Initialize LLR values
    for n = 1:Nbr_conver
        for kk = 1:N
            index = setdiff(1:N, kk);
            xx = prod(tanh(llr_BP(:,index)/2),2);
            llr_ext(:,kk) = 2*atanh(xx);
        end
        llr_BP = llr_BP + llr_ext;
    end
    c_hat_MAP_BP = (1 - sign(llr_BP))/2;
    u_hat_MAP_BP = c_hat_MAP_BP(:, 1:K);

    %% BER Computation
    % Direct MAP
    bit_error_number_MAP_D = sum(sum(xor(Info, u_hat_MAP_D)));
    BER_MAP_D(snri) = bit_error_number_MAP_D / numel(Info);

    % MAP with Belief Propagation
    bit_error_number_MAP_BP = sum(sum(xor(Info, u_hat_MAP_BP)));
    BER_MAP_BP(snri) = bit_error_number_MAP_BP / numel(Info);

    % ML Decoding
    bit_error_number_ML_D = sum(sum(xor(Info, u_hat_ML_D)));
    BER_ML_D(snri) = bit_error_number_ML_D / numel(Info);
end

%% Plot BER vs. SNR
figure;
semilogy(SNR, BER_MAP_D, '-', 'DisplayName', 'MAP Direct Computation');
hold on;
semilogy(SNR, BER_MAP_BP, 'ok', 'DisplayName', 'MAP Belief Propagation');
semilogy(SNR, BER_ML_D, '--', 'DisplayName', 'ML Direct Computation');
legend('show');
grid on;
title('BER as a Function of SNR');
xlabel('SNR (dB)');
ylabel('BER');