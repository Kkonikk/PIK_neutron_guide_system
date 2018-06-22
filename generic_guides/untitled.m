ncount=1e4;


%[p1,m]=mcstas('generic_half_elliptic_nose',struct('guide_length',100,'nose_length',1:1:20,'m_side',2,'m_top',6,'focal_dist',0.5,'R0',0.99,'alpha',3.3,'sample_height',0.01, 'guide_start_width', 0.03, 'guide_start_height', 0.2, 'source_lambda_min', 2, 'source_lambda_max', 2.1, 'cold_regime',1),struct('ncount',ncount,'compile','yes'));
%[p2,m]=mcstas('generic_half_elliptic_nose',struct('guide_length',100,'nose_length',1:1:20,'m_side',2,'m_top',6,'focal_dist',0.5,'R0',0.99,'alpha',3.3,'sample_height',0.01, 'guide_start_width', 0.03, 'guide_start_height', 0.2, 'source_lambda_min', 5, 'source_lambda_max', 5.1, 'cold_regime',1),struct('ncount',ncount,'compile','yes'));
%[p3,m]=mcstas('generic_half_elliptic_nose',struct('guide_length',100,'nose_length',1:1:20,'m_side',2,'m_top',6,'focal_dist',0.5,'R0',0.99,'alpha',3.3,'sample_height',0.01, 'guide_start_width', 0.03, 'guide_start_height', 0.2, 'source_lambda_min', 10, 'source_lambda_max', 10.1, 'cold_regime',1),struct('ncount',ncount,'compile','yes'));

figure;
plot(p1.signal,'-','LineWidth',3)
hold on;
plot(p2.signal,'--','LineWidth',3)
hold on;
plot(p3.signal,'.','LineWidth',3)
title('Скан по длине носа');
legend('2 АА', '5 АА', '10 АА');
xlabel('Длина носа');
ylabel('Интенсивность');