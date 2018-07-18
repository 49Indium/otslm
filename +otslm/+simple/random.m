function pattern = random(sz, varargin)
% RANDOM generates a random pattern
%
% pattern = random(sz, ...) creates a random pattern with values between
% 0 and 1.
%
% Optional named parameters:
%
%   'range'   [low, high]  Range of values (default: [0, 1)).
%   'type'    type         Type of noise: 'uniform' or 'gaussian'
%
% Copyright 2018 Isaac Lenton
% This file is part of OTSLM, see LICENSE.md for information about
% using/distributing this file.

p = inputParser;
p.addParameter('range', [0, 1]);
p.addParameter('type', 'uniform');
p.parse(varargin{:});

high = p.Results.range(2);
low = p.Results.range(1);

switch p.Results.type
  case 'uniform'
    pattern = rand(sz) * (high-low) + low;
  case 'gaussian'
    pattern = randn(sz) * (high-low) + low;
  case 'binary'
    pattern = (randi(2, sz) - 1) * (high-low) + low;
  otherwise
    error('Unknown noise type');
end

