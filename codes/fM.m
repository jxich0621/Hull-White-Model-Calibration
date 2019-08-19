% This function is used to interpolate a continuous instantaneous forward
% rate based on the ZCB discount curve 

% Inputs: 
% time: a column vector that contains market observable ZCB maturities

% discount: a column vector that contains discount rate corresponding to
% the above maturities.

% t: one possible time that we want to calculate the instantaneous forward
% rate at that very time. 

% delta: We know that we need to calculate derivative to get fM
    % The PM curve is not differentiable because we get it from
    % interpolation
    % As a result, we use a numerical derivative here
    % And the delta is the time difference inside that calculation
    
% Output: the instantaneous forward rate at time t

function y = fM(t,time,discount,delta)

    PMleft = PM(t-delta,time, discount);
    PMright = PM(t+delta,time,discount);
    logPMleft = log(PMleft);
    logPMright = log(PMright);
    
    y = -(logPMright-logPMleft)/(2*delta);

end


