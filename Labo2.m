clear all;
close all;
figure();
hold on;
grid on;

TzewN=-20;
TwewN=20;
QgN=1000;
TpN=10;

a=0.25;
opis='';

Kcw=QgN/(TwewN-TzewN+a*(TwewN-TpN));
Kcwp=a*Kcw;
Kcp=(a*Kcw*(TwewN-TpN)/(TpN-TzewN));

Qg=[0:0.1*QgN:QgN];
Tzew=[TzewN,-10,0];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for i=1:size(Tzew,2)
    Tp=(Kcp*Kcw*Tzew(i)+Kcp*Kcwp*Tzew(i)+Kcwp*Qg+Kcw*Tzew(i)*Kcwp)/(Kcw*Kcwp+Kcw*Kcp+Kcwp*Kcp);
    Twew=(Qg+Kcw*Tzew(i)+Kcwp*Tp)/(Kcw+Kcwp);
    %Twew=(Kcp*(Tzew(i)*(Kcw+Kcwp)+Qg)+Kcwp*(Kcw*Tzew(i)+Qg))/(Kcp*(Kcw+Kcwp)+Kcw*Kcwp);
    
    title('Charakterystyka statyczna Twew')
    plot(Qg, Twew, 'r-')
    opis=[opis,sprintf('Twew%2.0f,',i)];
end
legend(strsplit(opis,','),'Location','northwest')
plot(QgN,TwewN,'o','DisplayName','TwewN')
xlabel('Qg [W]')
ylabel('Tzew [*C]')


figure();
hold on;
grid on;
opis='';
for i=1:size(Tzew,2)
    Tp=(Kcp*Kcw*Tzew(i)+Kcp*Kcwp*Tzew(i)+Kcwp*Qg+Kcw*Tzew(i)*Kcwp)/(Kcw*Kcwp+Kcw*Kcp+Kcwp*Kcp);
    Twew=(Qg+Kcw*Tzew(i)+Kcwp*Tp)/(Kcw+Kcwp);
    %Twew=(Kcp*(Tzew(i)*(Kcw+Kcwp)+Qg)+Kcwp*(Kcw*Tzew(i)+Qg))/(Kcp*(Kcw+Kcwp)+Kcw*Kcwp);
    
    title('Charakterystyka statyczna Tp')
    plot(Qg, Tp, 'k-')
    opis=[opis,sprintf('Tp%2.0f,',i)];
end
legend(strsplit(opis,','),'Location','northwest')
plot(QgN,TpN,'o','DisplayName','TpN')
xlabel('Qg [W]')
ylabel('Tzew [*C]')



