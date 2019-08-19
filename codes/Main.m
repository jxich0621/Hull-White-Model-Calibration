% This is the main module used to calibrate the three params embedded in
% Hull White Model, i.e., a, sigma, and r_0

% The only inputs of this program are two spreadsheets. The first one,
% named zero_curve.xlsx, is the current market observations of zero-coupon  
% discounts with different maturities. We use those observations to do 
% interpolation and get a complete and continuous zero curve P_M(0,t), then 
% use that curve to further compute the instantaneous forward rate f_M(0,t)
% as well as its derivative to t. 

% The other input is the current market observations of various cap strikes
% as well as their implied vol, called vol.xlsx. These caps have different
% expiry as well as maturity, and we use these information to compute their
% market prices, and finally use the market prices to do calibration for
% our model parameters.

zero_curve = readtable('zero_curve.xlsx');
market_implied_vol_data = readtable('vol.xlsx');
market_implied_vol_data = table2array(market_implied_vol_data);
number_of_cap = length(market_implied_vol_data);
vol_market = market_implied_vol_data(:,2)/100;

% maturities of ZCB that can be observed in the market
tm = table2array(zero_curve(:,8));
tm = [0,transpose(tm)];
tm = transpose(tm);

% discount rates of ZCB corresponding to above maturities
ds = table2array(zero_curve(:,6));
ds = [1,transpose(ds)];
ds = transpose(ds);

cap_data = cell(1,number_of_cap);

for i = 1:number_of_cap
    n = 1+ round((market_implied_vol_data(i,6) - market_implied_vol_data(i,4))/0.25);
    this_cap = zeros(n,4);
    this_cap(:,1) = transpose(market_implied_vol_data(i,4) : 0.25: market_implied_vol_data(i,6));  
    this_cap(:,3) = market_implied_vol_data(i,3)/100;
    this_cap(:,4) = market_implied_vol_data(i,2)/100;
    this_cap(1,2) = PM(this_cap(1,1),tm,ds);
   
    for j = 2:n
        this_cap(j,2) = PM(this_cap(j,1),tm,ds);
    end
    
    cap_data{i} = this_cap;
    
end


cap_market_value = zeros(number_of_cap,1);

for i = 1:number_of_cap
    
    this_cap = cap_data{i};
    this_cap_value = Black_Cap_Pricing(this_cap);
    cap_market_value(i) = this_cap_value;
    
end

f0 = fM(0,tm,ds,0.0001);

obj_fun = @(param)HW_Cap_Optimizer(param(1),param(2),param(3),f0,cap_data,cap_market_value);
param0 = [0.5,0.03,0.02];
lb = [-Inf,-Inf,0];
[param,fval] = fmincon(obj_fun,param0,[],[],[],[],lb);

a_optim = param(1);
sigma_optim = param(2);
r0_optim = param(3);

cap_model_value_optim = zeros(number_of_cap,1);
vol_optim = zeros(number_of_cap,1);
   
for i = 1:number_of_cap
    this_cap = cap_data{i};
    cap_model_value_optim(i) = HW_Cap(a_optim,sigma_optim,r0_optim,f0,this_cap);
    vol_optim(i) = Price_to_Vol(this_cap,cap_model_value_optim(i));
end

precision = abs(sum(vol_optim - vol_market)/number_of_cap)

