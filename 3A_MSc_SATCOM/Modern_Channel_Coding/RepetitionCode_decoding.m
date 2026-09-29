% Clear all variables and close all figures
clear all;
close all;

%% Description
% Authors: EL Mendili Youssef
% This script demonstrates decoding of a repetition code using Direct MAP, MAP with Belief Propagation, and ML methods.

%% Parameters
N = 4; % Code word length
K = 1; % Number of information bits per code word
G = ones(K, N); % Generator matrix for repetition code
SNR = 0:1:4; % Signal-to-Noise Ratio range in dB

%% Generate Codewords
% Generate all possible information bit combinations
u = de2bi((0:2^K-1)', 'left-msb');
% Calculate the codewords by multiplying information bits with the generator matrix
ctable = rem(u*G, 2);
% Perform BPSK mapping on the codewords
Filterbank = 1 - 2*ctable;

%% MAP and ML Decoder Implementation
for snri = 1:length(SNR)
    Ncwd = 12000; % Number of codewords to transmit
    Info = randi([0, 1], Ncwd, K); % Randomly generated information bits
    Cwds = rem(Info*G, 2); % Generated codewords
    x = 1 - 2*Cwds; % BPSK modulation of codewords
    
    % Simulate transmission over AWGN channel
    [y, Pn] = awgn(x, SNR(snri)); 

    % Direct MAP and ML decoding
    for i = 1:Ncwd
        % MAP decoding (Direct Calculation)
        yrep = repmat(y(i, :), 2^K, 1);
        de = sum(abs(yrep - Filterbank).^2, 2);
        Pyx = exp(-de/(2*Pn));
        llr = log((1-ctable)'*Pyx) - log(ctable'*Pyx);
        c_hat_MAP_D(i, :) = (1 - sign(llr))/2;

        % ML decoding (Direct Calculation)
        ycorr = Filterbank*y(i, :)';
        [~, ymax_index] = max(ycorr);
        u_hat_ML_D(i, :) = de2bi(ymax_index - 1, K, 'left-msb');
    end
    u_hat_MAP_D = c_hat_MAP_D(:, 1:K);

    % MAP decoding using Belief Propagation
    Nbr_conver = 1; % Number of iterations for Belief Propagation
    llr_ch_y = 2*y/Pn;
    llr_BP = llr_ch_y;
    for n = 1:Nbr_conver
        for kk = 1:N
            index = 1:N;
            index(kk) = [];
            xx = prod(tanh(llr_BP(:, index)/2), 2);
            llr_ext(:, kk) = 2*atanh(xx);
        end
        llr_BP = llr_BP + llr_ext;
    end
    c_hat_MAP_BP = (1 - sign(llr_BP))/2;
    u_hat_MAP_BP = c_hat_MAP_BP(:, 1:K);

    %% Calculate and Store BER for each SNR
    bit_error_number_MAP_D = sum(sum(xor(Info, u_hat_MAP_D)));
    BER_MAP_D(snri) = bit_error_number_MAP_D/numel(Info);

    bit_error_number_MAP_BP = sum(sum(xor(Info, u_hat_MAP_BP)));
    BER_MAP_BP(snri) = bit_error_number_MAP_BP/numel(Info);

    bit_error_number_ML_D = sum(sum(xor(Info, u_hat_ML_D)));
    BER_ML_D(snri) = bit_error_number_ML_D/numel(Info);
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