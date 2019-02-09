L_min = 1; L_step = 1; L_max = 10;
w_min = 0.05; w_step = 0.01; w_max = 0.1;
model = mccode('../generic_guides/generic_expander.instr');
name = 'H3-4-NSE-25AA';
parameters.sample_width = 0.03;
parameters.sample_height = 0.03;
parameters.guide_sample_dist = 4;
parameters.guide_start_width=0.05;
parameters.guide_start_height=0.05;
parameters.guide_length = 90;
parameters.source_lambda_min=25;
parameters.source_lambda_max=25.1;
parameters.cold_regime = 1;
parameters.guide_exit_height = 0.05;
parameters.m_str_side = 1;
parameters.m_top = 1;
parameters.guide_exp_length = L_min:L_step:L_max;
parameters.guide_exit_width = w_min:w_step:w_max;


results = iData(model,parameters);
sum_R = results.UserData.monitors.Data.values(1);

parameters.guide_exp_length = 1;
parameters.guide_exit_width=0.05;
results_norm = iData(model,parameters);

sum_R = sum_R/results_norm.UserData.monitors.Data.values(1);


fig=figure;
[x,y] = meshgrid(L_min:L_step:L_max,w_min:w_step:w_max);
x = x';
y = y';
surf(x,y,sum_R)
xlabel('L, m')
ylabel('width, m')
zlabel('I, arb. u.')
title([name ' scan expander'])
saveas(fig,[name 'expander_scan.fig']);