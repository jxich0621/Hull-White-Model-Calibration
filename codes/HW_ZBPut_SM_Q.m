% This function we calculate the HW ZBP MC simulation price under Q measure

% Inputs: 
% a,sigma.r0: HW model params
% T,S: two time points for the ZBP
% L,M: simulation times
% X: strike
% time: market observations of zero-coupon maturities
% discount: market observations of zero-coupod discounts

% Output: HW ZBP sim price under Q measure


function y = HW_ZBPut_SM_Q(a,sigma,r0,T,S,X,L,M,time,discount)
    
    deltat = T/M;
    f = 0;
    for i = 1:L
        s = 0;
        for j=1:M
            r = rt(r0,a,sigma,j*deltat,time,discount);
            s = s + r * deltat;
        end
        coef = exp(-s);
        payoff = max(0,X-HW_ZBPrice_CF_PTS(a,sigma,r,T,S,time,discount));
        f = f + coef*payoff;
    end
    
    y = f/L;
end

