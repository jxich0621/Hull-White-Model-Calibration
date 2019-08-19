% This function we calculate the HW ZBP MC simulation price under T measure

% Inputs: 
% a,sigma.r0: HW model params
% T,S: two time points for the ZBP
% L: simulation times
% X: strike
% time: market observations of zero-coupon maturities
% discount: market observations of zero-coupod discounts

% Output: HW ZBP sim price under T measure

function y = HW_ZBPut_SM_T(a,sigma,r0,T,S,X,L,time,discount)

    coef = HW_ZBPrice_CF2(a,sigma,r0,T,time,discount);
    
    f = 0;
    
    for i = 1:L
        x0 = r0 - alphat(0,a,sigma,time,discount);
        x = xt(x0,a,sigma,T,time,discount);
        r = x + alphat(T,a,sigma,time,discount);
        payoff = max(0,X-HW_ZBPrice_CF_PTS(a,sigma,r,T,S,time,discount));
        f = f + payoff;
    end
    
    y = coef*(f/L);
end

