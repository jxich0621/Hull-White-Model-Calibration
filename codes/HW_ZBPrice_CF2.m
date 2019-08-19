% This function returns the analytical solution for zero-coupon discount
% rate in an additional way

function y = HW_ZBPrice_CF(a,sigma,r0,T,time,discount)

    B = 1/a * (1- exp(-a*(T)));
    A = PM(T,time,discount)/PM(0,time,discount) * exp(B*fM(0,time,discount,0.001) - (sigma^2/(4*a))*(1-exp(-2*a*0))*B^2);
    r = r0;
    y = A * exp(-B*r);

end