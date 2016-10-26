% Calculates total number of contacts, average number of contacts and standard deviation. 
% Cameron Armstrong 21194619.
function [contacts, average, standardDeviation] = contact(A)
if (size(A,1) ~= 3 && size(A,2) ~= 3)
    disp('Must have either 3 columns or 3 rows.')
    return
end
if size(A,2) ~= 3
    A = A';
end
nrows = size(A,1);
contacts = 0;
contactCount = zeros(nrows,1);
for i=1:nrows-1
    for j=i+1:nrows
        distance = sqrt((A(i,1)-A(j,1))^2 + (A(i,2)-A(j,2))^2);
        radiiSum = A(i,3) + A(j,3);
        if distance <= radiiSum
            contacts = contacts + 1;
            contactCount(i,1) = contactCount(i,1) + 1;
            contactCount(j,1) = contactCount(j,1) + 1;
        end
    end
end
average = contacts / size(A,1);
standardDeviation = std(contactCount);
end