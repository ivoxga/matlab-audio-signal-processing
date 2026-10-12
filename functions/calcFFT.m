%% Função para calcular a FFT de um sinal
%       por parametro passamos os dados do audio importado ( [D,Fs] )
%       A função devolver um array [f,P]
%                                   f = frequencias
%                                   P = potência

function [f,P] = calcFFT(D,Fs)

% Numero de amostras
N = length(D);

% Calcula FFT
TF = fft(D);
    
% Potência
P = abs(TF).^2 / N;         % Calcula potência
P = P(1:floor(N/2)+1);      % Selecionar apenas de 0Hz até Fs/2
                            % floor() -> arredonda para o nº inteiro abaixo mais proximo
P(2:end-1) = 2*P(2:end-1);  % Como 0Hz e Fs/2 não têm parte negativa no sinal,
                            %   apenas é necessário compensar dentro desse
                            %   intervalo e multiplicar por 2 para
                            %   compensar a energia perdida na divisão do
                            %   sinal (positiva - negativa)
    
% Eixo da Frequência
f = Fs * (0:(N/2)) / N;

end