model = mccode('../generic_guides/generic_curved_mono.instr');
name = 'H3-2 NeRo m downgrade scan';
m_min = 1; m_step = 1; m_max = 6;
%H = 0.;
L = 30.7;
N = 1;
Lb = 25;
Ls = L - Lb;
%R = (Lb^2+2*Lb*Ls)/2/H;
R=900;

parameters.sample_width=0.04;
parameters.sample_height=0.01;
parameters.guide_start_width=0.03;
parameters.guide_start_height=0.2;
parameters.source_lambda_min=2.35;
parameters.source_lambda_max=2.45;
parameters.cold_regime=1;
parameters.lambda=2.4;

parameters.n_chan=N;
parameters.l_bender = Lb;
parameters.l_straight = Ls;
parameters.R_curv = R;

%top
parameters.m_top = 6;
parameters.m_out=6;
parameters.m_in=6;
parameters.m_str_side=6;

parameters.m_top = m_min:m_step:m_max;
results_top = iData(model,parameters);
sum_top = sum(results_top, 0);

%top
parameters.m_out=6;
parameters.m_in=6;
parameters.m_str_side=6;

parameters.m_top = m_min:m_step:m_max;
results_top = iData(model,parameters);
sum_top = sum(results_top, 0);

%out
parameters.m_top = 6;
parameters.m_in=6;
parameters.m_str_side=6;

parameters.m_out = m_min:m_step:m_max;
results_out = iData(model,parameters);
sum_out = sum(results_out, 0);

%in
parameters.m_top = 6;
parameters.m_out=6;
parameters.m_str_side=6;

parameters.m_in = m_min:m_step:m_max;
results_in = iData(model,parameters);
sum_in = sum(results_in, 0);

%str_side
parameters.m_top = 6;
parameters.m_out=6;
parameters.m_in=6;

parameters.m_str_side = m_min:m_step:m_max;
results_str_side = iData(model,parameters);
sum_str_side = sum(results_str_side, 0);



figure
plot(m_min:m_step:m_max,sum_top,m_min:m_step:m_max,sum_out,m_min:m_step:m_max,sum_in,m_min:m_step:m_max,sum_str_side,'LineWidth',2);
title(name)
grid on
xlabel('m')
ylabel('I, arb. u.')
legend('top','out','in','str_side','Location','south')
print(gcf,[name 'm_downgrade_scan'],'-dpng','-r300')
%matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
saveas(gcf,[name 'm_downgrade_scan.fig']);