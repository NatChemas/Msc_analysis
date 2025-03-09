%Create tables for groups 1W2, 12W from tables BZPT1 and BZPT2

%Reacttion times
%Time point 1 using BZPT1.
MmG12W= ismember (BZPT1.ID,[1023 1027 1035 1037 1039 1040 1041 1047 1050 3018 3019 3021 3022 3023 3025 3030 3038 3049 3054 3056 3057 3059 3063 3065 3069 3070 3071 3073 3074 3075 3080 3083 3084 3086 3094 3097 3099 3100 3102 3104 3108]);
T1G12W = BZPT1 (MmG12W,:);% Group 12W
JjG1W2= ismember (BZPT1.ID,[1005 1007 1013 1015 1016 1018 1021 1026 1029 1031 1036 1049 1051 1052 3003 3005 3007 3009 3012 3017 3026 3029 3031 3035 3036 3040 3041 3042 3048 3052 3053 3062 3064 3068 3077 3078 3079 3085 3088 3089 3095 3106 3109]);
T1G1W2= BZPT1 (JjG1W2,:);% Group 1W2
%Time point 2 using BZPT2. 
PpG12W= ismember (BZPT2.ID,[1023 1027 1035 1037 1039 1040 1041 1047 1050 3018 3019 3021 3022 3023 3025 3030 3038 3049 3054 3056 3057 3059 3063 3065 3069 3070 3071 3073 3074 3075 3080 3083 3084 3086 3094 3097 3099 3100 3102 3104 3108]);
T2G12W = BZPT2 (PpG12W,:); %Group 12W
AaG1W2= ismember (BZPT2.ID,[1005 1007 1013 1015 1016 1018 1021 1026 1029 1031 1036 1049 1051 1052 3003 3005 3007 3009 3012 3017 3026 3029 3031 3035 3036 3040 3041 3042 3048 3052 3053 3062 3064 3068 3077 3078 3079 3085 3088 3089 3095 3106 3109]);
T2G1W2= BZPT2 (AaG1W2,:); %Group 1W2


%Mean Reaction times per correctly identified valences only, separated by groups at T1 
%G12W
[G12Wid,RTG12W, Valence] = findgroups (T1G12W.Match,T1G12W.CorrectE);
meanRT12w=splitapply(@mean,T1G12W.RTms, G12Wid);
stdRT12w=splitapply(@std,T1G12W.RTms, G12Wid)
RT12W=table(RTG12W,Valence,meanRT12w);
%G1W2
[G1W2id,RTG1W2, Valence2] = findgroups (T1G1W2.Match,T1G1W2.CorrectE);
meanRT1w2=splitapply(@mean,T1G1W2.RTms, G1W2id);
RT1W2=table(RTG1W2,Valence2,meanRT1w2);
%Controls
[GCid,RTGC, ValenceC] = findgroups (BZCID.Match,BZCID.CorrectE);
meanRTC=splitapply(@mean,BZCID.RTms, GCid);
RTCtrl=table(RTGC,ValenceC,meanRTC);

%Mean Reaction times per correctly identified valences only. T2
%G12W
[G12Wid2,RTG12W2, Valence3] = findgroups (T2G12W.Match,T2G12W.CorrectE);
meanRT12w2=splitapply(@mean,T2G12W.RTms, G12Wid2)
RT212W=table(RTG12W2,Valence3,meanRT12w2);
%G1W2
[G1W2id2,RTG1W2b, Valence4] = findgroups (T2G1W2.Match,T2G1W2.CorrectE);
meanRT1w2b=splitapply(@mean,T2G1W2.RTms, G1W2id2)
RT21W2=table(RTG1W2b,Valence4,meanRT1w2b);


%T-test for Reaction times 
%Between all participants and control group at T1 (c)
TtesttableALLP = BZPT1 (BZPT1.Match ==1,:);
TtesttableCtrls = BZCID (BZCID.Match ==1,:);
XRTc = TtesttableALLP.RTms;
YRTc= TtesttableCtrls.RTms;
[h,p,ci,stats] = ttest2(XRTc,YRTc)

%Between groups 12W and 1W2 at T1. Not neccesary 
Ttesttable12W = T1G12W (T1G12W.Match ==1,:);
Ttesttable1W2 = T1G1W2 (T1G1W2.Match ==1,:);
XRT = Ttesttable12W.RTms;
YRT= Ttesttable1W2.RTms;
[h,p,ci,stats] = ttest2(XRT,YRT)

%Between groups 12W and 1W2 at T2 (b). Needs to be done per valence
Ttesttable12Wb = T2G12W (T2G12W.Match ==1,:);
Ttesttable1W2b = T2G1W2 (T2G1W2.Match ==1,:);
XRTb = Ttesttable12Wb.RTms;
YRTb= Ttesttable1W2b.RTms;
[h,p,ci,stats] = ttest2(XRTb,YRTb)

%RTms t-test, means per valence RT at T1
%AllP
[Gperrtp1,IDrtp1,RTrtp1]= findgroups (TtesttableALLP.ID,TtesttableALLP.CorrectE);
meanrtp1=splitapply(@mean,TtesttableALLP.RTms,Gperrtp1);
VTrtp1=table(IDrtp1,RTrtp1,meanrtp1);
VTrtp1 = unstack(VTrtp1,'meanrtp1','RTrtp1');
%Controls
[Gperrtc,IDrtc,RTrtc]= findgroups (TtesttableCtrls.ID,TtesttableCtrls.CorrectE);
meanrtc=splitapply(@mean,TtesttableCtrls.RTms,Gperrtc);
VTrtc=table(IDrtc,RTrtc,meanrtc);
VTrtc = unstack(VTrtc,'meanrtc','RTrtc');

%ttest T1
%A
xa1= VTrtp1.A;
ya1= VTrtc.A;
[h,p,ci,stats] = ttest2(xa1,ya1)
%S
xs1= VTrtp1.S;
ys1= VTrtc.S;
[h,p,ci,stats] = ttest2(xs1,ys1)
%D
xd1= VTrtp1.D;
yd1= VTrtc.D;
[h,p,ci,stats] = ttest2(xd1,yd1)
%F
xf1= VTrtp1.F;
yf1= VTrtc.F;
[h,p,ci,stats] = ttest2(xf1,yf1)
%G
xg1= VTrtp1.G;
yg1= VTrtc.G;
[h,p,ci,stats] = ttest2(xg1,yg1)
%J
xj1= VTrtp1.J;
yj1= VTrtc.J;
[h,p,ci,stats] = ttest2(xj1,yj1)
%Histogram used

%RTms t-test, means per valence RT at T2
%group 12W
[Gperrt2,IDrt2,RTrt2]= findgroups (Ttesttable12Wb.ID,Ttesttable12Wb.CorrectE);
meanrt2=splitapply(@mean,Ttesttable12Wb.RTms,Gperrt2);
VTrt2=table(IDrt2,RTrt2,meanrt2);
VTrt2 = unstack(VTrt2,'meanrt2','RTrt2');
%group 1W2
[Gperrt3,IDrt3,RTrt3]= findgroups (Ttesttable1W2b.ID,Ttesttable1W2b.CorrectE);
meanrt3=splitapply(@mean,Ttesttable1W2b.RTms,Gperrt3);
VTrt3=table(IDrt3,RTrt3,meanrt3);
VTrt3 = unstack(VTrt3,'meanrt3','RTrt3');
%ttest T2
%A
xax= VTrt2.A;
yay= VTrt3.A;
[h,p,ci,stats] = ttest2(xax,yay)
%S
xsx= VTrt2.S;
ysy= VTrt3.S;
[h,p,ci,stats] = ttest2(xsx,ysy)
%D
xdx= VTrt2.D;
ydy= VTrt3.D;
[h,p,ci,stats] = ttest2(xdx,ydy)
%F
xfx= VTrt2.F;
yfy= VTrt3.F;
[h,p,ci,stats] = ttest2(xfx,yfy)
%G
xgx= VTrt2.G;
ygy= VTrt3.G;
[h,p,ci,stats] = ttest2(xgx,ygy)
%J
xjx= VTrt2.J;
yjy= VTrt3.J;
[h,p,ci,stats] = ttest2(xjx,yjy)


