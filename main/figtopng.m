function figtopng()
open H2-1_DC1_hdiv.fig %open your fig file, data is the name I gave to my file
D=get(gca,'Children'); %get the handle of the line object
XData=get(D,'XData'); %get the x data
YData=get(D,'YData'); %get the y data
close all
open H2-1_DC1_vdiv.fig %open your fig file, data is the name I gave to my file
D=get(gca,'Children'); %get the handle of the line object
X1Data=get(D,'XData'); %get the x data
Y1Data=get(D,'YData'); %get the y data
close all
plot(XData,YData,X1Data,Y1Data,'LineWidth',2)
xlabel('Number of parts')
ylabel('I, arb. u.')
legend('2AA','5AA','8AA','Location','southeast')
title('Height = 15 cm, length = 15 m')
grid on