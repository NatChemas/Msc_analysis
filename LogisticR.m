%Group Per each of the 6 valences, participants only. T1
[GperV,IDP,Valences]= findgroups (BZPT1.ID,BZPT1.CorrectE);
meanVT=splitapply(@mean,BZPT1.Match,GperV);
VT=table(IDP,Valences,meanVT);
VT = unstack(VT, 'meanVT', 'Valences'); %Organised rows2columns for all Participants
%Eliminate dropout participants in VT table (relapse status missing)
VT([3 8 21 22 23 29 30 32 37 38 42 48 58 59 60 63 74 86 101],:) = [];

%Logistic Regression using 6 FERT valences as predictors
mdlall= fitglm ([VT.A,VT.D,VT.F,VT.G,VT.J,VT.S], ALLP.Relapse,'Distribution','binomial')
%Unadjusted analysis
mdlA= fitglm (VT.A, ALLP.Relapse,'Distribution','binomial')
mdlD= fitglm (VT.D, ALLP.Relapse,'Distribution','binomial')
mdlF= fitglm (VT.F, ALLP.Relapse,'Distribution','binomial')
mdlG= fitglm (VT.G, ALLP.Relapse,'Distribution','binomial')
mdlJ= fitglm (VT.J, ALLP.Relapse,'Distribution','binomial')
mdlS= fitglm (VT.S, ALLP.Relapse,'Distribution','binomial')

%Logistic Regression command using 6 FERT valences as predictors + demographics
%ALLP.gender = categorical(ALLP.gender); Adjusted analysis
mdlVdem= fitglm ([VT.A,VT.D,VT.F,VT.G,VT.J,VT.S,ALLP.age,ALLP.gender,ALLP.nEpisodes], ALLP.Relapse,'Distribution','binomial')
%mdlVdem= fitglm ([VT.A,VT.D,VT.F,VT.G,VT.J,VT.S,ALLP.age,ALLP.nEpisodes], ALLP.Relapse,'Distribution','binomial') %without gender
mdlVEp= fitglm ([VT.A,VT.D,VT.F,VT.G,VT.J,VT.S,ALLP.nEpisodes], ALLP.Relapse,'Distribution','binomial')
mdlVage= fitglm ([VT.A,VT.D,VT.F,VT.G,VT.J,VT.S,ALLP.age], ALLP.Relapse,'Distribution','binomial')
mdlVgender= fitglm ([VT.A,VT.D,VT.F,VT.G,VT.J,VT.S,ALLP.gender], ALLP.Relapse,'Distribution','binomial')
%Unadjusted analysis. Demographics variables.
mdldemo= fitglm ([ALLP.age,ALLP.gender,ALLP.nEpisodes], ALLP.Relapse,'Distribution','binomial')
mdlage= fitglm (ALLP.age,ALLP.Relapse,'Distribution','binomial')
mdlgender= fitglm (ALLP.gender, ALLP.Relapse,'Distribution','binomial')
mdlEpi= fitglm (ALLP.nEpisodes, ALLP.Relapse,'Distribution','binomial')
mdlHAMD= fitglm (ALLP.HAMDtotal, ALLP.Relapse,'Distribution','binomial')

