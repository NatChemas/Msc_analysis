%Accucary of response per Valence
VR= findgroups (Valencegroups.Response);
meanCorrect=splitapply(@mean,Valencegroups.Match,VR) %global mean of correctly identified for both T1/T2 and participants+controls
sumCorrect=splitapply(@sum,Valencegroups.Match,VR) %global sum of correctly identified 

%Nº of Responded 
sum (Valencegroups.Response=='i')
%Nº of times presented
sum (Valencegroups.CorrectE=='i')

%Sum of correctly identified valences per participant T1T2
perID= findgroups(Valencegroups.ID);
unique (perID);
DataperID=splitapply(@sum,Valencegroups.Match,perID);

%Correctly identified valences per timepoint for all P+Ctrls
perTP= findgroups(Valencegroups.Timepoint);
unique (perTP);
DataperPT=splitapply(@sum,Valencegroups.Match,perTP);

%Organise per Experimental or control group 
%Participants
BPID= (Valencegroups (1:9178,:));
ZPID= (Valencegroups (13089:36542,:));
BZPID= [BPID; ZPID];
%Controls
BCID= (Valencegroups (9179:13088,:));
ZCID= (Valencegroups (36543:42491,:));
BZCID= [BCID; ZCID];

%Identified correctly ALL participants
VRp= findgroups (BZPID.Response);
meanCorrect=splitapply(@mean,BZPID.Match,VRp)
sumCorrect=splitapply(@sum,BZPID.Match,VRp)

%Identified correctly Controls
VRc= findgroups (BZCID.Response);
meanCorrect=splitapply(@mean,BZCID.Match,VRc)
sumCorrect=splitapply(@sum,BZCID.Match,VRc)

%Organise per time point (controls only have T1)
BZPID = sortrows(BZPID,'Timepoint','ascend');
BZPT1= (BZPID (1:17504,:));
BZPT2= (BZPID (17505:32632,:));

%Identified correctly participants
%T1
VRp1= findgroups (BZPT1.Response);
meanCorrectT1=splitapply(@mean,BZPT1.Match,VRp1)
sumCorrectT1=splitapply(@sum,BZPT1.Match,VRp1)
%T2
VRp2= findgroups (BZPT2.Response);
meanCorrectT2=splitapply(@mean,BZPT2.Match,VRp2)
sumCorrectT2=splitapply(@sum,BZPT2.Match,VRp2)
 
%Fraccions. Divided in excel to obtain fraction
sum (BZPT1.Response=='i')
sum (BZPT2.Response=='i')
sum (BZCID.Response=='i')

sum (BZPT1.CorrectE=='i')
sum (BZPT2.CorrectE=='i')
sum (BZCID.CorrectE=='i')
