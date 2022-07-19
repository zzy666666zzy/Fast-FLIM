%Training data generation (mono)
N=10000;
FWHM=0.1673;    %measured FWHM of IRF
label_tau1=zeros(N,1);
Npeak=zeros(N,1);
parfor i =1:N
        tau1 = (5-0.1).*rand(1) + 0.1;
%        Npeak(i) = round(rand(1)*5)+1;   
        Npeak(i) = (360)*rand(1)+40;
%         Npeak(i) = (250-100).*rand(1) + 100;       %100 ~ 250
%         Npeak(i) = (500-250).*rand(1) + 250;       %250 ~ 500
%         Npeak(i) = (800-500).*rand(1) + 500;       %500 ~ 800
        label_tau1(i) = tau1;
        y(i,:) = Generate_decay_sin_exp(tau1,Npeak(i),FWHM);
        yn(i,:)=y(i,:)/max(y(i,:));
end
fprintf('Generate training data done\n');

%Training data generation (bi)
% clear
clc
N=40000;
FWHM=0.1673;    %measured FWHM of IRF
label_tau1=zeros(N,1);
label_tau2=zeros(N,1);
label_alpha=zeros(N,1);
Npeak=zeros(N,1);
parfor i =1:N
        tau1 = (0.5-0.1)*rand(1)+0.1; 
        tau2 = (2).*rand(1)+1; 
        alpha = rand(1);
        Npeak(i) = round(rand(1)*5)+1;
%        Npeak(i) = (360)*rand(1)+40;          
%         Npeak(i) = (250-100).*rand(1) + 100;       %100 ~ 250
%         Npeak(i) = (500-250).*rand(1) + 250;       %250 ~ 500
%         Npeak(i) = (800-500).*rand(1) + 500;       %500 ~ 800
%        Npeak(i) = (2000-100).*rand(1) + 100;          %25 ~ 400
        label_tau1(i) = tau1;
        label_tau2(i) = tau2;
        label_alpha(i) = alpha;
        y(i,:) = Generate_decay_bi_exp(tau1,tau2,alpha,Npeak(i),FWHM);
        yn(i,:)=y(i,:)./max(y(i,:));
end
fprintf('Simulation training data gen done.\n');
