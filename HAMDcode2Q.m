%Importfile(QuestionnaireData.mat) 
load('/Users/natalialopezchemas/Documents/MATLAB/Data code/QuestionnaireData_190819.mat');

DINFO= QuestionnaireData (:,1:10);
HAMD= QuestionnaireData (:,11:27);
IDS= QuestionnaireData (:,28:59);
Relapse = QuestionnaireData (:,60);
DINFO.Relapse= Relapse %Run after adding HAMD and IDS 

%HAMD. This should run well 
hamd = table2array (HAMD); 
H = ismissing(hamd); %hm2 = hamd(~any(H,2),:); 
hm2= cellfun(@(x) x(2),hm2);
hm2 = double (hm2)-48 - 1;
HAMDtotal = nansum(hm2,2); 
DINFO.HAMDtotal= HAMDtotal;


% IDS. I cannot run the same code for IDS because of the many missing data
% points. Any help would be appreciated. 
ids = table2array (IDS); 
ids(:,5:6) = [];
I = ismissing(ids);
ds2 = ids(~any(I,2),:); %wrong code as it deletes rows
ds2= cellfun(@(x) x(2),ds2);
ds2 = double (ds2)-48 -1;
IDStotal = nansum(ds2,2); 
DINFO.IDStotal= IDStotal; %not the same number of rows


%I also tried doing this but it did not work 
for i = 1:length(ids)
  if isempty(ids(i))
    ids(i) = 0;
  end
end




