% in this function we calculate the x(t) process

% Inputs: 
% a,sigma.x0: HW model params
% T: the time you want to know the function value of rt
% time: market observations of zero-coupon maturities
% discount: market observations of zero-coupod discounts

% Output: xt value at T

function y = xt(x0,a,sigma,T,time,discount)
    
    dW = norminv(rand());
    M = sigma^2/(a^2)*(1-exp(-a*T))-sigma^2/(2*a^2)*(exp(-a*(T-T))-exp(-a*(T+T)));
    vol = sqrt(sigma^2/(2*a)*(1-exp(-2*a*T)));
    y = x0*exp(-a*T)-M +vol*dW;
    
end

