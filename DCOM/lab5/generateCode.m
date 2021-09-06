
function output = generateCode(prevRes, array, offset)
    if(length(array) == 1)
        output = prevRes;
        return;
    end
    equiIndex = equiPartitionIndex(array);
    for i = 1:equiIndex
        prevRes{offset+i-1} = [prevRes{offset+i-1}, 0];
    end
    for i = equiIndex+1:length(array)
        prevRes{offset+i-1} = [prevRes{offset+i-1}, 1];
    end
    prevRes = generateCode(prevRes, array(1:equiIndex), offset);
    prevRes = generateCode(prevRes, array(equiIndex+1:end), equiIndex+offset);
    output = prevRes;
end

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
