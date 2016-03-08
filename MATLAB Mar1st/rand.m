function [ p ] = rand(varargin)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if size(varargin) == 1
    p = zeros(varargin{1});
elseif size(varargin) == 0
    p = 0;
else
    p = zeros(varargin{1},varargin{2});
end

end

