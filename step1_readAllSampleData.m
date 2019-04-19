
e = 1;

END_ROW = 1496513;


chunk_size = 100000;

filename = 'Nominal Data/norm_icmp.csv';

idx = 0;

normalData = [];
duplicateTimes = [];

while e < END_ROW
    
    idx = idx+1
    
    start = e + 1;
    e = min(start + chunk_size-1, END_ROW);
    data = readChunkOfData(filename,start,e);
    
    [table, duplicateTime] = generateDataTable(data, users);
    duplicateTimes = [duplicateTimes; duplicateTime]; 
    normalData = [ normalData ; table];
    
end

% there will be duplicate times in the first column in some rows -> sum the
% rows with duplicate indexes

[a,~,c] = unique(normalData(:,1));
normalTestData_ = zeros(size(a,1),size(normalData,2));
normalTestData_(:,1) = a;
for i = 2:size(normalData,2)
    normalTestData_(:,i) = accumarray(c,normalData(:,i));
end

clearvars a c i idx start e data table chunk_size END_ROW filename
