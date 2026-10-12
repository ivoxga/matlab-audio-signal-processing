%% Função para importar o ficheiro de audio 
%       por parametro passamos o nome do audio a carregar
%       A função devolver um array [D,Fs]   
%                                   D = dados do audio
%                                   Fs = frequencia de amostragem dos dados de audio

function [D, Fs] = importAudio(audio)

[D,Fs] = audioread(audio);
fprintf('Audio importado com sucesso!\n');

end