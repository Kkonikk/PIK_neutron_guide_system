%d = 'D:\JOB\Simulations\Neutron_guides_PIK\instruments\instr';
d = '/home/nerde/JOB/github/PIK_neutron_guide_system/main/instruments/';
files = dir(fullfile(d, '*.instr'));
filenames = {files.name};

for i = 1: length(filenames)
    [p,m]=mcstas(filenames{i},struct(),struct('ncount',1e7));
    j = 1;
    name = [];
    while strcmp(filenames{i}(j),'.') ~= 1
        name = [name, filenames{i}(j)];
        j = j + 1;
    end
    bins_l = length(m(1,1).x);
    limits_l = -m(1,1).x (1);
    limits_l = limits_l + m(1,1).x (length(m(1,1).x));
    m(1,1) = m(1,1)*bins_l/limits_l;
    bins_dx = length(m(2,1).x);
    limits_dx = -m(2,1).x (1);
    adx = m(2,1).x (1);
    bdx = m(2,1).x (length(m(2,1).x));
    limits_dx = limits_dx + m(2,1).x (length(m(2,1).x));
    m(2,1) = m(2,1)*bins_dx/limits_dx;
    bins_dy = length(m(3,1).x);
    limits_dy = -m(3,1).x (1);
    limits_dy = limits_dy + m(3,1).x (length(m(3,1).x));
    ady = m(3,1).x (1);
    bdy = m(3,1).x (length(m(3,1).x));
    m(3,1) = m(3,1)*bins_dy/limits_dy;
    figure;
    plot(m(1,1),'LineWidth',2)
    xlim([0 20])
    ylim([0 max(m(1,1))*1.1])
    grid on
    xlabel(strjoin({'lambda, ',char(197)}))
    ylabel(strjoin({'I, n/s/cm^{2}/',char(197)}))
    title(strjoin({name,', total flux = ',sprintf('%5.2e  %5.2e ',p(1,1).Signal)}))
    print(gcf,strjoin({name, '_lambda'}),'-dpng','-r300')
    savefig([name,'_lambda'])
    figure;
    plot(m(2,1),'LineWidth',2)
    xlim([adx bdx])
    ylim([0 max(m(2,1))*1.1])
    title(strjoin({name,', total flux = ',sprintf('%5.2e  %5.2e ',p(1,1).Signal)}))
    grid on
    xlabel('horisontal divergence, deg')
    ylabel('I, n/s/cm^{2}/deg')
    %title(strjoin({'Total flux = ',num2str(I)}))
    savefig([name,'_hdiv'])
    print(gcf,strjoin({name, '_hdiv'}),'-dpng','-r300')
    figure;
    plot(m(3,1),'LineWidth',2)
    xlim([ady bdy])
    ylim([0 max(m(3,1))*1.1])
    title(strjoin({name,', total flux = ',sprintf('%5.2e  %5.2e ',p(1,1).Signal)}))
    grid on
    xlabel('vertical divergence, deg')
    ylabel('I, n/s/cm^{2}/deg')
    %title(strjoin({'Total flux = ',num2str(I)}))
    savefig([name,'_vdiv'])
    print(gcf,strjoin({name, '_vdiv'}),'-dpng','-r300')
    figure;
    errorbar(m(2,1).x,m(2,1).I,m(2,1).E,'LineWidth',2);hold on;
    errorbar(m(3,1).x,m(3,1).I,m(3,1).E,'LineWidth',2)
    xlim([-max(bdx,bdy) max(bdx,bdy)])
    ylim([0 max(max(m(2,1)),max(m(3,1)))*1.1])
    title(strjoin({name,', total flux = ',sprintf('%5.2e  %5.2e ',p(1,1).Signal)}))
    grid on
    xlabel('divergence, deg')
    ylabel('I, n/s/cm^{2}/deg')
    legend('horisontal divergence','vertical divergence')
    %title(strjoin({'Total flux = ',num2str(I)}))
    savefig([name,'_hvdiv'])
    print(gcf,strjoin({name, '_hvdiv'}),'-dpng','-r300')
end
%1 - l
%2 - dx
%3 - dy
