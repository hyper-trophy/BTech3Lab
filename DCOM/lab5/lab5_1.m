% has dependency on generateCode.m make sure it is in same directory as this file is

letters=['a', 'b', 'c', 'd', 'e', 'f'];
% probabilities = [0.22, 0.26, 0.14, 0.12, 0.1, 0.08, 0.05, 0.03];
probabilities = [0.3, 0.25, 0.20, 0.12, 0.08, 0.05];

resultCode=cell(1,length(probabilities));
[sortedProb, sortedIndices] = sort(probabilities, 'descend');
resultCode=generateCode(resultCode, sortedProb, 1);

for i=1:length(probabilities)
    disp(['  ',letters(sortedIndices(i)), ' ---- ' ,num2str(sortedProb(i)), ' ---- ', num2str(resultCode{i}) ]);
end

disp(resultCode);
