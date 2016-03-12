function [ f ] = NoiseMaker( t )
    if t == 0
        f = 0;
    else
        i = cast(t/0.002,'int64');
        load('noise.mat')
        f = noise(i);
    end
end
