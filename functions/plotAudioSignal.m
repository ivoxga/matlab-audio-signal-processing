%% Função para mostrar os plots do audio importado:
%       - Plot do sinal áudio em ordem ao tempo
%       - Plot do espetro de potência do sinal áudio
%       por parametro passamos os dados do audio importado ( [D,Fs] )

function plotAudioSignal(D,Fs)

% --- PLOT NO TEMPO ---

% Criar vetor do tempo
t = (0:length(D)-1)/Fs;

% Plot do audio em função do tempo
figure;
subplot(1,2,1); 
plot(t,D); 
title('Sinal do audio');
xlabel('Tempo (s)'); xlim([0 t(end)]);
ylabel('Amplitude');

% --- PLOT DO ESPECTRO DE POTENCIA ---

% Calcular FFT
[f,P] = calcFFT(D,Fs);

% Plot do espectro de potencia
subplot(1,2,2);
plot(f, P);
title('Espectro de potência');
xlabel('Frequência (Hz)');
ylabel('Potência');

end