function [ Table, timeend ] = generateDataTable( data, users ) % return the time which has the potential to be dupplicate in the entire table
%GENERATEDATATABLE Summary of this function goes here
%   Detailed explanation goes here

timeColmn = floor(cell2mat(data(:,1)));
data_ = [num2cell(timeColmn) cellstr(data(:,2))];

featureLength = size(users,1);
timestart = min(cell2mat(data_(:,1)));
timeend = max(cell2mat(data_(:,1)));

Table = zeros(timeend-timestart+1, featureLength + 1); % first column is time

for i=1:size(Table,1)
    time_idx = timestart + i -1;
    temp = data_(cell2mat(data_(:,1)) == time_idx,:);
    Table(i,1) = time_idx;
    Table(i,2:end) = cell2mat(cellfun(@(x) sum(ismember(temp(:,2),x)),users,'un',0));
end


end

