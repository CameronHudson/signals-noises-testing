%%Run after 'GenerateData' and 'TransferFunc.slx'
clear t;
syms t;
syms u;


FuncSym = ((t/100)^4)-(t-20)^2;




FuncU = subs(FuncSym,t,u);
FuncStr = char(FuncSym);
FuncStrU = char(FuncU);
GenerateData;
sim('TransferFunc');

plot(chirpFunc.output.time,chirpFunc.output.signal,SixPoles.time,SixPoles.signals.values);