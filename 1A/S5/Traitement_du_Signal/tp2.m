clear all
close all

%3.1 Génération du signal à filtrer
f1 = 1000;
f2 = 3000;
Fe = 10000;
Te = 1/Fe;
N = 100;
x1 = cos(2*pi*f1*(0:Te:(N-1)*Te)); 
x2 = cos(2*pi*f2*(0:Te:(N-1)*Te)); 
x = x1 + x2;
plot((0:Te:(N-1)*Te),x);
xlabel("Temps en secondes");
ylabel("Signal X")
   %Rep frequentielle
TF_x = fft(x);
figure
semilogy(0:Fe:(N-1)*Fe,abs(TF_x));
xlabel("Fréquence en Hz");
ylabel("TFD du signal X");


%3.2 Synthèse du filtre passe-bas
  % Ordre 11
A = [1];
N1 = 5;
B = 2*f1/Fe*sinc(2*f1*Te*(-N1:N1));
y = filter(B,A,x);
TF_y = fft(y);
figure
plot(0:Te:(N-1)*Te,y)
figure
semilogy(linspace(0,Fe,length(TF_y)),abs(TF_y));
  % Ordre 61
N2 = 30;
B = 2*f1/Fe*sinc(2*f1*Te*(-N2:N2));
y = filter(B,A,x);
TF_y = fft(y);
figure
semilogy(linspace(0,Fe,length(TF_y)),abs(TF_y));

