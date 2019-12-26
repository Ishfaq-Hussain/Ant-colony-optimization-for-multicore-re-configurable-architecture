%TOUR MATRIX
Nants=4 
for ic=1:Nants
 tour(ic,1:9)=randperm(9);tour(ic,10:25)=(randperm(16)+9);tour(ic,26:29)=(randperm(4)+25);
 end % ic
 tour1(1:Nants,1)=1:Nants;
 %tour1(1:9,1)=ones(9,1)
 tour1=repmat(tour1,1,4);
save('tour14.mat','tour1')
save('tour4.mat','tour')
 

clc
clear all
 Nants=8 
for ic=1:Nants
 tour(ic,1:9)=randperm(9);tour(ic,10:25)=(randperm(16)+9);tour(ic,26:29)=(randperm(4)+25);
 end % ic
 tour1(1:Nants,1)=1:Nants;
 %tour1(1:9,1)=ones(9,1)
 tour1=repmat(tour1,1,4);
 
save('tour18.mat','tour1')
save('tour8.mat','tour')
 
 
 clc
 clear all
 Nants=12 
for ic=1:Nants
 tour(ic,1:9)=randperm(9);tour(ic,10:25)=(randperm(16)+9);tour(ic,26:29)=(randperm(4)+25);
 end % ic
 tour1(1:Nants,1)=1:Nants;
 %tour1(1:9,1)=ones(9,1)
 tour1=repmat(tour1,1,4);
 
 save('tour112.mat','tour1')
save('tour12.mat','tour')
 

 
 clc
 clear all
 Nants=16 
for ic=1:Nants
 tour(ic,1:9)=randperm(9);tour(ic,10:25)=(randperm(16)+9);tour(ic,26:29)=(randperm(4)+25);
 end % ic
 tour1(1:Nants,1)=1:Nants;
 %tour1(1:9,1)=ones(9,1)
 tour1=repmat(tour1,1,4); 
save('tour116.mat','tour1')
save('tour16.mat','tour')
 


 clc
 clear all
 Nants=20 
for ic=1:Nants
 tour(ic,1:9)=randperm(9);tour(ic,10:25)=(randperm(16)+9);tour(ic,26:29)=(randperm(4)+25);
 end % ic
 tour1(1:Nants,1)=1:Nants;
 %tour1(1:9,1)=ones(9,1)
 tour1=repmat(tour1,1,4);
 
 save('tour120.mat','tour1')
save('tour20.mat','tour')
 