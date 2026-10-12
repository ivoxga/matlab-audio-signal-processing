%% Função para reproduzir audio 
%       por parametro passamos os dados do audio importado ( [D,Fs] )

function playAudio(D,Fs) 

sound(D, Fs);
fprintf('A reproduzir audio...\n');

end