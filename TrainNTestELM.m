%"Train process"
load Synthetic_TrainData_bi_decay.mat
OutputNode=3;  
NumberofHiddenNeurons=500;
ActivF='sigmoid';

train_data=yn;
label=[label_tau1,label_tau2,label_alpha];
TrainingSample=train_data;
NumberofTrainingData=size(TrainingSample,1);
NumberofInputNeurons=size(TrainingSample,2);
NumberofOutputNeurons=OutputNode;

tic
InputWeight=rand(NumberofHiddenNeurons,NumberofInputNeurons)*2-1;
BiasofHiddenNeurons=rand(NumberofHiddenNeurons,1);
tempH=InputWeight*TrainingSample';

ind=ones(1,NumberofTrainingData);
BiasMatrix=BiasofHiddenNeurons(:,ind);     
tempH=tempH+BiasMatrix;

switch lower(ActivF)
    case {'sig','sigmoid'}
        H = 1 ./ (1 + exp(-tempH));
    case {'relu'}
        H = (max(0,tempH));
    case {'sin','sine'}
        H = sin(tempH);    
    case {'hardlim'}
        H = double(hardlim(tempH));
    case {'tribas'}
        H = tribas(tempH);
    case {'radbas'}
        H = radbas(tempH);
end
OutputWeight=pinv(H') * label;
toc
Y=(H' * OutputWeight)';     
%MAE=mae(label' - Y);
output=Y;    
fprintf('Training done\n');
%fprintf('Training MAE %d,\nof HiddenNeural %d \n',MAE,NumberofHiddenNeurons);
save('./Model/elm_model_BiDecay', 'NumberofInputNeurons', 'NumberofOutputNeurons', 'InputWeight',...
    'BiasofHiddenNeurons', 'OutputWeight', 'ActivF', 'label');
%%
%ELM synthetic test data prediction
load Synthetic_TestData_bi_decay.mat
load elm_model_BiDecay.mat

NumberofTestingData=size(yn,1);
tempH_test=InputWeight*yn';           
ind=ones(1,NumberofTestingData);
BiasMatrix=BiasofHiddenNeurons(:,ind);  % Extend the bias matrix BiasofHiddenNeurons to match the demention of H
tempH_test=tempH_test + BiasMatrix;
switch lower(ActivF)
    case {'sig','sigmoid'}
        H_test = 1 ./ (1 + exp(-tempH_test));
    case {'relu'}
        H_test = (max(0,tempH_test));
    case {'sin','sine'}
        H_test = sin(tempH_test);        
    case {'hardlim'}
        H_test = hardlim(tempH_test);        
            
end
ResultVec=H_test'*OutputWeight;                          
PredictedTau1=ResultVec(:,1);
PredictedTau2=ResultVec(:,2);
PredictedAlpha=ResultVec(:,3);
PredictedTauAve_ELM=ResultVec(:,1).*ResultVec(:,3)+ResultVec(:,2).*(1-(ResultVec(:,3)));

label=[label_tau1,label_tau2,label_alpha];
