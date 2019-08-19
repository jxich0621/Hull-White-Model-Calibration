% This function returns the MC simulation solution for zero-coupon discount
% rate

% Inputs: 
% a,sigma,r0: HW model params
% T: ZB maturity
% L and M: simulation times
% P: market observation of discount for that maturity
% time: market observations of zero-coupon maturities
% discount: market observations of zero-coupod discounts

% Output: the HW simulation solution for zero-coupon discount

function y = HW_ZBPrice_SM(a,sigma,r0,T,L,M,time,discount)

    deltat = T/M;
    f = 0;
    for i = 1:L
        s = 0;
        for j=1:M
            r = rt(r0,a,sigma,j*deltat,time,discount);
            s = s + r * deltat;
        end
        f = f + exp(-s);
    end
    y = f/L;
end

