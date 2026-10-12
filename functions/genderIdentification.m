%% Função para fazer o reconhecimento de género de um audio importado
%       por parametro passamos o nome do audio a carregar
%       por parametro passamos os dados do audio importado ( [D,Fs] )

function genderIdentification(D,Fs)

% Calcular FFT
[f,P] = calcFFT(D,Fs);

% Encontrar frequência dominante
[~, iMax] = max(P);
freq_dom = f(iMax);

% Calcular distância entre a frequência dominante e as frequências de
%   referencia para masculino e feminino
dist_M = abs(freq_dom - 125);
dist_F = abs(freq_dom - 200);

% Comparar distancias
if dist_M < dist_F
    genero = 'Masculino';
else
    genero = 'Feminino';
end

% Mostrar género identificado
fprintf('Género identificado: %s\n',genero);

end