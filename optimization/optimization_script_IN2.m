model = mccode('IN-2_opt');
fix(model, 'all');
model.source_lambda_min=3.9;
model.source_lambda_max=4.1;
model.nose_length = 'free'; model.nose_length = [0.5 2 5];
%model.guide_start_width = 'free'; model.guide_start_width = [0.05 0.07 0.1];
model.guide_start_height = 'free'; model.guide_start_height = [0.1 0.15 0.2];
%model.guide_start_height=0.15;
%model.loutw = 'free'; model.loutw = [0 0.35 2];
model.louth = 'free';  model.louth = [0 1 5];
%model.linw = 'free'; model.linw = [0 5 10];
model.linh = 'free'; 
model.linh = [0 5 10];
[parameters, fval, status, output]=fmax(model,[], ...
'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=100', nan);

a = {name {model.Parameters'; model}};
plot(model.UserData.monitors)
