%patients who relapsed. 
VT = sortrows(VT,'Relapse','ascend'); %FERT T1
Relapsers= (VT(55:84,:));
Nonrelapsers= (VT(1:54,:));
RelapsersDemo= (ALLP(55:84,:)); %Demographic variables
NonrelapsersDemo= (ALLP(1:54,:));
%Relapsers Vs non-relapsers FERT T2
RelapsersFERT= ismember (BZPT2.ID,[1005 1007 1026 1027 1029 1035 1040 1041 1047 3005 3007 3023 3025 3030 3036 3040 3063 3064 3070 3071 3078 3079 3088 3089 3095 3099 3100 3102 3104 3109]);
RelapseFERT = BZPT2 (RelapsersFERT,:); %Relapsers T2
NonRelapsersFERT2= ismember (BZPT2.ID,[1013 1015 1016 1018 1021 1023 1031 1036 1037 1039 1049 1050 1051 1052 3003 3009 3012 3017 3018 3019 3021 3022 3026 3029 3031 3035 3038 3041 3042 3048 3049 3052 3053 3054 3056 3057 3059 3062 3065 3068 3069 3073 3074 3075 3077 3080 3083 3084 3085 3086 3094 3097 3106 3108]);
NonRelapseFERT2 = BZPT2 (NonRelapsersFERT2,:); %Non Relapsers T2

%Demographics of relapsers 
%RELAPSERS
meanageRel = mean(RelapsersDemo.age) %Age
stdageRel = std(RelapsersDemo.age)
FemaleRel = sum (RelapsersDemo.gender==0) %Gender
MaleRel = sum (RelapsersDemo.gender==1)
mxNEpRel = max(RelapsersDemo.nEpisodes) %Number of episodes 
mnNEpRel = min(RelapsersDemo.nEpisodes)
meanNEpRel = mean(RelapsersDemo.nEpisodes)
StdNEpRel= std (RelapsersDemo.nEpisodes)
%Non-relapsers
meanagepNonR = mean(NonrelapsersDemo.age) %Age
stdageNonR = std(NonrelapsersDemo.age)
FemaleNonR = sum (NonrelapsersDemo.gender==0) %Gender
MaleNonR = sum (NonrelapsersDemo.gender==1)
mxNENonR = max(NonrelapsersDemo.nEpisodes) %Number of episodes 
mnNENonR = min(NonrelapsersDemo.nEpisodes)
meanNENonR = mean(NonrelapsersDemo.nEpisodes)
StdNENonR= std (NonrelapsersDemo.nEpisodes)

%t-test correct responses per valence relapsers vs non-relapsers T1 
%A
Ra = Relapsers.A
NonRa= Nonrelapsers.A
[h,p,ci,stats] = ttest2(Ra,NonRa)
%S
Rs = Relapsers.S
NonRs= Nonrelapsers.S
[h,p,ci,stats] = ttest2(Rs,NonRs)
%D
Rd = Relapsers.D
NonRd= Nonrelapsers.D
[h,p,ci,stats] = ttest2(Rd,NonRd)
%F
Rf = Relapsers.F
NonRf= Nonrelapsers.F
[h,p,ci,stats] = ttest2(Rf,NonRf)
%G
Rg = Relapsers.G
NonRg= Nonrelapsers.G
[h,p,ci,stats] = ttest2(Rg,NonRg)
%J
Rj = Relapsers.J
NonRj= Nonrelapsers.J
[h,p,ci,stats] = ttest2(Rj,NonRj)

%convert tables to Means per valence columns for t-tests
%Relapsers
[Relap2,IDRel,ValencesRel]= findgroups (RelapseFERT.ID,RelapseFERT.CorrectE);
meanRel=splitapply(@mean,RelapseFERT.Match,Relap2);
VRel=table(IDRel,ValencesRel,meanRel); %All means per correctly identified valence T2Relapsers 
VRel = unstack(VRel, 'meanRel', 'ValencesRel');
%NonRelapsers
[nonRelap2,IDnonRel,ValencesnonRel]= findgroups (NonRelapseFERT2.ID,NonRelapseFERT2.CorrectE);
meannonRel=splitapply(@mean,NonRelapseFERT2.Match,nonRelap2);
VnonRel=table(IDnonRel,ValencesnonRel,meannonRel); %All means per correctly identified valence T2NonRelapsers 
VnonRel = unstack(VnonRel, 'meannonRel', 'ValencesnonRel');

%t-test for demographic variables relapses vs non-relapsers 
%A
R2a = VRel.A;
NonR2a= VnonRel.A;
[h,p,ci,stats] = ttest2(R2a,NonR2a)
%S
R2s = VRel.S;
NonR2s= VnonRel.S;
[h,p,ci,stats] = ttest2(R2s,NonR2s)
%D
R2d = VRel.D;
NonR2d= VnonRel.D;
[h,p,ci,stats] = ttest2(R2d,NonR2d)
%F
R2f = VRel.F;
NonR2f= VnonRel.F;
[h,p,ci,stats] = ttest2(R2f,NonR2f)
%G
R2g = VRel.G;
NonR2g= VnonRel.G;
[h,p,ci,stats] = ttest2(R2g,NonR2g)
%J
R2j = VRel.J;
NonR2j= VnonRel.J;
[h,p,ci,stats] = ttest2(R2j,NonR2j)