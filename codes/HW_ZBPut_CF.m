% This function we calculate the HW ZBP analytical price

% Inputs: 
% a,sigma.r0: HW model params
% T,S: two time points for the ZBP
% P_1, P: their corresponding market discount rate
% X: strike

% Output: HW ZBP analytical price

function y = HW_ZBPut_CF(a,sigma,r0,f0,T,S,P_1,P,X)
       
    BTS = (1/a)*(1 - exp(-a*(S-T)));
    sigmap = sigma * sqrt((1 - exp(-2*a*T))/(2*a)) * BTS;
    h = (1/sigmap) * log(HW_ZBPrice_CF(a,sigma,r0,f0,S,P)/(HW_ZBPrice_CF(a,sigma,r0,f0,T,P_1)*X)) + sigmap/2;
    y = X*HW_ZBPrice_CF(a,sigma,r0,f0,T,P_1)*normcdf(-h + sigmap) - HW_ZBPrice_CF(a,sigma,r0,f0,S,P) * normcdf(-h);
    
    
end 

