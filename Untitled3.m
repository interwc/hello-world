data1=load('l:\bnu\new_index\gud_all-l.txt');
re=ones(13,3);
data=data1(1:59,:);
for i=2:44
    re(i-1,1)=mean(data(:,1)-data(:,i));
    re(i-1,2)=sqrt(mean((data(:,1)-data(:,i)).^2));
    re(i-1,3)=corr(data(:,1),data(:,i));
end

figure('units','centimeters','position',[5,5,9,16]);
axes('units','centimeters','position',[2,11,5.5,4.2]);   

h=plot([0.5,0.9],[re(1,1),re(1,1)],'--','color',[0.5,0,1],'linewidth',1.5)
hold on
h=plot([0.5,0.9],[re(2,1),re(2,1)],'--k','linewidth',1.5)
hold on
x=[0.5:0.01:0.9];
h=plot(x,re(3:43,1),'r-','linewidth',1.5)
hold on
h=plot(x(25),re(27,1),'ro','linewidth',2)
set(gca,'ylim',[-10,15],'ytick',-10:5:15,'xlim',[0.5,0.9],'xtick',0.5:0.1:0.9,'fontsize',10,'FontName','Arial');
%xlabel('\alpha','fontsize',10)
ylabel('Bias','fontsize',10)
text(0.55,10,'a','fontsize',10,'FontName','Arial')
% legend('NDVI','PI','NDPI','\alpha=0.74','location','northwest')
% legend('boxoff','fontsize',10,'FontName','Arial')
set(gca,'XTickLabel',{' '})

axes('units','centimeters','position',[2,6.5,5.5,4.2]);   

h=plot([0.5,0.9],[re(1,2),re(1,2)],'--','color',[0.5,0,1],'linewidth',2)
hold on
h=plot([0.5,0.9],[re(2,2),re(2,2)],'--k','linewidth',2)
hold on
x=[0.5:0.01:0.9];
h=plot(x,re(3:43,2),'-r','linewidth',1.5)
hold on
h=plot(x(25),re(27,2),'ro','linewidth',2)
set(gca,'ylim',[4,20],'ytick',4:4:20,'xlim',[0.5,0.9],'xtick',0.5:0.1:0.9,'fontsize',10,'FontName','Arial');
xlabel('\alpha','fontsize',10)
ylabel('RMSE','fontsize',10)
% legend('NDVI','PI','NDPI','\alpha=0.74','location','northwest')
% legend('boxoff','fontsize',10,'FontName','Arial')
set(gca,'XTickLabel',{' '})
text(0.55,16.8,'b','fontsize',12,'FontName','Arial')
axes('units','centimeters','position',[2,2,5.5,4.2]);  

h=plot([0.5,0.9],[re(1,3),re(1,3)],'--','color',[0.5,0,1],'linewidth',2)
hold on
h=plot([0.5,0.9],[re(2,3),re(2,3)],'--k','linewidth',2)
hold on
x=[0.5:0.01:0.9];
h=plot(x,re(3:43,3),'-r','linewidth',1.5)
hold on
h=plot(x(25),re(27,3),'ro','linewidth',2)
set(gca,'ylim',[0.75,0.95],'ytick',0.75:0.05:0.95,'xlim',[0.5,0.9],'xtick',0.5:0.1:0.9,'fontsize',10,'FontName','Arial');
xlabel('\alpha','fontsize',10)
ylabel('R','fontsize',10)
legend('NDVI','PI','NDPI','\alpha=0.74','location','southwest')
legend('boxoff','fontsize',10,'FontName','Arial')
text(0.55,0.91,'c','fontsize',10,'FontName','Arial')
%set(gca,'XTickLabel',{' '})
%%
  figure('units','centimeters','position',[5,3,9,7]);
  axes('units','centimeters','position',[1.4,1,7,5.5]);
%h=plot([0.5,0.9],[re(1,3),re(1,3)],'--','color',[0.5,0,1],'linewidth',2)
%hold on
%h=plot([0.5,0.9],[re(2,3),re(2,3)],'--k','linewidth',2)
%hold on
x=ones(41,2);
x(:,1)=[0.5:0.01:0.9]';
y=mean(data(:,4:44));
y=y';
[b,bint,r,rint,stats]=regress(y,x);
yfit=b(1)*x(:,1)+b(2);
h=plot(x,mean(data(:,4:44)),'or','markersize',5)
set(gca,'ylim',[122,142],'ytick',125:5:140,'xlim',[0.5,0.9],'xtick',0.5:0.1:0.9,'fontsize',10,'FontName','Arial');
hold on
y=plot(x,yfit,'-k','linewidth',1)
text(0.55,130,'Y=-38.1X+160.2','fontsize',10,'FontName','Arial')
xlabel('\alpha','fontsize',10)
ylabel('GUD (Day of Year)','fontsize',10)
%legend('NDVI','PI','NDPI','location','southwest')
%legend('boxoff','fontsize',10,'FontName','Arial')
%%
%crop land 和 grassland在一起
figure('units','centimeters','position',[5,5,21,9]);
axes('units','centimeters','position',[2,2,5.5,5.5]);
 fgud_gpp=data1(1:32,1);
 fgud_ndvi=data1(1:32,2);
 fgud_pi=data1(1:32,3);
 fgud_ndpi=data1(1:32,28);
 
  ggud_gpp=data1(33:60,1);
 ggud_ndvi=data1(33:60,2);
 ggud_pi=data1(33:60,3);
 ggud_ndpi=data1(33:60,28);
 
let_gpp= data1(61:64,1);
let_ndvi= data1(61:64,2);
let_ndpi= data1(61:64,28);
 
h=plot(fgud_ndvi,fgud_gpp,'or');
hold on
h=plot(ggud_ndvi,ggud_gpp,'ok','markerfacecolor','k');
hold on
h=plot(let_ndvi,let_gpp,'sb');
hold on

h=plot([80,200],[80,200],'--','color',[0.6,0.6,0.6],'linewidth',2)
legend('DBF','CL/GL','CA-Let','1:1 Line','location','southeast');
legend('boxoff','fontsize',10,'FontName','Arial')
set(gca,'ylim',[80,200],'ytick',80:40:200,'xlim',[80,200],'xtick',80:40:200,'fontsize',10,'FontName','Arial');
ylabel('GUD GPP (Day of Year)','fontsize',11,'FontName','Arial')
xlabel('GUD NDVI (Day of Year)','fontsize',11,'FontName','Arial')
text(90,180,'a','fontsize',12,'FontName','Arial')
%%
'ok1'
mean(data1(1:32,1)-data1(1:32,3))
sqrt(mean((data1(1:32,1)-data1(1:32,3)).^2))
corr(data1(1:32,1),data1(1:32,3))
'ok2'
mean(data1(33:59,1)-data1(33:59,3))
sqrt(mean((data1(33:59,1)-data1(33:59,3)).^2))
corr(data1(33:59,1),data1(33:59,3))
'ok3'
mean(data1(33:64,1)-data1(33:64,3))
sqrt(mean((data1(33:64,1)-data1(33:64,3)).^2))
corr(data1(33:64,1),data1(33:64,3))
'ok4'
mean(data1(1:59,1)-data1(1:59,3))
sqrt(mean((data1(1:59,1)-data1(1:59,3)).^2))
corr(data1(1:59,1),data1(1:59,3))
'ok5'
mean(data1(1:64,1)-data1(1:64,3))
sqrt(mean((data1(1:64,1)-data1(1:64,3)).^2))
corr(data1(1:64,1),data1(1:64,28))


%%

axes('units','centimeters','position',[8,2,5.5,5.5]);
h=plot(fgud_pi,fgud_gpp,'or');
hold on
h=plot(ggud_pi,ggud_gpp,'ok','markerfacecolor','k');
hold on

h=plot([80,200],[80,200],'--','color',[0.6,0.6,0.6],'linewidth',2)
legend('DBF','CL/GL','1:1 Line','location','southeast');
legend('boxoff','fontsize',10,'FontName','Arial')
set(gca,'ylim',[80,200],'ytick',80:40:200,'xlim',[80,200],'xtick',80:40:200,'fontsize',10,'FontName','Arial');
%ylabel('GUD GPP (Day of Year)','fontsize',11,'FontName','Arial')
xlabel('GUD PI (Day of Year)','fontsize',11,'FontName','Arial')
set(gca,'YTickLabel',{' '})
text(90,180,'b','fontsize',12,'FontName','Arial')
%%

axes('units','centimeters','position',[14,2,5.5,5.5]);
h=plot(fgud_ndpi,fgud_gpp,'or');
hold on
h=plot(ggud_ndpi,ggud_gpp,'ok','markerfacecolor','k');
hold on
h=plot(let_ndpi,let_gpp,'sb');
hold on

h=plot([80,200],[80,200],'--','color',[0.6,0.6,0.6],'linewidth',2)
legend('DBF','CL/GL','CA-Let','1:1 Line','location','southeast');
legend('boxoff','fontsize',10,'FontName','Arial')
set(gca,'ylim',[80,200],'ytick',80:40:200,'xlim',[80,200],'xtick',80:40:200,'fontsize',10,'FontName','Arial');
%ylabel('GUD GPP (Day of Year)','fontsize',11,'FontName','Arial')
xlabel('GUD NDPI (Day of Year)','fontsize',11,'FontName','Arial')
set(gca,'YTickLabel',{' '})
text(90,180,'c','fontsize',12,'FontName','Arial')