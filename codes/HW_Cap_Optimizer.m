% This function returns the value of loss function between actual market
% cap prices and model cap prices, and is used for optimization

% inputs:
% a,sigma,r0: HW model params
% f0: instantaneous forward rate at time 0
% cap_data: the big cell that contains the whole 228 caps' data
% cap_market_value: the market price of the 228 caps in a column vector

% Output: loss function value

function y = HW_Cap_Optimizer(a,sigma,r0,f0,cap_data,cap_market_value)
      
   n = length(cap_market_value);
   cap_model_value = zeros(n,1);
   
   for i = 1:n
       this_cap = cap_data{i};
       cap_model_value(i) = HW_Cap(a,sigma,r0,f0,this_cap);
   end
   
   cap_diff = (cap_market_value - cap_model_value)./cap_market_value;
   cap_sqrt_diff = cap_diff.*cap_diff;
   
   y = 0.5 * sum(cap_sqrt_diff);
   
end


