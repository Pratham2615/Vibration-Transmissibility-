% (k^2+c^2*44.86^2)/((k-(m+1.1)*44.86^2)^2+c^2*44.86^2)=65.01
% 
close all

f=linspace(4,12,50);
% k=6340.13;
% m=1.76205;
% c=11.9163;
% c=17.7892;
% k=9464.87;
% m=3.17261;
m=1.9;
k=6300.69;
c=14.46;


T=[];
for i=f
    t=((k^2+c^2*(2*pi*i)^2)/((k-(m)*(2*pi*i)^2)^2+c^2*(2*pi*i)^2))^0.5;
    T=[T;t];
end

f1=[2.57,4.54,4.8,5.2,5.55,5.95,6.57,7.24,7.35,7.93,8.33,8.62,8.77,9.09,9.43,9.8];
omega_case1=2*pi.*f1';
X=[46.4,75.2,76.8,83.2,96.4,106.4,117,149,165,238,362,512,542,584,516,396];
Y=[60,66,70,76,76,76,76,76,76,76,76,76,76,76,76,76];
base_reading=Y';
X_case1=X';
r1=table(omega_case1,base_reading)
r2=table(omega_case1,X_case1)

Amp_case2=[56.2, 87.6, 114.3, 142, 436, 454.2, 342, 307, 267, 185, 144, 137, 125, 118, 105, 68];
f_case2=[4.08, 4.87, 5.91, 6.09, 7.08, 7.36, 7.74, 7.97 , 8.19, 8.47, 8.62, 9.10, 9.21, 9.56 , 9.9, 10.7 ];


f_case3=[4.24, 5.15, 5.38, 5.93, 6.13, 6.52, 6.85, 7.01, 7.51, 7.72, 8.42, 8.65, 9.03, 9.57, 10, 10.67 ];
Amp_case3=[74.3, 104, 109.4, 153, 178, 379.2, 473, 526, 531, 383.1, 203, 171, 149, 119, 112, 94 ];
omega_case2=2*pi.*f_case2';
omega_case3=2*pi.*f_case3';
X_case2=Amp_case2';
X_case3=Amp_case3';
r3=table(omega_case2,X_case2)
r4=table(omega_case3,X_case3)

figure;
plot(f,T)
xlabel('Angular Frequency (\omega)')
ylabel('Transmissibility')
hold on

plot(f1,X./Y,'--')
hold on

plot(f_case2,Amp_case2./Y,'-x','MarkerSize', 9)
hold on 

plot(f_case3,Amp_case3./Y,'-o')

legend('Theoretical','w/o extra mass w/ damping','w/ extra mass w/ damping', 'w/ extra mass w/o damping' ,'Location','northwest')
hold off

figure;
plot(f1,X./Y)
xlabel('Angular Frequency (\omega)')
ylabel('Transmissibility')
legend('w/o extra mass w/ damping','Location', 'northwest')

figure;
plot(f_case2,Amp_case2./Y,'MarkerSize', 9)
xlabel('Angular Frequency (\omega)')
ylabel('Transmissibility')
legend('w extra mass w/ damping','Location', 'northwest')

figure;
plot(f_case3,Amp_case3./Y)
xlabel('Angular Frequency (\omega)')
ylabel('Transmissibility')
legend('w extra mass w/o damping','Location', 'northwest')
