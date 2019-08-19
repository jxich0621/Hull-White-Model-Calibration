% This function is used to compute the Hull-White cap value 
% Inputs: 
% a,sigma,r0: HW model params
% f0: the instantaneous forward rate at time 0
% this_cap: one cell_unit (matrix) that contains the reset dates, strike,
% implied vol and discount rates for one cap 

% output: Hull-White cap value for the certain cap info

function y = HW_Cap(a,sigma,r0,f0,this_cap)
    
    h = length(this_cap);
    
    f = 0;
    
    for i = 2:h
        
        f = f + HW_Caplets(a,sigma,r0,f0,this_cap(i-1,1),this_cap(i,1),this_cap(i-1,2),this_cap(i,2),this_cap(i,3));
        
    end 
    
    y = f;
    
end
