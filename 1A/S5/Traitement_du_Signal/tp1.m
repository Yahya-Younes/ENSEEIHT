%2.1 Représentation temporelle

N = 90;
f0 = 1100;
Fe = 10000;
Te = 1/Fe;
x = cos(2*pi*f0*(0:Te:(N-1)*Te)); 
plot((0:Te:(N-1)*Te),x);
xlabel("Temps en secondes");
ylabel("Signal X")

% Fe = 1000 Hz

Fe = 1000;
Te = 1/Fe;
y = cos(2*pi*f0*(0:Te:(N-1)*Te)); 
figure
plot((0:Te:(N-1)*Te),y);
xlabel("Temps en secondes");
ylabel("Signal Y");

% c'est le critère de Shannon fe > 2*fmax c'est pour ca on n'observe pas f0

%2.2 Représentation fréquentielle
TF_x = fft(x);
figure
semilogy(0:Fe:(N-1)*Fe,abs(TF_x));
xlabel("Fréquence en Hz");
ylabel("Signal X");

TF_y = fft(y);
figure
semilogy(0:Fe:(N-1)*Fe,abs(TF_y));
xlabel("Fréquence en Hz");
ylabel("Signal Y");



N1 = 150;
N2 = 100;
N3 = 180;
N4 = 2^8;
N5 = 1024;
Y1 = fft(y,N1);
figure
semilogy(linspace(0,Fe,length(Y1)),abs(Y1))
Y2 = fft(y,N2);
figure
semilogy(linspace(0,Fe,length(Y2)),abs(Y2))
Y3 = fft(y,N3);
figure
semilogy(linspace(0,Fe,length(Y3)),abs(Y3))
Y4 = fft(y,N4);
figure
semilogy(linspace(0,Fe,length(Y4)),abs(Y4))
Y5 = fft(y,N5);
figure
semilogy(linspace(0,Fe,length(Y5)),abs(Y5))
Rx = 0;
for i=1:N
 Rx = Rx + i*conj(i));
end
R_x = (1/N) * Rx;
Sx = fft(R_x);
figure
semilogy(linspace(0,Fe,length(Sx)),abs(Sx));








