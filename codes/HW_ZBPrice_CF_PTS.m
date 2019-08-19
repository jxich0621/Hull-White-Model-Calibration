% This function returns the analytical solution for zero-coupon discount
% rate at a future time T


function y = HW_ZBPrice_CF_PTS(a,sigma,rT,T,S,time,discount)

    B = 1/a * (1- exp(-a*(S-T)));
    A = PM(S,time,discount)/PM(T,time,discount) * exp(B*fM(T,time,discount,0.001) - (sigma^2/(4*a))*(1-exp(-2*a*T))*B^2);
    r = rT;
    y = A * exp(-B*r);

end
