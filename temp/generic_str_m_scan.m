m_min = 1; m_step = 0.2; m_max = 5;
m_value = m_min:m_step:m_max;
[p_s,m_s]=mcstas('generic_straight.instr',struct('guide_length', 12, 'm_side', m_min:m_step:m_max, 'm_top', 6,...
    'sample_height', 0.01, 'sample_width', 0.01,...
    'guide_start_width',0.03, 'guide_start_height',0.1, 'source_lambda_min',4.85, 'source_lambda_max',4.95, 'cold_regime',1),struct('ncount',1e5));
[p_t,m_t]=mcstas('generic_straight.instr',struct('guide_length', 12, 'm_side', 1, 'm_top', m_min:m_step:m_max,...
    'sample_height', 0.01, 'sample_width', 0.01,...
    'guide_start_width',0.03, 'guide_start_height',0.1, 'source_lambda_min',4.85, 'source_lambda_max',4.95, 'cold_regime',1),struct('ncount',1e5));
figure;
errorbar(m_value,p_s.Signal,p_s.Error,'LineWidth',2);hold on;
errorbar(m_value,p_t.Signal,p_t.Error,'LineWidth',2)
xlim([m_min-0.1 m_max+0.1])
%title(strjoin({name,', total flux = ',sprintf('%5.2e  %5.2e ',p(1,1).Signal)}))
grid on
xlabel('m')
ylabel('I, arb.u.')
legend('side','top')
%title(strjoin({'Total flux = ',num2str(I)}))
print(gcf,strjoin({'m_scan', '_generic_staight'}),'-dpng','-r300')