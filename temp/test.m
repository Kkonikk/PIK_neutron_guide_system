L = 44.8;

model_str = mccode('../generic_guides/generic_straight.instr','ncount=1e6');
parameters_str.guide_length = L;
parameters_str.m_str_side=6;
parameters_str.m_top=6;
parameters_str.sample_width=0.05;
parameters_str.sample_height=0.05;
parameters_str.guide_start_width=0.05;
parameters_str.guide_start_height=0.05;
parameters_str.source_lambda_min=4.5;
parameters_str.source_lambda_max=4.6;
results_str = iData(model_str,parameters_str)
sum_L_str = sum(results_str, 0)