% Here we want to visualize the results of interpolation
t_plot = 0:0.01:50;
discount_plot = PM(t_plot,tm,ds);
forward_plot = fM(t_plot,tm,ds,0.0001);

hold on

a = plot(tm,ds,'o',t_plot,discount_plot,':.');
b = plot(tm,ds,'o',t_plot,forward_plot,':.');
legend('market obs','zero-coupon discount','market obs', 'instantaneous forward')

hold off