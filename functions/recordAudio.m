%% Função para gravar audio a partir do micro a 8000Hz, 16 bits e 1 canal
%       por parametro passamos o tempo em segundos de gravação

function recordAudio(tempo_s)

% Para verificar qual o ID do microfone
%info = audiodevinfo;
%disp(info.input);

% Configurações do gravador
gravador = audiorecorder(8000,16,1,1);

% Inicia gravação
fprintf('A gravar...\n');
recordblocking(gravador, tempo_s);
fprintf('Terminou a gravação.\n');

% Amostras da gravação
gravacao = getaudiodata(gravador);

% Guarda audi em .mp3
titulo = 'audio_gravado.mp3';
audiowrite(titulo,gravacao,8000);
fprintf('Audio gravado com sucesso!\nNome do ficheiro audio: %s\n',titulo);

end