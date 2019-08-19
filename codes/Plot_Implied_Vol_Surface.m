% Plot the volatility surfaces
expiry = market_implied_vol_data(:,4);
maturity = market_implied_vol_data(:,6);


expiry  = reshape(expiry,[12,19]);
maturity = reshape(maturity,[12,19]);
marketvol = reshape(vol_market,[12,19]);
modelvol = reshape(vol_optim,[12,19]);


surf(expiry,maturity,modelvol);
xlabel('expiry');
ylabel('maturity');
zlabel('model vol');
