%Importfile(QuestionnaireData.mat) 
load('/Users/natalialopezchemas/Documents/MATLAB/Data code/QuestionnaireData_190819.mat');

DINFO= QuestionnaireData (:,1:10);
HAMD= QuestionnaireData (:,11:27);
IDS= QuestionnaireData (:,28:59);
Relapse = QuestionnaireData (:,60);
DINFO.Relapse= Relapse.relapse; %Run after adding HAMD and IDS 

%HAMD
hamd = table2array (HAMD); 
%H = ismissing(hamd); %hm2 = hamd(~any(H,2),:); 
hamd= cellfun(@(x) x(2),hamd);
hamd = double (hamd)-48 - 1;
HAMDtotal = nansum(hamd,2); 
DINFO.HAMDtotal= HAMDtotal;

%HAMD. Extracted from StatisticAnalysis code
mHAMDP = mean(ALLP.HAMDtotal)
stdHAMDP= std(ALLP.HAMDtotal)
mHAMDG12W = mean(G12W.HAMDtotal)
stdHAMDg12W= std(G12W.HAMDtotal)
mHAMDG1W2 = mean(G1W2.HAMDtotal)
stdHAMDG1W2= std(G1W2.HAMDtotal)
mHAMDC = mean(Ctrls.HAMDtotal)
stdHAMDC= std(Ctrls.HAMDtotal)








% %IDS
ids = table2array (IDS); 
ids(:,5:6) = [];
I = ismissing(ids);
ds2 = ids(~any(I,2),:); %wrong code as it deletes rows
ds2= cellfun(@(x) x(2),ds2); %when I run this code it cuts the elements with missing data and creates a 98x30 char
ds2 = double (ds2)-48 -1;
IDStotal = nansum(ds2,2); 
DINFO.IDStotal= IDStotal; %not the same number of rows

