Valencegroups= array2table (myData, ...
'VariableNames',{'Trial','StimID','response','rtms','id','timepoint','correcte','match'});

for i = 1:height(Valencegroups)
    Valencegroups.Response(i)=Valencegroups.response{i};
    Valencegroups.RTms(i)=Valencegroups.rtms{i};
    Valencegroups.ID(i)=Valencegroups.id{i};
    Valencegroups.Timepoint(i)=Valencegroups.timepoint{i};
    Valencegroups.CorrectE(i)=Valencegroups.correcte{i};
    Valencegroups.Match(i)=Valencegroups.match{i};
end


%Error:(specific valence, rest of rows are kept)
%Rows with missing data deleted:
Valencegroups(1305,:) = [];
Valencegroups(6433,:) = [];
Valencegroups(13243,:) = [];
Valencegroups(15072,:) = [];
Valencegroups(17336,:) = [];
Valencegroups(28443,:) = [];
Valencegroups(32919,:) = [];
Valencegroups(36261,:) = [];
Valencegroups(41483,:) = [];

%Identify missing points. Just to double check
Missing = Valencegroups(Valencegroups.Response == '.', :);

%Sort table. Delete old columns
Valencegroups(:,3:5) = [];
Valencegroups(:,4:5) = [];
Valencegroups.Trial = str2double(Valencegroups.Trial);
Valencegroups.StimID = str2double(Valencegroups.StimID);
Valencegroups = Valencegroups(:,{'Trial','StimID','Response','RTms','ID','Timepoint','CorrectE','Match'}); 

