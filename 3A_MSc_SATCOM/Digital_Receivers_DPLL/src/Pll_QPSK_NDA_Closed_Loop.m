close all
clear

% 
% The slope in 0 has to be  calculated before and stored in the file 
% slope_NDA_QPSK.mat 
%

% Average : NDA (Non Data Aided) (u(ô))
% DD = Decision Directed (using symbol estimated (ãk -> âk)
% DA = Data Aided (Known data)
load slope_NDA_QPSK
load slope

d_phi_deg=input('phase shift in degrees?');  % only one value !
df_Rs=input('frequency shift wrt Rs= ?'); % only one value !

BlT=input('Loop noise bandwith?');  % ex: 0.01

order=input('loop order (1 or 2)?'); 

%
% loop parameters calculation
%

if order==2
zeta=sqrt(2)/2;
wnT=2*BlT./(zeta+1/(4*zeta));
A=wnT.*(2+wnT)./(1+3*wnT+wnT.^2);
B=wnT.^2./(1+3*wnT+wnT.^2);

elseif order==1
   B=0*BlT;
   A=4*BlT;
else
   display ('order1 assumed');
    B=0*BlT;
    A=4*BlT;
 end
 
 
EbNodB=input('Eb/No dB=?');
EbNo=10.^(EbNodB/10);

N_symb=10000;
M=4;   %QPSK
NCO_mem=0;      % NCO initialization 
filtre_mem=0;   % filter memory initialisation 
phi_est(1)=0;  %  initial value of estimated phase
symb_emis=(2*randi([0 1],1,N_symb)-1)+j*(2*randi([0 1],1,N_symb)-1); % QPSK symbols
sigma = sqrt(1/(2*EbNo));   % thermal noise
noise=sigma*randn(1,N_symb)+j*sigma*randn(1,N_symb) ; 
dephasage=2*pi*df_Rs*[0:N_symb-1]+d_phi_deg*pi/180;  % phase error
recu=symb_emis.*exp(j*dephasage)+noise; %  DPLL input

 %  DPLL
 
for ii=1:N_symb
    
     % printing ii
    if mod(ii,1000)==0
        ii
    end
   
    out_det(ii)= -imag((recu(ii)*exp(-1j*phi_est(ii)))^4)/slope_NDA_QPSK; % to be completed
    
    
    % loop filter F(z)=A+B/(1-z^-1)
    
    w(ii)=filtre_mem+out_det(ii); 
    filtre_mem=w(ii);            
    out_filtre=A*out_det(ii)+B*w(ii);     
    
    %NCO / updating N(z)=1/(z-1)
    
    phi_est(ii+1)=(out_filtre+NCO_mem); 
    NCO_mem=phi_est(ii+1);
    
    
end


figure(1)
plot(phi_est*180/pi)
grid on
xlabel('Time')
ylabel('Phi-est [degree]')
title('Estimated phase')

figure(2)
plot(out_det)
grid on
xlabel('Time')
ylabel('Detector output');
title('Output of the detector')

figure(3)
plot(B*w/(2*pi))
grid on
xlabel('time')
ylabel('frequency error');