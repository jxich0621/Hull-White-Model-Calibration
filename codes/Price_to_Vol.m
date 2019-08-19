% This function we convert the capprice to implied volatility
% based on the function Black_Cap_Pricing_With_Vol.m

function y = pricetovol2(this_cap, capprice)
    
    
    obj_fun = @(vol) (Black_Cap_Pricing_With_Vol(this_cap,vol) - capprice)^2;
    vol0 = 0.3;
    
    y = fmincon(obj_fun,vol0);
    
end 