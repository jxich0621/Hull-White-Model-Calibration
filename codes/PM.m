% This function is used to interpolate a continuous ZCB discount curve.

% Inputs: 
% time: a column vector that contains market observable ZCB maturities

% discount: a column vector that contains discount rate corresponding to
% the above maturities.

% t: one possible maturity that does not have market observed price but we
% want to calibrate its discount.

% Output: the interpolated discount for the very maturity

function y = PM(t,time,discount)

 y = interp1(time,discount,t,'spline');

end

