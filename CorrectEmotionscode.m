CorrectEmotions = xlsread('CorrectEmotions.xls');
CorrectEmotions(251,:) = [];
CorrectEmotions(:,1) = [];
CorrectEmotions(isnan(CorrectEmotions)) = 0;
CorrectEmotions(:,8) = []; %Valence Surprise was not used 

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

%Error: Index exceeds the number of array elements (250).
%ID 4040_T1, Trial 11, stimID 84. Missing point. Adjusted '.'