% Load Data 
        datadir='/Users/natalialopezchemas/Documents/MATLAB/Rawdataset';

        % SPM folder path
        addpath(genpath(['/Users/natalialopezchemas/Documents/MATLAB/spm12']));

        % Find .dat files in the directory
        datafiles=spm_select('FPListRec',datadir,'.*.dat$')

        % ID and Timepoint
        j=0;
        for i=1:length(datafiles);
                df = datafiles(i,:);
                id = regexprep(df,'.*/TNU_AIDA[BZ]_','');
                id = str2num(id(1:4));
                T = regexprep(df,'.*/TNU_AIDA[BZ]_[0-9]*_T','');
                if ~( (startsWith(T,'2.dat')==1 & id==3009) )
                        j=j+1;
                        fprintf('%i %i %s - %s\n',i,j,df, T)
                        Data(i).id=id;
                        Data(i).T=str2num(T(1));
                        Data(i).filename=df;
                end
        end

        Ndat = length(Data);
      
myData=[];
        for i=1:Ndat
             try
             Dataset=importdata(strtrim(Data(i).filename));
                Dataset.textdata(174,:) = [];
                Dataset.textdata(3,:) = [];
                Dataset.textdata(2,:) = [];
                Dataset.textdata(1,:) = [];
               
               x=Dataset.textdata ;
                x(1:170,4)=num2cell(Dataset.data) ;
                x(1:170,5)=num2cell(Data(i).id) ;
                x(1:170,6)=num2cell(Data(i).T) ;
                myData=[myData;x] ;
             catch
                 warning('Problem with')
                 i
             end
        end
        
        Data(89) = [];
        
        
%Load correct Emotions doc

CorrectEmotions = xlsread('CorrectEmotions.xls');
CorrectEmotions(251,:) = [];
CorrectEmotions(:,1) = [];
CorrectEmotions(isnan(CorrectEmotions)) = 0;

for i=1:250
    CorrectIDCode(i)='X'
if(CorrectEmotions(i,2)==1)
    CorrectIDCode(i)='A'
end
if(CorrectEmotions(i,3)==1)
    CorrectIDCode(i)='S'
end
if(CorrectEmotions(i,4)==1)
    CorrectIDCode(i)='D'
end
if(CorrectEmotions(i,5)==1)
    CorrectIDCode(i)='F'
end
if(CorrectEmotions(i,6)==1)
    CorrectIDCode(i)='G'
end
if(CorrectEmotions(i,7)==1)
    CorrectIDCode(i)='J'
end
end

for i=1:length(myData)
    myData(i,7)= cellstr(CorrectIDCode(str2double(cell2mat(myData(i,2)))));
    myData(i,8)= num2cell(double(isequal (myData(i,3),myData(i,7))));
    
end

%Calculate accuracy 

Valencegroups= array2table (myData, ...
'VariableNames',{'Trial','StimID','Response','RTms','ID','Timepoint','CorrectE','Match'});

for i = 1:height(Valencegroups)
    Valencegroups.newResponse(i)=Valencegroups.Response{i};
    Valencegroups.newMatch(i)=Valencegroups.Match{i};
end


 Valencegroups.Trial = str2double(Valencegroups.Trial);
 Valencegroups.StimID = str2double(Valencegroups.StimID);
 Valencegroups.Response = [];
 Valencegroups.Match = [];

VA= findgroups (Valencegroups.newResponse);
meanCorrect=splitapply(@mean,Valencegroups.newMatch,VA)
