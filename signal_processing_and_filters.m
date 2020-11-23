%% QUESTÃO 1, 2 E 3

% GENERATES SIGNAL WITH RANDOM GAUSSIAN 
% DISTRIBUTION PHASE (GeralSinal.m)
% AND CALCULATES IT'S FREQUENCY SPECTRE
% (Guiao_4_1_fEspetro)

Ta = 0.01;
N = 1000;

for j=1:1
    figure(1)
    subplot(2,1,1);
    [x,t] = GeraSinal(N,Ta);
    pause(2);
    subplot(2,1,2);
    [X, f] = Guiao_4_1_fEspetro(x,Ta,0);
end

%%
% 3)
% LOW-PASS FILTER (FOR FREQUENCIES BELOW fc)
H3 = zeros(N,1);
fc = 3;
H3((f < fc) & (f > -fc)) = 1;
Y3 = H3 .* X;

[sinal, t] = Reconstroi(Y3, f);
figure(2)
plot(t,sinal)

%%
% 4) HIGH-PASS FILTER
H4 = zeros(N,1);
fc = 3;
H4((f < -fc) | (f > fc)) = 1;
Y4 = H4 .* X;

[y, t] = Reconstroi(Y4, f);
figure(2)
plot(t,y);

%% 5)
% SIGNAL TO NOISE RATIO
% SNR = 10*log(Psinal/Pruido) 
potSinal = Potencia(sinal)
potRuido = Potencia(x)
SNR = 10*log10( Potencia(sinal) / Potencia(x) )

%% RECONSTROI? (ifft(ifftshift(X * N))