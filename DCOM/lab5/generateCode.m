
function output = generateCode(prevRes, array, offset)
    % base case if lengeth is 1 return prevRes
    if(length(array) == 1)
        output = prevRes;
        return;
    end
    % get the index for equi partition of array
    equiIndex = equiPartitionIndex(array);
    % assign 0 to left half of array
    for i = 1:equiIndex
        prevRes{offset+i-1} = [prevRes{offset+i-1}, 0];
    end
    % assign 1 to right half of array
    for i = equiIndex+1:length(array)
        prevRes{offset+i-1} = [prevRes{offset+i-1}, 1];
    end
    % recursively call generateCode for left and right half of array
    prevRes = generateCode(prevRes, array(1:equiIndex), offset);
    prevRes = generateCode(prevRes, array(equiIndex+1:end), equiIndex+offset);
    % return the result
    output = prevRes;
end

% function to get equi partition index of array
function index = equiPartitionIndex(array)
    minDiff = Inf;
    for i = 1:length(array)
        diff = abs(sum(array(1:i)) - sum(array(i+1:end)));
        if diff < minDiff
            minDiff = diff;
            index = i;
        end
    end
end
