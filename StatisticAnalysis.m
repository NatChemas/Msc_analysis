%Statistical analysis:
%Create a table for Dropouts. Eliminate Dropout for main analysis
DINFO = sortrows(DINFO,'Relapse','ascend');
Drop = DINFO (85:89,:); 
Outs= DINFO (113:126,:);  
DOuts= [Drop; Outs];
DINFO(85:89,:) = [];
DINFO(108:121,:) = [];
DINFO = sortrows(DINFO,'ppidLi','ascend');

%Create tables for groups 1W2, 12W and controls
G1W2= DINFO (DINFO.baselinecomplete_GroupAssignment =="1W2",:);
G12W= DINFO (DINFO.baselinecomplete_GroupAssignment =="12W",:);
ALLP = DINFO (DINFO.isPatient ==1,:);
Ctrls= DINFO (DINFO.isControl ==1,:);

%Descriptive statistics for participants
statarray = grpstats(ALLP,'baselinecomplete_GroupAssignment','mean','DataVars',{'age','nEpisodes'})
%Age
meanagep = mean(ALLP.age) 
stdagep = std(ALLP.age)
meanage1 = mean(G12W.age) 
stdage1 = std(G12W.age)
meanage2 = mean(G1W2.age)
stdage2 = std(G1W2.age)
meanageC = mean(Ctrls.age)
stdageC = std(Ctrls.age)
%Gender
Female1 = sum (G1W2.gender==0)
Male1 = sum (G1W2.gender==1)
Female2 = sum (G12W.gender==0)
Male2 = sum (G12W.gender==1)
FemaleC = sum (Ctrls.gender==0)
MaleC = sum (Ctrls.gender==1)
%Episodes
%ALL participants
mxNEp = max(ALLP.nEpisodes)
mnNEp = min(ALLP.nEpisodes)
meanNEp = mean(ALLP.nEpisodes)
StdNEp= std (ALLP.nEpisodes)
medianNEp= median (ALLP.nEpisodes)
%G12W
meanNE1 = mean(G12W.nEpisodes)
StdNE1= std (G12W.nEpisodes)
%G1W2
meanNE2 = mean(G1W2.nEpisodes)
StdNE2= std (G1W2.nEpisodes)

%Dropout demographic and clinical characteristics 
statsDOuts = grpstats(DOuts,'baselinecomplete_GroupAssignment','mean','DataVars',{'age','nEpisodes', 'HAMDtotal'})
StdageOuts= std (DOuts.age)
StdHAMDOuts= std (DOuts.HAMDtotal)
%Dropouts Gender
FemaleDouts = sum (DOuts.gender==0)
MaleDouts = sum (DOuts.gender==1)
%Droputs nº Episodes
mxNEOuts = max(DOuts.nEpisodes)
mnNEOuts = min(DOuts.nEpisodes)
meanNEOuts = mean(DOuts.nEpisodes)
StdNEOuts= std (DOuts.nEpisodes)
medianNEOuts= median (DOuts.nEpisodes)

%T.TESTs for depression score at baseline, each valence at T1/T2(P+Ctrls)
%T-test for HAMD 
X = ALLP.HAMDtotal;
y = Ctrls.HAMDtotal;
[h,p,ci,stats] = ttest2(X,y)

%Group Per each of the 6 valences, participants only
[GperV,IDP,Valences]= findgroups (BZPID.ID,BZPID.CorrectE);
meanVT=splitapply(@mean,BZPID.Match,GperV);
VT=table(IDP,Valences,meanVT);
VT(1,:) = [];
%Controls correctly identified valence Means
[GperVc,IDC,ValencesC]= findgroups (BZCID.ID,BZCID.CorrectE);
meanVTc=splitapply(@mean,BZCID.Match,GperVc);
VTc=table(IDC,ValencesC,meanVTc); %All means per correctly identified valence T1controls 
VTc = unstack(VTc, 'meanVTc', 'ValencesC'); %All means per valence T1controls
%T-test per valences
%A
XPVa = VT.A
YCVa= VTc.A
[h,p,ci,stats] = ttest2(XPVa,YCVa)
%S
XPVs = VT.S
YCVs= VTc.S
[h,p,ci,stats] = ttest2(XPVs,YCVs)
%D
XPVd = VT.D
YCVd= VTc.D
[h,p,ci,stats] = ttest2(XPVd,YCVd)
%F
XPVf = VT.F
YCVf= VTc.F
[h,p,ci,stats] = ttest2(XPVf,YCVf)
%G
XPVg = VT.G
YCVg= VTc.G
[h,p,ci,stats] = ttest2(XPVg,YCVg)
%J
XPVj = VT.J
YCVj= VTc.J
[h,p,ci,stats] = ttest2(XPVj,YCVj)

%Difference between 12W and 1W2 at T2
%Group 12W at T2. Only correctly identified valence's means
[GperVt2,IDt2,Valencest2]= findgroups (T2G12W.ID,T2G12W.CorrectE);
meanVt2=splitapply(@mean,T2G12W.Match,GperVt2);
VTt2=table(IDt2,Valencest2,meanVt2); %All means per correctly identified valence T2 12W
VTt2 = unstack(VTt2, 'meanVt2', 'Valencest2'); %All means per valence T2 12W
%Group 1W2 at T2. Only correctly identified valence's means
[GperVt3,IDt3,Valencest3]= findgroups (T2G1W2.ID,T2G1W2.CorrectE);
meanVt3=splitapply(@mean,T2G1W2.Match,GperVt3);
VTt3=table(IDt3,Valencest3,meanVt3); %All means per correctly identified valence T2 12W
VTt3 = unstack(VTt3, 'meanVt3', 'Valencest3'); %All means per valence T2 12W

%T-test 12w/1W2 at T2
%A
XPV2a = VTt2.A
YCV2a= VTt3.A
[h,p,ci,stats] = ttest2(XPV2a,YCV2a)
%S
XPV2s = VTt2.S
YCV2s= VTt3.S
[h,p,ci,stats] = ttest2(XPV2s,YCV2s)
%D
XPV2d = VTt2.D
YCV2d= VTt3.D
[h,p,ci,stats] = ttest2(XPV2d,YCV2d)
%F
XPV2f = VTt2.F
YCV2f= VTt3.F
[h,p,ci,stats] = ttest2(XPV2f,YCV2f)
%G
XPV2g = VTt2.G
YCV2g= VTt3.G
[h,p,ci,stats] = ttest2(XPV2g,YCV2g)
%J
XPV2j = VTt2.J
YCV2j= VTt3.J
[h,p,ci,stats] = ttest2(XPV2j,YCV2j)

%Sum of correctly identified valences per group and time point
%BZCID	
X1= findgroups (BZCID.Response);
sumCorrectX1=splitapply(@sum,BZCID.Match,X1)
%BZPT1	
X2= findgroups (BZPT1.Response);
sumCorrectX2=splitapply(@sum,BZPT1.Match,X2)

%T2G12W	
X3= findgroups (T2G12W.Response);
sumCorrectX3=splitapply(@sum,T2G12W.Match,X3)
%T2G1W2
X4= findgroups (T2G1W2.Response);
sumCorrectX4=splitapply(@sum,T2G1W2.Match,X4)

%Group mean correct FERT responses by participants (obtain 103 rows)
[AnalysisTbl,BZPid] = findgroups (BZPID.ID);
meanAT=splitapply(@mean,BZPID.Match,AnalysisTbl);
AT=table(BZPid,meanAT);
 
%Organised rows2columns for all Participants
VT = unstack(VT, 'meanVT', 'Valences');
RelapseP = ALLP.Relapse; 
%Eliminate dropout participants in VT table (relapse status missing)
VT([3 8 21 22 23 29 30 32 37 38 42 48 58 59 60 63 74 86 101],:) = [];

%Logistic Regression command using 6 FERT valences as predictors
mdlall= fitglm ([VT.A,VT.D,VT.F,VT.G,VT.J,VT.S], RelapseP,'Distribution','binomial')
mdlA= fitglm (VT.A, RelapseP,'Distribution','binomial')
mdlD= fitglm (VT.D, RelapseP,'Distribution','binomial')
mdlF= fitglm (VT.F, RelapseP,'Distribution','binomial')
mdlG= fitglm (VT.G, RelapseP,'Distribution','binomial')
mdlJ= fitglm (VT.J, RelapseP,'Distribution','binomial')
mdlS= fitglm (VT.S, RelapseP,'Distribution','binomial')

%Logistic Regression using demographic and clinical predictors
mdl= fitglm (ALLP.age, RelapseP,'Distribution','binomial')
mdl= fitglm ([ALLP.age,ALLP.gender,ALLP.nEpisodes, ALLP.HAMDtotal], RelapseP,'Distribution','binomial')
mdlAgeEp= fitglm ([ALLP.age, ALLP.nEpisodes], RelapseP,'Distribution','binomial')
mdlsex= fitglm ([ALLP.gender], RelapseP,'Distribution','binomial')
mdlHAMD= fitglm ([ALLP.HAMDtotal], RelapseP,'Distribution','binomial')

%The model gives almost a 35% probability that the average answer for A is correct, 
%with a wide confidence interval about this estimate.
[newA,newc] = predict(mdlA,mean(VT.A))

%Graphs and plots
plotSlice(mdlall)
scatter (VT.A, RelapseP)
plotSlice (mdlHAMD)
yvar= [1891 2114 1629 2021 1701 1784;1740 1838 1878 1539 1868 1620];%Reaction times P+Ctrls at T1
bar (yvar)

% mdlalltrial= stepwiseglm (VTCopy)
