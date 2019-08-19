% This function returns the analytical solution for zero-coupon discount
% rate

% Inputs: 
% a,sigma,r0: HW model params
% f0: the instantaneous forward rate at time 0
% T: ZB maturity
% P: market observation of discount for that maturity

% Output: the HW analytical solution for zero-coupon discount

function y = HW_ZBPrice_CF(a,sigma,r0,f0,T,P)

    B = 1/a * (1- exp(-a*T));
    A = P * exp(B*f0);
    r = r0;
    y = A * exp(-B*r);

end