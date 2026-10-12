%% Filtragem de Som

% Importar audio
addpath(genpath('C:\Users\ivox2\Documents\IPCA EEC\3º Ano\1º Semestre\Processamento de Sinal\TP'));
audio_o = 'handel_J.wav';
[D, Fs] = importAudio(audio_o);

% Reproduzir o audio original
sound(D,Fs);
fprintf('A reproduzir audio original...\n');

% Plot do espectro de potência do sinal de áudio em relação à frequência,
%   e traçado do sinal original em relação ao tempo
plotAudioSignal(D,Fs);

% Definir frequências de ruído
fr_1 = 1043.09;
fr_2 = 1955.69;
margem = 50;        % Margem de segurança

% Filtro 1 - Remover freqs. de 1043-(margem/2) até 1043+(margem/2)
W1 = [fr_1 - margem/2, fr_1 + margem/2] / (Fs/2);   % Normalizar frequências de corte para Nyquist
[b1, a1] = butter(2, W1, 'stop');

% Filtro 2 - Remover freqs. de 1955-(margem/2) até 1955+(margem/2)
W2 = [fr_2 - margem/2, fr_2 + margem/2] / (Fs/2);   % Frequências de corte nomralizadas
[b2, a2] = butter(2, W2, 'stop');

% Determinar o espetro dos filtros
[h1, f1] = freqz(b1, a1, Fs, Fs);
[h2, f2] = freqz(b2, a2, Fs, Fs);

% Converter magnitude em dB
h1 = 20*log10(abs(h1));
h2 = 20*log10(abs(h2));

% Visualizar resposta dos filtros
figure;
plot(f1,h1,'r');
hold on;
plot(f2,h2,'b');
title('Resposta em Frequência dos Filtros');
legend('Filtro 1 (1043 Hz)', 'Filtro 2 (1956 Hz)');
xlabel('Frequência (Hz)'); xlim([0 4000]);
ylabel('Magnitude (dB)');

% Filtragem do sinal
sinal_temp = filter(b1, a1, D);     % Aplicar filtro 1
D_f = filter(b2, a2, sinal_temp);   % Aplicar filtro 2 sobre o resultado anterior

% Plot do espectro de potência do sinal de áudio filtrado em relação à frequência,
%   e traçado do sinal em relação ao tempo
plotAudioSignal(D_f, Fs);

% Pausa para o audio original acabar de ser reproduzido
pause(length(D)/Fs + 1);        % Duração exata do áudio + 1 (segundos)

% Reproduzir o audio filtrado
fprintf('A reproduzir audio filtrado...\n');
sound(D_f, Fs);