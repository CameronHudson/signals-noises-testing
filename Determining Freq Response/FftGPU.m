In = NoiseVomit.input.signal;
Signal = NoiseVomit.output.signal;
Time = NoiseVomit.input.time;
TransformedInput = fft(In);
TransformedNoise = fft(Signal);

TransformedNoise(size(TransformedInput):size(TransformedNoise)-1) = [];

booty = abs(TransformedNoise./TransformedInput);
N = length(Time);
Ts = 0.002;
frequency = [0:N-1]'/(N*Ts);

xvals = loglog(frequency,booty);