% H3-4B_LIRA.instr
%guide_start_width = 0.062;
%guide_start_height = 0.15;
%source_lambda_min = 2;
%source_lambda_max = 20;
%max_nose_length = 16;
%vfoc
%	250, 40 ширина, 2-20А

% H3-4A_SONATA.instr
%	400, 10 высота, 2-20А
%guide_start_width = 0.062;
%guide_start_height = 0.15;
%source_lambda_min = 2;
%source_lambda_max = 20;
%max_nose_length = 16;
%vfoc

% H3-3A_CLEO.instr
%guide_start_width = 0.062;
%guide_start_height = 0.15;
%source_lambda_min = 2;
%source_lambda_max = 20;
%max_nose_length = 16;
%vfoc
%	150;500 mm до образца, размер образца 10;30 ширина, высота 30, длина волны 5А

% H3-1_IN2.instr
%guide_start_width = 0.062;
%guide_start_height = 0.15;
%source_lambda_min = 2;
%source_lambda_max = 20;
%max_nose_length = 16;
%vfoc

% H2-0_IN3.instr
%guide_start_width = 0.062;
%guide_start_height = 0.15;
%source_lambda_min = 2;
%source_lambda_max = 20;
%max_nose_length = 16;
%vfoc


model = mccode('H3-3A_CLEO.instr','mpi=4');
%guide_start_width = 0.062;
%guide_start_height = 0.15;
%source_lambda_min = 2;
%source_lambda_max = 20;
%max_nose_length = 16;
%vfoc
%	150;500 mm до образца, размер образца 10;30 ширина, высота 30, длина волны 5А
fix(model, 'all');
model.source_lambda_min=4.9;
model.source_lambda_max=5.1;
model.nose_length = 'free'; model.nose_length = [0.2 2 26.9];
model.guide_start_width = 0.06;%'free'; model.guide_start_width = [0.05 0.07 0.1];
model.guide_start_height = 0.2;%'free'; model.guide_start_height = [0.1 0.15 0.2];
model.loutw = 'free'; model.loutw = [0 0.35 4];
model.linw = 'free'; model.linw = [0 5 15];
model.louth = 0;%'free';  model.louth = [0 0.5 5];
model.linh = 0;%'free'; model.linh = [0 5 15];
model.sample_width = 0.01;
model.sample_height = 0.15;
model.sample_dist = 0.5;
[parameters, fval, status, output]=fmax(model,[], ...
'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=100', nan);

a = {model.Parameters';parameters};
