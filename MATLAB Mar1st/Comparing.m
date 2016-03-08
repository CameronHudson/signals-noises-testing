clear all;
close all;

dataSetNoise = load('NoisySin');
signalNoise = dataSetNoise.('NoisySin').output.signal;
dataSetClean = load('PerfectSin');
signalClean = dataSetClean.('PerfectSin').output.signal;
dataSetZero = load('zeroSin');
signalZero = dataSetZero.('zeroSin').output.signal;


time = dataSetClean.('PerfectSin').output.time;

figure(1);
plot(time,signalNoise,time,signalClean,time,signalZero)

figure(2);
noise = signalNoise - signalZero;
noiseAv = noise./signalZero;
rng(1);
checker = randn(5001,1)/10;
plot(time,checker,time,noiseAv,time,noise);
figure(3);
plot(noiseAv,checker);

