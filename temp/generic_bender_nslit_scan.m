H = 0.5;
R = 1000;
L = 50;
N = 3;

Lb = L - sqrt(L^2-2*R*H);
Ls = L - Lb;
%R = (Lb^2+2*Lb*Ls)/2/H;
n_chan_min = 1; n_chan_step = 1; n_chan_max = N;
model = mccode('../generic_guides/generic_curved.instr','ncount=1e6');
%model = mccode('../generic_guides/generic_curved_S_guide.instr','ncount=1e6');
name = 'H3-n Test';
parameters.sample_width=0.05;
parameters.sample_height=0.05;
parameters.guide_start_width=0.05;
parameters.guide_start_height=0.05;
parameters.source_lambda_min=2.0;
parameters.source_lambda_max=2.1;
parameters.cold_regime=1;
parameters.m_out=6;
parameters.m_in=6;
parameters.m_str_side=6;
parameters.m_top=6;

model_str = mccode('../generic_guides/generic_straight.instr','ncount=1e6');
parameters_str.guide_length = L;
parameters_str.m_str_side=6;
parameters_str.m_top=6;
parameters_str.sample_width=0.05;
parameters_str.sample_height=0.05;
parameters_str.guide_start_width=0.05;
parameters_str.guide_start_height=0.05;
parameters_str.source_lambda_min=2.0;
parameters_str.source_lambda_max=2.1;
results_str = iData(model_str,parameters_str);
sum_L_str = sum(results_str, 0);

parameters.n_chan=n_chan_min:n_chan_step:n_chan_max;
parameters.l_bender = Lb;
parameters.l_straight = Ls;
parameters.R_curv = R;
results = iData(model,parameters);
sum_Lb = sum(results, 0);
sum_Lb = sum_Lb/sum_L_str;

plot(n_chan_min:n_chan_step:n_chan_max,sum_Lb,'LineWidth',2);
title(name)
grid on
xlabel('n channels')
ylabel('transmission')
% legend
% legend('Location','south')
% print(gcf,[name 'bend_scan'],'-dpng','-r300')
% %matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
% saveas(gcf,[name 'bend_scan.fig']);