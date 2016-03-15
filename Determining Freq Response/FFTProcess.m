Ts = 0.0005;

In = StepOut.input.signal;
Signal = StepOut.output.signal;

Signal(length(In):length(Signal)-1) = [];


Time = StepOut.input.time;
TransformedInput = fft(In/Ts);
TransformedNoise = fft(Signal/Ts);
something = (TransformedNoise./TransformedInput);

booty = abs(something*Ts);
N = length(Time);
frequency = [0:N-1]'/(N*Ts);

figure(1);
xvals = loglog(frequency,booty);

figure(2);
bode(ans);

p=unwrap(angle(something)*180/pi);


figure(3)
semilogx(frequency,p)

%% Process & TFest

TFInput = TransformedInput(1:4917100,1)*Ts;
TFOutput = TransformedNoise(1:4917100,1)*Ts;
TFFreq = frequency(1:4917100,1);

TFdata = iddata(TFOutput, TFInput, Ts,'Frequency',TFFreq);

sys = tfest(TFdata,6);


