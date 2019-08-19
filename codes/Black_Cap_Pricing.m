% this function returns the Black's formula price for a cap given its info
% input: this_cap, one cell_unit (matrix) that contains the reset dates, strike,
% implied vol and discount rates for one cap
% Output: the Black's price

function y = f(this_cap)
    h = length(this_cap);
    cap = 0;
    N = 1000;
    
    for j = 2:h
        P = this_cap(j,2) ;
        F = 4*((this_cap(j-1,2)/this_cap(j,2)) - 1);
        K = this_cap(j,3);
        sigma = this_cap(j,4);
        v = sigma* sqrt(this_cap(j-1,1));
        d1 = (log(F/K)+(v^2)/2)/v;
        d2 = (log(F/K)-(v^2)/2)/v;
        Nd1 = normcdf(d1);
        Nd2 = normcdf(d2);
        Bl = F * Nd1- K * Nd2;
        caplet = N*P*(1/4)*Bl;
        cap = cap + caplet;
    end
    
    y = cap;
end

