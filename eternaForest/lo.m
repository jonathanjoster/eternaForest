function y = lo(note, len)
if strcmp(note,'c2')
    f = 65.5;
elseif strcmp(note,'d2')
    f = 73.5;
elseif strcmp(note,'e2')
    f = 82.5;
elseif strcmp(note,'f2')
    f = 87;
elseif strcmp(note,'fs2')
    f = 92.5;
elseif strcmp(note,'g2')
    f = 98;
elseif strcmp(note,'a2')
    f = 110;
elseif strcmp(note,'b2')
    f = 123;
elseif strcmp(note,'c3')
    f = 131;
elseif strcmp(note,'d3')
    f = 147;
elseif strcmp(note,'a3')
    f = 220;
elseif strcmp(note,'e3')
    f = 165;
elseif strcmp(note,'f3')
    f = 174;
elseif strcmp(note,'fs3')
    f = 185;
elseif strcmp(note,'g3')
    f = 196;
elseif strcmp(note,'a3')
    f = 220;
elseif strcmp(note,'b3')
    f = 246;
elseif strcmp(note,'c4')
    f = 261;
elseif strcmp(note,'d4')
    f = 293;
elseif strcmp(note,'ds4')
    f = 311;
elseif strcmp(note,'e4')
    f = 329;
elseif strcmp(note,'f4')
    f = 349;
elseif strcmp(note,'fs4')
    f = 369;
elseif strcmp(note,'g4')
    f = 391;
elseif strcmp(note,'a4')
    f = 440;
elseif strcmp(note,'b4')
    f = 493;
elseif strcmp(note,'c5')
    f = 523;
elseif strcmp(note,'db5')
    f = 554;
elseif strcmp(note,'d5')
    f = 587;
elseif strcmp(note,'ds5')
    f = 622;
elseif strcmp(note,'e5')
    f = 659;
elseif strcmp(note,'f5')
    f = 698;
elseif strcmp(note,'fs5')
    f = 740;
elseif strcmp(note,'g5')
    f = 783;
elseif strcmp(note,'a5')
    f = 880;
elseif strcmp(note,'bb5')
    f = 932;
elseif strcmp(note,'b5')
    f = 987;
elseif strcmp(note,'c6')
    f = 1046;
elseif strcmp(note,'d6')
    f = 1174;
elseif strcmp(note,'ds6')
    f = 1244;
elseif strcmp(note,'e6')
    f = 1318;
elseif strcmp(note,'f6')
    f = 1396;
elseif strcmp(note,'fs6')
    f = 1480;
elseif strcmp(note,'g6')
    f = 1567;
elseif strcmp(note,'a6')
    f = 1760;
elseif strcmp(note,'b6')
    f = 1975;
elseif strcmp(note,'c7')
    f = 2093;
elseif strcmp(note,'d7')
    f = 2349;
elseif strcmp(note,'ds7')
    f = 2489;
elseif strcmp(note,'e7')
    f = 2637;
elseif strcmp(note,'fs7')
    f = 2960;
elseif strcmp(note,'g7')
    f = 3135;
elseif strcmp(note,'a7')
    f = 3520;
elseif strcmp(note,'b7')
    f = 3951;
else
    f = 0;
end

unit = .4;
time = unit*4/len;

Fs = 8192;
t = (1:round(Fs*time))/Fs;

K = 10;
sum = 0;
for i=0:K
    sum = sum+((-1)^i)*sin(2*pi*(2*i+1)*f*t)/(2*i+1)^2;
end
y = (8/pi^2)*sum;

% Attack Time
AT = 0.1;
% Decay Time
DT = 0.2;
% Sustain Level
SL = 0.8;
% Release Time
RT = 0.2;
E = emb(t,AT,DT,SL,RT,time);
y = E.*y;
