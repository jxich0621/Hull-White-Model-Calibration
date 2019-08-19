% This function calculates the HW caplet price 

% Inputs: 
% a,sigma,r0: HW model params
% f0: the instantaneous forward rate at time 0
% T,S: the start and end dates for the caplet
% P_1,P: their corresponding discount rates
% X: strike

% output: Hull-White caplet value 

function y = HW_Caplets(a,sigma,r0,f0,T,S,P_1,P,X)
    
    N = 1000;
    tau = 1/4;
    Nprime = N*(1+X*tau);
    Xprime = 1/(1+X*tau);
    y = Nprime * HW_ZBPut_CF(a,sigma,r0,f0,T,S,P_1,P,Xprime);
    
end


