function [ f ] = NoiseMaker( t )
    load(noise.mat)
    f = noise(t);
end
