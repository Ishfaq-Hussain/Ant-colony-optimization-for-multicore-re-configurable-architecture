 for vi=3:3:21
    save('vi.mat','vi')
    clc
    clear all
    close all
    load('vi.mat')
maxit= vi;
Ncity=3 ; 
Nants=9; 
c=.25:.25:6;
xcity=[1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3];
ycity=[9 8 7 6 5 4 3 2 1 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 4 3 2 1];
cy = [80361015.4 80361015.4 80361015.4 81675785.6 78525665.8 78577508 78477295.2 79694364 80892262.6]
%%
%variables for generalization
t_cond=[2.4076 2.7134 3.0825]
p_cond=[.323 .7286 1.7525e-10] 
cas=1;cae=9;
cos=10;coe=25;
fs=26;fe=29;
Ncity=3;

ccf=[1 2 4 8 16 32 64 128 256 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 16 20 25 33];

%maxit=25; 
%a=3;b=3;
rr=0.5;Q=sum(1./(1:8));dbest=9999999;e=1;%a=phmone weight,b=heuristic weight
cons_pow=[.3232 4 1.7525*10^-8]
cons_thr=[2.4078 2.7134 3.0825]

ai=0;
%for a=1:1:2     %for various values of pheramone and heuristic weights
for a=.25:.25:2;
xi=0;
ai=ai+1;
    for b=.25:.25:6  %
%%
%MATRIX
xi=xi+1;
%POWER CONSUMPTION
dcity=zeros(25,29);%power consumption for caches
dcity(1,1:9)=[.0857 .102 .137 .207 .329 .365 .448 .548 .687];
dcity(2,1:9)=dcity(1,1:9);dcity(3:4,1:9)=dcity(1:2,1:9);dcity(5:8,1:9)=dcity(1:4,1:9);dcity(9,1:9)=dcity(1,1:9);

dcity(1,10:25)=[1:1:16];%power consumption for cores
dcity(2,10:25)=dcity(1,10:25);dcity(3:4,10:25)=dcity(1:2,10:25);dcity(5:8,10:25)=dcity(1:4,10:25);
dcity(9:16,10:25)=dcity(1:8,10:25);

dcity(10,26:29)=[1.31E-08 1.54E-08 1.87E-08 2.29E-08];%power consumption for frequency
dcity(11,26:29)=dcity(10,26:29);dcity(12:13,26:29)=dcity(10:11,26:29);dcity(14:17,26:29)=dcity(10:13,26:29);
dcity(18:25,26:29)=dcity(10:17,26:29);
dcity=double(dcity)

%THROUGHPUT MATRIX
thr=zeros(25,29); %throughput for cache
thr(1,1:9)=[2.46 2.48 2.39 2.38 2.38 2.42 2.46 2.36 2.34];
thr(2,1:9)=thr(1,1:9);thr(3:4,1:9)=thr(1:2,1:9);thr(5:8,1:9)=thr(1:4,1:9);thr(9,1:9)=thr(1,1:9);

thr(1,10:25)=[1.00 1.60 2.00 2.2857 2.50 2.6667 2.80 2.90 3.0 3.0769 3.1429 3.2000 3.25 3.2941 3.33 3.3684];%throughput for cores
thr(2,10:25)=thr(1,10:25);thr(3:4,10:25)=thr(1:2,10:25);thr(5:8,10:25)=thr(1:4,10:25);thr(9,10:25)=thr(1,10:25);

thr(10,26:29)=[4.22 3.37 2.70 2.04];%throughput for frequency
thr(11,26:29)=thr(10,26:29);thr(12:13,26:29)=thr(10:11,26:29);thr(14:17,26:29)=thr(10:13,26:29);thr(18:25,26:29)=thr(10:17,26:29);
thr=double(thr);

%visiability matrix
vis=1./dcity;

%phrmone matrix
phmone=zeros(25,29);
phmone(1:9,1:25)=.1.*ones(9,25);
phmone(10:25,26:29)=.1.*ones(16,4);
cd ../
load bil.mat
load ish.mat
cd 'various iterations'/
%TOUR MATRIX
% for ic=1:Nants
% tour(ic,1:9)=randperm(9);tour(ic,10:25)=(randperm(16)+9);tour(ic,26:29)=(randperm(4)+25);
% end % ic
% tour1(1:9,1)=1:9;
% 
% tour1=repmat(tour1,1,4);
%%
%ACTION CHOICE RULE CALCULATION
for it=1:maxit
for ia=1:Nants
for iq=2:4
    
    if(iq==2)
        st=tour(ia,cas); nxt=tour(ia,cas:cae);
    elseif (iq==3)
        st=tour(ia,cas); nxt=tour(ia,cos:coe);
    else
        st=tour(ia,cos); nxt=tour(ia,fs:fe);
    end
    

prob=((phmone(st,nxt).^a).*(vis(st,nxt).^b))./(sum((phmone(st,nxt).^a).*(vis(st,nxt).^b)));
%rcity=rand;                %VARAIBLE PROBABILITY
rcity=.6;                   %FIX PROBABILITY
RI=0;
for iz=1:length(prob)
%if rcity<prob(iz)              %EXPLOITATION

    if rcity<sum(prob(1:iz))      %EXPLORATION
        if(iq==2)
        newcity=tour(ia,iz);temp=tour(ia,cas);                       %ACCESSMENT
        tour(ia,iz)=temp;tour(ia,cas)=newcity;tour1(ia,2)=newcity ;   %REPLACEMENT
        elseif(iq==3)
            newcity=tour(ia,iz+cae);temp=tour(ia,cos);                    %ACCESSMENT
            tour(ia,iz+cae)=temp;tour(ia,cos)=newcity;tour1(ia,3)=newcity;  %REPLACEMENT
        else
            newcity=tour(ia,iz+coe);temp=tour(ia,fs);                    %ACCESSMENT
            tour(ia,iz+coe)=temp;tour(ia,fs)=newcity;tour1(ia,4)=newcity;  %REPLACEMENT
        end

break
end % if(CONDITION)
end % iz(PROBABILITY LENGTH)
end % iq(CACHE,CORE OR FREQUENCY CLUSTER)
end % ia(ANT INDEX)

%%
%LOCAL PHEROMONE UPDATE
phtemp=zeros(25,29);
for ic=1:Nants
dist(ic,1)=0;
total_thr(ic,1)=0;

in_ca=tour1(ic,2);
dist(ic,1) = dcity(tour1(ic,2),tour1(ic,3))*(dcity(tour1(ic,3),tour1(ic,4))*cy(in_ca) - .0102 + dcity(tour1(ic,1),tour1(ic,2)));   %total power consumption
total_thr(ic,1)=thr(tour1(ic,2),tour1(ic,3))+thr(tour1(ic,1),tour1(ic,2))*thr(tour1(ic,3),tour1(ic,4));  %TOTAL THROUGHPUT CALCULATION

for id=1:Ncity
if (dcity(tour1(ic,id),tour1(ic,id+1))<=p_cond(id) && thr(tour1(ic,id),tour1(ic,id+1))>=t_cond(id)) %LOCAL TRAIL UPDATE CONDITION
    phtemp(tour1(ic,id),tour1(ic,id+1))= Q/dist(ic,1) ; %%%LOCAL TRAIL UPDATING(REWARD)
else
    phtemp(tour1(ic,id),tour1(ic,id+1))=-Q/dist(ic,1);  %%%LOCAL TRAIL UPDATING(PUNISHMENT)
end%  if(LOCAL CONSTRAINT)

end % id(NO OF CLUSTERS)
end % ic(NO OF ANTS)
    

%% %GLOBAL TRAIL UPDATE
% DESCRIPTIVE TEXT
[dmin]=min(dist);
bi=0;
best=0;
for chk=1:length(dist)
%if(dist(chk)<dbest  &  total_thr(chk) >= .6 )
if(dist(chk)<=20.793  & total_thr(chk)>=9.8673 )        %Global constraint
  %dbest=dmin;
bi=bi+1;
best(bi)=dist(chk);
in(bi)=chk;
  %dbest=dist(chk);
  % ind=chk;
end% chk
end % if

[dbest,i]=min(best);
ind=in(i);
ph1=zeros(25,29);

%%%GLOBAL TRAIL UPDATING
for id=1:Ncity
ph1(tour1(ind,id),tour1(ind,id+1))=Q/dbest ;   
end % id

%overall trail update
phmone=(1-rr)*phmone+phtemp+e*ph1 ;    
dd(it,:)=[dbest dmin];
[it dmin dbest];
%disp('[it dmin dbest]');
end %it
%% Results storage
%index of cache core and frequency
ca1(xi,ai)=tour1(ind,2);
co1(xi,ai)=tour1(ind,3);
fr1(xi,ai)=tour1(ind,4);


%power consumption of cache core and frequency
ca_p(xi,ai)=dcity(1,ca1(xi,ai))
co_p(xi,ai)=dcity(1,co1(xi,ai))
fr_p(xi,ai)=dcity(10,fr1(xi,ai))

%Throughput of cache core and frequency
ca_t(xi,ai)=thr(1,ca1(xi,ai))
co_t(xi,ai)=thr(1,co1(xi,ai))
fr_t(xi,ai)=thr(10,fr1(xi,ai))


clear tour1

end %b(heuristic weight)
end %a(pheromone weight)

%cache core and frequency storage
ca_1=ccf(ca1);
co_1=ccf(co1);
fr_1=ccf(fr1)
    res=strcat('ca1',num2str(vi),'.mat' )
    save(res,'ca_1')
    res=strcat('co1',num2str(vi),'.mat' )
    save(res,'co_1')
    res=strcat('fr1',num2str(vi),'.mat' )
    save(res,'fr_1')
    
%total power and throughput computation and storage 
    for i=1:8
    tot_thr(:,i)=thr(1,(ca1(:,i))')+(thr(1,(co1(:,i))').*thr(10,(fr1(:,i))'))
    end
    for i=1:8
    tot_pow(:,i) = dcity(1,co1(:,i)).*(dcity(10,fr1(:,i)).*cy(1,ca1(:,i)) - .0102 + dcity(1,ca1(:,i)))
    end
    tot_pow = tot_pow ./ 40.4677;
    
    res=strcat('tot_pow',num2str(vi),'.mat' )
    save(res,'tot_pow')
    res=strcat('tot_thr',num2str(vi),'.mat' )
    save(res,'tot_thr')
    
 
 end %vi(various iterations)

%%
%RESULT DISPLAY




%%power consumption plot for a=1,b=1:.25:6
figure(1)
plot(c,ca_p(1:24,1),'ko-','linewidth',2,'color',[0 0 1])%,'color',[0 0 1],'marker','*')
hold all
plot(c,ca_p(1:24,2),'k*-','linewidth',2','color',[0 1 1])%'linewidth',2,'color',[0 1 1],'marker','o')
plot(c,ca_p(1:24,3),'ks:','linewidth',2,'color',[1 0 1])%'linewidth',2,'color',[1 0 1],'marker','s')
plot(c,ca_p(1:24,4),'kd:','linewidth',2,'color',[1 0 0])%'linewidth',2,'color',[1 1 1],'marker','d')
plot(c,ca_p(1:24,5),'k^-.','linewidth',2,'color',[0 0 0])%'linewidth',2,'color',[1 1 0],'marker','x')
plot(c,ca_p(1:24,6),'k.-.','linewidth',2,'color',[0 1 0])%'linewidth',2,'color',[0 1 0],'marker','v')

hold off
grid on
h_leg=legend('Ph-wt=.25','Ph-wt=.50','Ph-wt=.75','Ph-wt=1','Ph-wt=1.25','Ph-wt=1.5','location','northeast')
set(h_leg,'fontsize',10,'fontweight','bold')
%plot(xcity(tour1(ind,:)),ycity(tour1(ind,:)),xcity,ycity,'o')
%axis square
%axis([0 1 0 6])
%title('power consumption for cache')
xlabel('Heuristic weight','fontsize',12,'fontweight','bold')
ylabel('Energy consumption(J)','fontsize',12,'fontweight','bold')


figure(2)


plot(c,ca_t(1:24,1),'ko-','linewidth',2,'color',[0 0 1])%'linewidth',2,'color',[0 0 1],'marker','*')
hold all
plot(c,ca_t(1:24,2),'k*-','linewidth',2,'color',[0 1 1])%'linewidth',2,'color',[0 1 1],'marker','o')
plot(c,ca_t(1:24,3),'ks:','linewidth',2,'color',[1 0 1])%'linewidth',2,'color',[1 0 1],'marker','s')
plot(c,ca_t(1:24,4),'kd:','linewidth',2,'color',[1 0 0])%'linewidth',2,'color',[1 1 1],'marker','d')
plot(c,ca_t(1:24,5),'k^-.','linewidth',2,'color',[0 0 0])%'linewidth',2,'color',[1 1 0],'marker','x')
plot(c,ca_t(1:24,6),'k.-.','linewidth',2,'color',[0 1 0])%'linewidth',2,'color',[0 1 0],'marker','v')

hold off
%plot(c,co(1:24,1),'linewidth',1,'color',[0 1 0],'marker','o')
%plot(c,fr(1:24,1),'linewidth',1,'color',[1 0 0],'marker','s')
grid on
h_leg=legend('Ph-wt=.25','Ph-wt=.50','Ph-wt=.75','Ph-wt=1','Ph-wt=1.25','Ph-wt=1.5','location','northeast')
set(h_leg,'fontsize',10,'fontweight','bold')
%plot(xcity(tour1(ind,:)),ycity(tour1(ind,:)),xcity,ycity,'o')
%axis square
%axis([0 1 0 6])
%title('Through put variation for cache')
xlabel('Heuristic weight','fontsize',12,'fontweight','bold')
ylabel('Throughput variation','fontsize',12,'fontweight','bold')







figure(3)
plot(c,co_p(1:24,1),'ko-','linewidth',2,'color',[0 0 1])%'linewidth',2,'color',[0 0 1],'marker','*')
hold all
plot(c,co_p(1:24,2),'k*-','linewidth',2,'color',[0 1 1])%'linewidth',2,'color',[0 1 1],'marker','o')
plot(c,co_p(1:24,3),'ks:','linewidth',2,'color',[1 0 1])%'linewidth',2,'color',[1 0 1],'marker','s')
plot(c,co_p(1:24,4),'kd:','linewidth',2,'color',[1 0 0])%'linewidth',2,'color',[1 1 1],'marker','d')
plot(c,co_p(1:24,5),'k^-.','linewidth',2,'color',[0 0 0])%'linewidth',2,'color',[1 1 0],'marker','x')
plot(c,co_p(1:24,6),'k.-.','linewidth',2,'color',[0 1 0])%'linewidth',2,'color',[0 1 0],'marker','v')

hold off
grid on


h_leg=legend('Ph-wt=.25','Ph-wt=.50','Ph-wt=.75','Ph-wt=1','Ph-wt=1.25','Ph-wt=1.5','location','northeast')
set(h_leg,'fontsize',10,'fontweight','bold')
%plot(xcity(tour1(ind,:)),ycity(tour1(ind,:)),xcity,ycity,'o')
%axis square
%axis([0 1 0 6])
%title('power consumption for core')
xlabel('Heuristic weight','fontsize',12,'fontweight','bold')
ylabel('Energy consumption(J)','fontsize',12,'fontweight','bold')


figure(4)


plot(c,co_t(1:24,1),'ko-','linewidth',2,'color',[0 0 1])%'linewidth',2,'color',[0 0 1],'marker','*')
hold all
plot(c,co_t(1:24,2),'k*-','linewidth',2,'color',[0 1 1])%'linewidth',2,'color',[0 1 1],'marker','o')
plot(c,co_t(1:24,3),'ks:','linewidth',2,'color',[1 0 1])%'linewidth',2,'color',[1 0 1],'marker','s')
plot(c,co_t(1:24,4),'kd:','linewidth',2,'color',[1 0 0])%'linewidth',2,'color',[1 1 1],'marker','d')
plot(c,co_t(1:24,5),'k^-.','linewidth',2,'color',[0 0 0])%'linewidth',2,'color',[1 1 0],'marker','x')
plot(c,co_t(1:24,6),'k.-.','linewidth',2,'color',[0 1 0])%'linewidth',2,'color',[0 1 0],'marker','v')

hold off
grid on
h_leg=legend('Ph-wt=.25','Ph-wt=.50','Ph-wt=.75','Ph-wt=1','Ph-wt=1.25','Ph-wt=1.5','location','northeast')
set(h_leg,'fontsize',10,'fontweight','bold')
%plot(xcity(tour1(ind,:)),ycity(tour1(ind,:)),xcity,ycity,'o')
%axis square
%axis([0 1 0 6])
%title('Through put variation for core')
xlabel('Heuristic weight','fontsize',12,'fontweight','bold')
ylabel('Throughput variation','fontsize',12,'fontweight','bold')



figure(5)
plot(c,fr_p(1:24,1),'ko-','linewidth',2,'color',[0 0 1])%'linewidth',2,'color',[0 0 1],'marker','*')
hold all
plot(c,fr_p(1:24,2),'k*-','linewidth',2,'color',[0 1 1])%'linewidth',2,'color',[0 1 1],'marker','o')
plot(c,fr_p(1:24,3),'ks:','linewidth',2,'color',[1 0 1])%'linewidth',2,'color',[1 0 1],'marker','s')
plot(c,fr_p(1:24,4),'kd:','linewidth',2,'color',[1 0 0])%'linewidth',2,'color',[1 1 1],'marker','d')
plot(c,fr_p(1:24,5),'k^-.','linewidth',2,'color',[0 0 0])%'linewidth',2,'color',[1 1 0],'marker','x')
plot(c,fr_p(1:24,6),'k.-.','linewidth',2,'color',[0 1 0])%'linewidth',2,'color',[0 1 0],'marker','v')

hold off
grid on
h_leg=legend('Ph-wt=.25','Ph-wt=.50','Ph-wt=.75','Ph-wt=1','Ph-wt=1.25','Ph-wt=1.5','location','northeast')
set(h_leg,'fontsize',10,'fontweight','bold')
%plot(xcity(tour1(ind,:)),ycity(tour1(ind,:)),xcity,ycity,'o')
%axis square
%axis([0 1 0 6])
%title('power consumption for frequency')
xlabel('Heuristic weight','fontsize',12,'fontweight','bold')
ylabel('Energy consumption(J)','fontsize',12,'fontweight','bold')



figure(6)

plot(c,co_t(1:24,1),'ko-','linewidth',2,'color',[0 0 1])%'linewidth',2,'color',[0 0 1],'marker','*')
hold all
plot(c,fr_t(1:24,2),'k*-','linewidth',2,'color',[0 1 1])%'linewidth',2,'color',[0 1 1],'marker','o')
plot(c,fr_t(1:24,3),'ks:','linewidth',2,'color',[1 0 1])%'linewidth',2,'color',[1 0 1],'marker','s')
plot(c,fr_t(1:24,4),'kd:','linewidth',2,'color',[1 0 0])%'linewidth',2,'color',[1 1 1],'marker','d')
plot(c,fr_t(1:24,5),'k^-.','linewidth',2,'color',[0 0 0])%'linewidth',2,'color',[1 1 0],'marker','x')
plot(c,fr_t(1:24,6),'k.-.','linewidth',2,'color',[0 1 0])%'linewidth',2,'color',[0 1 0],'marker','v')

hold off
grid on

h_leg=legend('Ph-wt=.25','Ph-wt=.50','Ph-wt=.75','Ph-wt=1','Ph-wt=1.25','Ph-wt=1.5','location','northeast')
set(h_leg,'fontsize',10,'fontweight','bold')
%plot(xcity(tour1(ind,:)),ycity(tour1(ind,:)),xcity,ycity,'o')
%axis square
%axis([0 1 0 6])
%title('Through put variation for frequency')
xlabel('Heuristic weight','fontsize',12,'fontweight','bold')
ylabel('Throughput variation','fontsize',12,'fontweight','bold')


%%i need to store 24 results for cache core and frequency

cache_sol=ccf(ca1)
core_sol=ccf(co1)
freq_sol=ccf(fr1)

%%%%total power consumption and throughput%%%
for i=1:8
    tot_thr(:,i)=thr(1,(ca1(:,i))')+(thr(1,(co1(:,i))').*thr(10,(fr1(:,i))'))
end

for i=1:8
    tot_pow(:,i) = dcity(1,co1(:,i)).*(dcity(10,fr1(:,i)).*cy(1,ca1(:,i)) - .0102 + dcity(1,ca1(:,i)))
end
tot_pow = tot_pow ./ 40.4677;
figure(7)
plot(c,tot_pow(1:24,1),'ko-','linewidth',2,'color',[0 0 1])%'linewidth',2,'color',[0 0 1],'marker','*')
hold all
plot(c,tot_pow(1:24,2),'k*-','linewidth',2,'color',[0 1 1])%'linewidth',2,'color',[0 1 1],'marker','o')
plot(c,tot_pow(1:24,3),'ks:','linewidth',2,'color',[1 0 1])%'linewidth',2,'color',[1 0 1],'marker','s')
plot(c,tot_pow(1:24,4),'kd:','linewidth',2,'color',[1 0 0])%'linewidth',2,'color',[1 1 1],'marker','d')
plot(c,tot_pow(1:24,5),'k^-.','linewidth',2,'color',[0 0 0])%'linewidth',2,'color',[1 1 0],'marker','x')
plot(c,tot_pow(1:24,6),'k.-.','linewidth',2,'color',[0 1 0])%'linewidth',2,'color',[0 1 0],'marker','v')

hold off
grid on


h_leg=legend('Ph-wt=.25','Ph-wt=.50','Ph-wt=.75','Ph-wt=1','Ph-wt=1.25','Ph-wt=1.5','location','northeast')
set(h_leg,'fontsize',10,'fontweight','bold')
%plot(xcity(tour1(ind,:)),ycity(tour1(ind,:)),xcity,ycity,'o')
%axis square
%axis([0 1 0 6])
%title('power consumption for frequency')
xlabel('Heuristic weight','fontsize',12,'fontweight','bold')
ylabel('Energy consumption','fontsize',12,'fontweight','bold')



figure(8)

plot(c,tot_thr(1:24,1),'ko-','linewidth',2,'color',[0 0 1])%'linewidth',2,'color',[0 0 1],'marker','*')
hold all
plot(c,tot_thr(1:24,2),'k*-','linewidth',2,'color',[0 1 1])%'linewidth',2,'color',[0 1 1],'marker','o')
plot(c,tot_thr(1:24,3),'ks:','linewidth',2,'color',[1 0 1])%'linewidth',2,'color',[1 0 1],'marker','s')
plot(c,tot_thr(1:24,4),'kd:','linewidth',2,'color',[1 0 0])%'linewidth',2,'color',[1 1 1],'marker','d')
plot(c,tot_thr(1:24,5),'k^-.','linewidth',2,'color',[0 0 0])%'linewidth',2,'color',[1 1 0],'marker','x')
plot(c,tot_thr(1:24,6),'k.-.','linewidth',2,'color',[0 1 0])%'linewidth',2,'color',[0 1 0],'marker','v')

hold off
grid on
h_leg=legend('Ph-wt=.25','Ph-wt=.50','Ph-wt=.75','Ph-wt=1','Ph-wt=1.25','Ph-wt=1.5','location','northeast')
set(h_leg,'fontsize',10,'fontweight','bold')
%plot(xcity(tour1(ind,:)),ycity(tour1(ind,:)),xcity,ycity,'o')
%axis square
%axis([0 1 0 6])
%title('Through put variation for frequency')
xlabel('Heuristic weight','fontsize',12,'fontweight','bold')
ylabel('Throughput variation','fontsize',12,'fontweight','bold')


% cache=ccf(1,tour1(:,2))
% core=ccf(1,tour1(:,3))
%fre=ccf(1,tour1(:,4))
%result i j (:,1)=cache
%result i j (:,2)=core
%result i j (:,3)=frequency
%for reult i j use face detection part
