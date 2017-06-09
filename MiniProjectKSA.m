Fs = 44100;
A  = 110;
E  = -5;
D  = 5;
G  = 10;
B  = 14;
E  = 19;

i= 1;
key = 0;
f = gcf;

F = linspace(1/Fs, 1000, 2^12);

x = zeros(Fs*4, 1);

delay = round(Fs/A);

b  = firls(42, [0 1/delay 2/delay 1], [0 0 1 1]);
a  = [1 zeros(1, delay) -0.5 -0.5];

% [H,W] = freqz(b, a, F, Fs);
% plot(W, 20*log10(abs(H)));
% title('Harmonics of an open A string');
% xlabel('Frequency (Hz)');
% ylabel('Magnitude (dB)');

zi = rand(max(length(b),length(a))-1,1);
note = filter(b, a, x, zi);

%note = note-mean(note);
%note = note/max(abs(note));

hplayer = audioplayer(note, Fs); 
    play(hplayer)
% while i == 1
% key=double(get(f,'CurrentCharacter')) ;
% if key == 31
%     i = 0;
% end
% if key == 5    
% 
% end
% pause(.0001);
% end
