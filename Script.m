 %Load data in both files
CorrectEmotions = xlsread('CorrectEmotions.xls');

%Changed NaN for 0s
CorrectEmotions(isnan(CorrectEmotions)) = 0; 
CorrectEmotions(:,1) = [];

%Array2table 
CorrectID = array2table (CorrectEmotions, ...
'VariableNames',{'StimID','A','S','D','F','G','J','Surprise'});

%Valence 'Surprise' was not used for the trial
CorrectID(:,8) = [];
CorrectID(251,:) = [];

%Extract which stimulus ID corresponds to which emotion in CorrectEmotions
Anger = find (CorrectID.A);
Disgust = find (CorrectID.S);
Fear= find (CorrectID.D);
Happy = find (CorrectID.F);
Sad= find (CorrectID.G);
Neutral= find (CorrectID.J);

%Neutral filled with 0's (to be able to put the table together)
AccurateEmotionsID = [Anger, Disgust, Fear, Happy, Sad, Neutral]; 
CorrectValence = array2table (AccurateEmotionsID, ...
'VariableNames',{'A','S','D','F','G','J'});

%Import AIDAZ tables (manually). Put them together
Accessfoldercode.m

DatasetCopy = array2table (myDataCopy,'VariableNames', ...
{'Trial','StimID','Response','RTms','Participant','Timepoint'});


%Number of times each emotion was presented
MatchAnger = ismember(CorrectID.A, AIDAZ3070T1T2.stimID); sum (MatchAnger);
MatchDisgust = ismember(CorrectID.S, AIDAZ3070T1T2.stimID);sum (MatchDisgust);
MatchFear = ismember(CorrectID.D, AIDAZ3070T1T2.stimID); sum (MatchFear);
MatchHappy = ismember(CorrectID.F, AIDAZ3070T1T2.stimID); sum (MatchHappy);
MatchSad = ismember(CorrectID.G, AIDAZ3070T1T2.stimID); sum (MatchSad);
MatchNeutral = ismember(CorrectID.J, AIDAZ3070T1T2.stimID);sum (MatchNeutral);
MatchSurprise = ismember(CorrectID.Surprise, AIDAZ3070T1T2.stimID);sum (MatchSurprise);

%Number of times each emotion was identified
sum (AIDAZ3070T1T2.response=='A')
sum (AIDAZ3070T1T2.response=='S')
sum (AIDAZ3070T1T2.response=='J')
sum (AIDAZ3070T1T2.response=='D')
sum (AIDAZ3070T1T2.response=='F')

% Count number of times each emotion was identified correctly 

AIDAZ3070T1T2 = sortrows(AIDAZ3070T1T2,'response','ascend');
AIDAZ3070T1T2 = unstack(AIDAZ3070T1T2, 'stimID', 'response');

IDAnger = ismember(CorrectID.A, AIDAZ3070T1T2.A);
IDDisgust = ismember(CorrectID.S, AIDAZ3070T1T2.S);
IDFear = ismember(CorrectID.D, AIDAZ3070T1T2.D);
IDHappy = ismember(CorrectID.F, AIDAZ3070T1T2.F);
IDSad = ismember(CorrectID.G, AIDAZ3070T1T2.G);
IDNeutral = ismember(CorrectID.J, AIDAZ3070T1T2.J);

%Fraction of times each emotion was identified correctly 

fractionA= sum(IDAnger)/sum(MatchAnger)
fractionS= sum(IDDisgust)/sum(MatchDisgust)
fractionD= sum(IDFear)/sum(MatchFear)
fractionF= sum(IDHappy)/sum(MatchHappy)
fractionG= sum(IDSad)/sum(MatchSad)
fractionJ= sum(IDNeutral)/sum(MatchNeutral)

%Tutor
fileread(strtrim(Data(1).filename))
importdata(strtrim (Data(1).filename), ' ' , 3)
dlmread(strtrim(Data(1).filename),'',3)
readmatrix(strtrim(Data(1).filename))
compac2.textdata(4:100,1:3)

%Eliminate rows from Matrix
 compac2.textdata(1,:) = [];
 compac2.textdata(2,:) = [];
 compac2.textdata(3,:) = [];
 compac2.textdata(172,:) = [];
x=compac2.textdata
x(2:171,4)=num2cell(compac2.data)

%To analyse Data graphically 
ValenceA=cell2mat(myData(:,3))=='A';
ValenceS=cell2mat(myData(:,3))=='S';
ValenceD=cell2mat(myData(:,3))=='D';
ValenceF=cell2mat(myData(:,3))=='F';
ValenceG=cell2mat(myData(:,3))=='G';
ValenceJ=cell2mat(myData(:,3))=='J';

boxplot(cell2mat(myData (, 4)))

myDataCopy = string (myDataCopy);

myDataCopy1.Properties.VariableNames{1} = 'Trial';
myDataCopy1.Properties.VariableNames{2} = 'StimID';
myDataCopy1.Properties.VariableNames{3} = 'Response';
myDataCopy1.Properties.VariableNames{4} = 'RTms';
myDataCopy1.Properties.VariableNames{5} = 'ID';
myDataCopy1.Properties.VariableNames{6} = 'Timepoint';

