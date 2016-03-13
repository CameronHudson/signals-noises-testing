Ts = 0.0005;

In = StepOut.input.signal;
Signal = StepOut.output.signal;

Signal(length(In):length(Signal)-1) = [];


Time = StepOut.input.time;
TransformedInput = fft(In/Ts);
TransformedNoise = fft(Signal/Ts);

booty = abs((TransformedNoise./TransformedInput)*Ts);
N = length(Time);
frequency = [0:N-1]'/(N*Ts);

figure(1);
xvals = loglog(frequency,booty);

figure(2);
bode(ans);

y=fft(booty);
p=unwrap(angle(y));


figure(3)
semilogx(frequency,p)