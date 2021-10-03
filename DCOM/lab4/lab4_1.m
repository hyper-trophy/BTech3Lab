
% letters=['a','e','i','k','l','r','n','m','?','t','s','y','d','u','o','b','?','¸','Á','z','g','p','h','c','v','ˆ','?','f','j'];

% probabilities = [0.1277 0.092 0.0778 0.0718 0.064 0.0602 0.0543 0.0536 0.0424 0.0418 0.0352 0.029 0.0278 0.0267 0.0251 0.0201 0.0192 0.0174 0.0157 0.0155 0.0144 0.0135 0.011 0.0103 0.0101 0.0081 0.0078 0.0068 0.0007];
clc
clear all;

%lettes and their probabilities
letters=['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
probabilities = [0.26, 0.22,0.14, 0.12, 0.1, 0.08, 0.05, 0.03];

% cell array which includes empty vectors with index
% resultCode=[][][].... 
resultCode=cell(1,length(probabilities));

%we will build the code in reverse order, at the end we will reverse it to get the actual code
resultCodeReversed=cell(1,length(probabilities));

% [1, 2, 3, ..., n]
setIndices=(1:1:length(probabilities));

% setContent=[1][2][3]...[n]
setContent=num2cell(setIndices);

%coping probabilities, as it is undergoing modification
probablityKeeper = probabilities(:);

% displying symbols and their probabilities
disp('=============================================================================');
disp('The letters and their probabilities are:')
for setIndex = 1:length(probablityKeeper)
    disp(['  ',letters(setIndex), ' ---- ' ,num2str(probablityKeeper(setIndex)) ]);
end

% loop until there is only 1 node in the tree
while length(setContent) > 1
    % sortedIndices stores the indices of the probabilities in ascending order
    [temp, sortedIndices] = sort(probablityKeeper);

    % grab the node with lowest probability
    lowestIndex = setContent{sortedIndices(1)};
    lowestProb = probablityKeeper(sortedIndices(1));

    % grab the node with second lowest probability
    secondLowest = setContent{sortedIndices(2)};
    secondLowestProb = probablityKeeper(sortedIndices(2));

    % assign 0 to the left tree 
    for binaryletter_index = 1:length(lowestIndex)
        resultCode{lowestIndex(binaryletter_index)} = [resultCode{lowestIndex(binaryletter_index)}, 0]; 
    end

    % assign 1 to the right tree
    for binaryletter_index = 1:length(secondLowest)
        resultCode{secondLowest(binaryletter_index)} = [resultCode{secondLowest(binaryletter_index)}, 1];       
    end
    
    % remove the lowest 2 probability node from the setContent
    setContent(sortedIndices(1:2)) = [];
    setContent{length(setContent)+1} = [lowestIndex, secondLowest];

    % remove the lowest 2 probability node from the probablityKeeper
    probablityKeeper(sortedIndices(1:2)) = [];

    % add the new probability node with value equal to sum of 2 lowest probability to the probablityKeeper
    probablityKeeper(length(probablityKeeper)+1) = lowestProb + secondLowestProb;
end

disp('=============================================================================');
disp('The letters, their probabilities and the allocated Huffman binary numbers are:');

% reverse the resultCode to get the actual code
for index = 1:length(resultCode)
    resultCodeReversed{index}=fliplr(resultCode{index});
end


% display the huffman code for each letter
for index = 1:length(resultCode)
    disp(['  ', num2str(letters(index)), ' ---- ',num2str(resultCodeReversed{index})]);
end

disp('=============================================================================');

% store the length of the code for each letter 
resultCodelength=[];
for index = 1:length(resultCode)
    resultCodelength=[resultCodelength,length(resultCodeReversed{index})];
end

% display the average length of the code
avgLength = sum(probabilities.*resultCodelength);
disp(['The expected length of bits for the code developed is ' num2str(avgLength)]);

%calculate entropy
ent = -sum(probabilities.*log2(probabilities)); 

%display result
disp(['Entropy = ' num2str(ent)]); 

%calculate efficiency
disp(['Efficiency = ' num2str(ent*100/avgLength) '%']);
