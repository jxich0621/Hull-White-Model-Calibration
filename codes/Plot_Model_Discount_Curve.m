% Plot the model discount rate curve
t_plot = 0:0.01:50;
discount_plot = PM(t_plot,tm,ds);
model_discount_plot = zeros(5001,1);
model_discount_plot(1) = 1;

for i = 1:5000
    model_discount_plot(i+1) = HW_ZBPrice_CF(a_optim,sigma_optim,r0_optim,f0,t_plot(i+1),discount_plot(i+1));
end

hold on

a = plot(tm,ds,'o',t_plot,discount_plot,':.');
b = plot(tm,ds,'o',t_plot,model_discount_plot,':.');
legend('market obs','market discount','market obs', 'model discount')

hold off