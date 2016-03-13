function [ f ] = NoiseMaker( t )
    if t ~= 0
        i = cast(t/0.002,'int64')
        load('noise.mat')
        f = noise(i);
    else
        f = 0;
    end
end
