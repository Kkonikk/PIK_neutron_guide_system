function generic_bender_scan(H,L,N)
Lb_min = 1; Lb_step = 1; Lb_max = L;
n_chan_min = 1; n_chan_step = 1; n_chan_max = N;
model = mccode('../generic_guides/generic_curved.instr');
name = 'bender';
fig=figure;
hold on

    parameters.m_out=6;
    parameters.m_in=6;
    parameters.m_str_side=6;
    parameters.m_top=6;
for nchan = n_chan_min:n_chan_step:n_chan_max
    Ls = L - Lb;
    R = (Lb^2+2*Lb*Ls)/2/H;
    parameters.sample_width=0.03;
    parameters.sample_height=0.1;
    parameters.guide_start_width=0.03;
    parameters.guide_start_height=0.1;
    parameters.source_lambda_min=4.85;
    parameters.source_lambda_max=4.95;
    parameters.cold_regime=1;
    parameters.n_chan=n_chan;
    parameters.l_bender = Lb_min:Lb_step:Lb_max;
    parameters.l_straight = Ls;
    parameters.R_curv = R;
    
    
    results = iData(model,parameters);
    sum_Lb = sum(results, 0);

    plot(Lb_min:Lb_step:Lb_max,sum_Lb,'LineWidth',2,'DisplayName',['n_chan =' num2str(n_chan)]);
end

title([name ' scan L_bender'])
grid on
xlabel('Lb, m')
ylabel('I, arb.u.')
legend
% legend('Curvature radius')
% print(gcf,[name 'R_scan'],'-dpng','-r300')
% %matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
% saveas(fig,[name 'R_scan.fig']);