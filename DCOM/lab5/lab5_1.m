% has dependency on generateCode.m make sure it is in same directory as this file is
% letters=['a', 'b', 'c', 'd', 'e', 'f', 'g'];
% probabilities = [0.46, 0.30, 0.12, 0.06, 0.03, 0.02, 0.01];


% symbols and corresponding probability
letters=['M1', 'M2', 'M3', 'M4', 'M5', 'M6', 'M7', 'M8'];
probabilities = [0.5, 0.15, 0.15, 0.08, 0.08, 0.02, 0.01, 0.01];

% empty cells to store the generated code
resultCode=cell(1,length(probabilities));

% sort the probabilities in descending order
[sortedProb, sortedIndices] = sort(probabilities, 'descend');

% generate the code
resultCode=generateCode(resultCode, sortedProb, 1);

% display the generated code
for i=1:length(probabilities)
    disp(['  ',letters(sortedIndices(i)), ' ---- ' ,num2str(sortedProb(i)), ' ---- ', num2str(resultCode{i}) ]);
end

resultCodelength = [];
for index = 1:length(resultCode)
    resultCodelength=[resultCodelength,length(resultCode{index})];
end

% display the average length of the code
avgLength = sum(sortedProb.*resultCodelength);
disp(['The expected length of bits for the code developed is ' num2str(avgLength)]);

%calculate entropy
ent = -sum(probabilities.*log2(probabilities)); 

%display result
disp(['Entropy = ' num2str(ent)]); 

%calculate efficiency
disp(['Efficiency = ' num2str(ent*100/avgLength) '%']);

