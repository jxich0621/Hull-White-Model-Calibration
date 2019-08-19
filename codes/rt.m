% in this function we calculate the r(t) process

% Inputs: 
% a,sigma.r0: HW model params
% T: the time you want to know the function value of rt
% time: market observations of zero-coupon maturities
% discount: market observations of zero-coupod discounts

% Output: rt value at T


function y = rt(r0,a,sigma,T,time,discount)
    
    dW = norminv(rand());
    vol = sqrt(sigma^2/(2*a)*(1-exp(-2*a*T)));
    y = r0*exp(-a*T)+ alphat(T,a,sigma,time,discount)-alphat(0,a,sigma,time,discount)*exp(-a*T) + vol*dW;

end

