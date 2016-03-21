Ts = 0.0005;

In = StepOut.input.signal;
Signal = StepOut.output.signal;

Signal(length(In):length(Signal)-1) = [];


Time = StepOut.input.time;
TransformedInput = fft(In);
TransformedNoise = fft(Signal);
something = TransformedNoise./TransformedInput;
something = (TransformedNoise./TransformedInput);

booty = abs(something);
N = length(Time);
frequency = [0:N-1]'/(N*Ts);

figure(1);
xvals = loglog(frequency,booty);

figure(2);
bode(ans);

p=unwrap(angle(something)).*180./pi + 360;

figure(3)
semilogx(frequency,p)


% Ts = 0.0005;
% 
% In = StepOut.input.signal;
% Signal = StepOut.output.signal;
% 
% Signal(length(In):length(Signal)-1) = [];
% 
% 
% Time = StepOut.input.time;
% TransformedInput = fft(In/Ts);
% TransformedNoise = fft(Signal/Ts);
% 
% booty = abs((TransformedNoise./TransformedInput)*Ts);
% N = length(Time);
% frequency = [0:N-1]'/(N*Ts);
% 
% y=(TransformedNoise);
% p=unwrap(angle(y)*180/pi +360);
% 
% 
% figure(3)
% semilogx(frequency,p)