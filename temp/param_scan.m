param_min = 1; param_step = 0.2; param_max = 5;
param_value = param_min:param_step:param_max;
[p,m]=mcstas('generic_straight.instr',struct('guide_length', 12, 'param', param_min:param_step:param_max, ...
    'sample_height', 0.01, 'sample_width', 0.01,'m_top', 6,'m_side',6,...
    'guide_start_width',0.03, 'guide_start_height',0.1, 'source_lambda_min',4.85, 'source_lambda_max',4.95,...
    'cold_regime',1),struct('ncount',1e5));
figure;
errorbar(param_value,p.Signal,p.Error,'LineWidth',2);hold on;
errorbar(param_value,p.Signal,p.Error,'LineWidth',2)
xlim([param_min param_max])
%title(strjoin({name,', total flux = ',sprintf('%5.2e  %5.2e ',p(1,1).Signal)}))
grid on
xlabel('param')
ylabel('I, arb.u.')
legend('param')
%title(strjoin({'Total flux = ',num2str(I)}))
print(gcf,strjoin({'param_scan', '_1'}),'-dpng','-r300')