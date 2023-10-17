%clear;
M2=readmatrix('RadHard_Ch2_Ipush.csv','Delimiter',',');
M1=readmatrix('RadHard_Ch1_Ipush.csv','Delimiter',',');
M3=readmatrix('RadHard_Ch1_Ipull.csv','Delimiter',',');
M4=readmatrix('RadHard_Ch2_Ipull.csv','Delimiter',',');
% M2=csvread('SNR4_cc.csv',1);
% M3=csvread('SNR4_rc.csv',1);
%M4 = readmatrix('with_lin.csv','Delimiter', '\t')
%M5 = readmatrix('20G_notune.csv','Delimiter', '\t')
%M4=csvread('SFDR_0529.csv',0);
%M4=csvread('SFDR_2022.csv',0);
%M5=csvread('without_lin.csv',0);
% M5=csvread('SNR5_rc.csv',1);
 x1=M1(:,1);
 y1=M1(:,2);
 x2=M2(:,1);
 y2=M2(:,2);
 x3=M3(:,1);
 y3=M3(:,2);
 x4=M4(:,1);
 y4=M4(:,2);
 x1=transpose(x1);
 x2=transpose(x2);
 y1=transpose(y1);
 y2=transpose(y2);
 x3=transpose(x3);
 y3=transpose(y3);
 x4=transpose(x4);
 y4=transpose(y4);
 y1 = y1.*1000;
 y2 = y2.*1000;
 y3 = y3.*1000;
 y4 = y4.*1000;

 CH1_MOD = y1 - y3;
 CH2_MOD = y2 - y4;
% y3=M3(:,3);
%FREQ=flip(M4(:,1));
%GAIN=M4(:,1);
%NF=M4(:,2);
%IIP3=M4(:,3);
%SFDR=M4(:,4);
%CDR=M4(:,5);
%SFDR_wo=M5(:,4);
%IIP3_wo=M5(:,3);

grid on;
H1=plot(x1,CH1_MOD,'b-',x2,CH2_MOD,'r-');

xticks([0 32 64 96 128 160 192 224 255])
xlim([0,255])
AX=gca;
set(H1, 'LineWidth', [3.0]);
set(AX, 'FontName', 'utopia');
set(AX, 'FontSize', [17]);
set(AX, 'LineWidth', [2.0]);
HY = get(AX, 'ylabel');
set(HY, 'string', 'VCSEL Driver Current (mA)','FontName','utopia', 'FontSize', [17], 'Color', [0 0 0]);
set(AX, 'YColor', 'black');
HX = get(AX, 'xlabel');
set(HX, 'string', 'Modulation Setting (0-255, Ibias=168)','FontName','utopia', 'FontSize', [17], 'Color', [0 0 0]);
yticks([0 2 4 6 8 10 12 14])
ylim([0,14])
set(gcf,'color','white')
legend('AX',{'Channel 1','Channel 2'},'Location','Northwest');

grid on;

%resolution1 = mean(gradient(y1(:,1:128)));
%resolution2 = mean(gradient(y2(:,1:128)));
resolution1 = mean(gradient(y1));
resolution2 = mean(gradient(y2));

