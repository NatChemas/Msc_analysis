%TASK PERFORMANCE:ACCURACY. T-test for all participants at T1 and all controls.FERT
%All participants T1 correctly identified valence Means
[GperVt1,IDPt1,Valencest1]= findgroups (BZPT1.ID,BZPT1.CorrectE);
meanVTt1=splitapply(@mean,BZPT1.Match,GperVt1);
VTt1=table(IDPt1,Valencest1,meanVTt1);
VTt1 = unstack(VTt1, 'meanVTt1', 'Valencest1');
%Controls correctly identified valence Means
[GperVc,IDC,ValencesC]= findgroups (BZCID.ID,BZCID.CorrectE);
meanVTc=splitapply(@mean,BZCID.Match,GperVc);
VTc=table(IDC,ValencesC,meanVTc); %All means per correctly identified valence T1controls 
VTc = unstack(VTc, 'meanVTc', 'ValencesC'); %All means per valence T1controls

%T-test per valences
%A
XPVa = VTt1.A;
YCVa= VTc.A;
[h,p,ci,stats] = ttest2(XPVa,YCVa)
%D
XPVd = VTt1.D
YCVd= VTc.D
[h,p,ci,stats] = ttest2(XPVd,YCVd)
%F
XPVf = VTt1.F
YCVf= VTc.F
[h,p,ci,stats] = ttest2(XPVf,YCVf)
%G
XPVg = VTt1.G
YCVg= VTc.G
[h,p,ci,stats] = ttest2(XPVg,YCVg)
%J
XPVj = VTt1.J
YCVj= VTc.J
[h,p,ci,stats] = ttest2(XPVj,YCVj)
%S
XPVs = VTt1.S
YCVs= VTc.S
[h,p,ci,stats] = ttest2(XPVs,YCVs)

%TASK PERFORMANCE:ACCURACY.Difference between 12W and 1W2 at T2
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

%TASK PERFORMANCE:REACTION TIME. Means for all participants at T1 and all controls.FERT
%All participants T1 per valence RTms means
RTmsT1= BZPT1 (BZPT1.Match==1,:);
[Hh, Vv] = findgroups (RTmsT1.Response);
meanRTt1=splitapply(@mean,RTmsT1.RTms,Hh)
RTt1=table(Vv,meanRTt1);
%Controls Reaction times valence. Means
RTmsC= BZCID (BZCID.Match==1,:);
[Qq, Kk] = findgroups (RTmsC.Response);
meanRTC=splitapply(@mean,RTmsC.RTms,Qq)
RTc=table(Kk,meanRTC);


