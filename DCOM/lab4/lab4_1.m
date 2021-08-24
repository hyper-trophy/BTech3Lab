
letters=['a','e','i','k','l','r','n','m','?','t','s','y','d','u','o','b','?','¸','Á','z','g','p','h','c','v','ˆ','?','f','j'];

probabilities = [0.1277 0.092 0.0778 0.0718 0.064 0.0602 0.0543 0.0536 0.0424 0.0418 0.0352 0.029 0.0278 0.0267 0.0251 0.0201 0.0192 0.0174 0.0157 0.0155 0.0144 0.0135 0.011 0.0103 0.0101 0.0081 0.0078 0.0068 0.0007];

% cell array which includes empty vectors with index
% resultCode=[][][].... 
resultCode=cell(1,length(probabilities));
resultCodeReversed=cell(1,length(probabilities));

setIndices=(1:1:length(probabilities));

% setContent=[1][2][3]... 
setContent=num2cell(setIndices);

%coping probabilities, as it is undergoing modification
probablityKeeper = probabilities(:);

disp('==========================================================================');
disp('The letters and their probabilities are:')
for setIndex = 1:length(probablityKeeper)
    disp(['  ',letters(setIndex), ' ---- ' ,num2str(probablityKeeper(setIndex)) ]);
end

while length(setContent) > 1
    [temp, sortedIndices] = sort(probablityKeeper);

    lowestIndex = setContent{sortedIndices(1)};
    lowestProb = probablityKeeper(sortedIndices(1));

    secondLowest = setContent{sortedIndices(2)};
    secondLowestProb = probablityKeeper(sortedIndices(2));

    for binaryletter_index = 1:length(lowestIndex)
        resultCode{lowestIndex(binaryletter_index)} = [resultCode{lowestIndex(binaryletter_index)}, 0]; 
    end

    for binaryletter_index = 1:length(secondLowest)
        resultCode{secondLowest(binaryletter_index)} = [resultCode{secondLowest(binaryletter_index)}, 1];       
    end
    
    setContent(sortedIndices(1:2)) = [];
    setContent{length(setContent)+1} = [lowestIndex, secondLowest];
    probablityKeeper(sortedIndices(1:2)) = [];
    probablityKeeper(length(probablityKeeper)+1) = lowestProb + secondLowestProb;
end


disp('==========================================================================');
disp('The letters, their probabilities and the allocated Huffman binary numbers are:');


for index = 1:length(resultCode)
    resultCodeReversed{index}=fliplr(resultCode{index});
end


for index = 1:length(resultCode)
    disp(['  ', num2str(letters(index)), ' ---- ',num2str(resultCodeReversed{index})]);
end

disp('==========================================================================');

disp('The expected length of bits for the code developed');

resultCodelength=[];
for index = 1:length(resultCode)
    resultCodelength=[resultCodelength,length(resultCodeReversed{index})];
end

disp(sum(probabilities.*resultCodelength));
disp('Its more than entropy with 0,272 difference')

%veri yazmay? ve almay? ˆ?ren