% In this function we calculate the alpha function for the r(t) process.

% Inputs: 
% t: the time you want to know the function value of alpha
% a: HW model param
% sigma: HW model param
% time: market observations of zero-coupon maturities
% discount: market observations of zero-coupod discounts

% Output: alpha value

function y = alphat(t,a,sigma,time,discount)

    y = fM(t,time,discount,0.001) + sigma^2/(2*a^2) *(1-exp(-a*t))^2;

end


