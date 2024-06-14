%Define patterns
pat_1 = [0 0 1 0 0
         0 1 1 0 0
         0 0 1 0 0
         0 0 1 0 0
         0 0 1 0 0
         0 0 1 0 0
         0 1 1 1 0];
     
pat_2 = [0 1 1 1 0
         1 0 0 0 1
         0 0 0 0 1
         0 0 0 1 0
         0 0 1 0 0
         0 1 0 0 0
         1 1 1 1 1];
     
pat_3 = [0 1 1 1 0
         1 0 0 0 1
         0 0 0 0 1
         0 0 1 1 0
         0 0 0 0 1
         1 0 0 0 1
         0 1 1 1 0];
     
pat_4 = [0 0 0 0 1
         0 0 0 1 1
         0 0 1 0 1
         0 1 0 0 1
         1 1 1 1 1
         0 0 0 0 1
         0 0 0 0 1];
     
pat_5 = [1 1 1 1 1
         1 0 0 0 0
         1 0 0 0 0
         1 1 1 1 0
         0 0 0 0 1
         0 0 0 0 1
         1 1 1 1 0];
     
pat_6 = [0 1 1 1 1
         1 0 0 0 0
         1 0 0 0 0
         1 1 1 1 0
         1 0 0 0 1
         1 0 0 0 1
         0 1 1 1 0];
     
pat_7 = [1 1 1 1 1
         0 0 0 0 1
         0 0 0 1 0
         0 0 0 1 0
         0 0 1 0 0
         0 0 1 0 0
         0 1 0 0 0];
     
pat_8 = [0 1 1 1 0
         1 0 0 0 1
         1 0 0 0 1
         0 1 1 1 0
         1 0 0 0 1
         1 0 0 0 1
         0 1 1 1 0];
     
pat_9 = [0 1 1 1 0
         1 0 0 0 1
         1 0 0 0 1
         0 1 1 1 1
         0 0 0 0 1
         0 0 0 0 1
         1 1 1 1 0];
     
pat_0 = [0 1 1 1 0
         1 0 0 0 1
         1 0 0 0 1
         1 0 0 0 1
         1 0 0 0 1
         1 0 0 0 1
         0 1 1 1 0];

% Combine all patterns into a matrix
pats = [pat_0; pat_1; pat_2; pat_3; pat_4; pat_5; pat_6; pat_7; pat_8; pat_9;];

%Create weight matrices for each pattern
W0 = pat_0(:)*pat_0(:)';
W1 = pat_1(:)*pat_1(:)';
W2 = pat_2(:)*pat_2(:)';
W3 = pat_3(:)*pat_3(:)';
W4 = pat_4(:)*pat_4(:)';
W5 = pat_5(:)*pat_5(:)';
W6 = pat_6(:)*pat_6(:)';
W7 = pat_7(:)*pat_7(:)';
W8 = pat_8(:)*pat_8(:)';
W9 = pat_9(:)*pat_9(:)';
W0 = W0 - diag(diag(W0)');
W1 = W1 - diag(diag(W1)');
W2 = W2 - diag(diag(W2)');
W3 = W3 - diag(diag(W3)');
W4 = W4 - diag(diag(W4)');
W5 = W5 - diag(diag(W5)');
W6 = W6 - diag(diag(W6)');
W7 = W7 - diag(diag(W7)');
W8 = W8 - diag(diag(W8)');
W9 = W9 - diag(diag(W9)');

% Combine all weight matrices into one matrix
W_all = [W0; W1; W2; W3; W4; W5; W6; W7; W8; W9];

% Initialize the output matrix
out = zeros(35, 2);

% Define corruption percentage
% q = 0;
c = q*10;

%Store results
results = cell(45, 5); % 10C2 = 45 different sets of numbers

% Loop through all combinations of two patterns
a = 1;
for i = 0:8
    for j = i + 1:9
        % Reset W_tot for the next iteration
        W_tot = zeros(35,35);
        
        % Update W_tot by summing selected weight matrices
        W_tot = W_tot + W_all(i * 35 + 1:(i + 1) * 35, :);
        W_tot = W_tot + W_all(j * 35 + 1:(j + 1) * 35, :);

        % Extract input patterns
        pat_in1 = pats(i * 7 + 1:(i + 1) * 7, :);
        pat_in2 = pats(j * 7 + 1:(j + 1) * 7, :);
        expected_output = [pat_in1(:), pat_in2(:)];
        
        % Calculate the output for each pattern
        out(:, 1) = (corrupt(pat_in1(:)', c) * W_tot)';
        out(:, 2) = (corrupt(pat_in2(:)', c) * W_tot)';
        out(:, 1) = (out(:,1)>median(out(:,1)));
        out(:, 2) = (out(:,2)>median(out(:,2)));
        
        % Display information about the set and compare with expected output
        correct1 = all(out(:,1)==expected_output(:,1));
        correct2 = all(out(:,2)==expected_output(:,2));
        correct_sum = correct1 + correct2; 
        disp(['Set i=', num2str(i), ', j=', num2str(j)]);
        disp(['Accuracy i: ', num2str(correct1)]);
        disp(['Accuracy j: ', num2str(correct2)]);
        disp(['Accuracy Total: ', num2str(correct_sum)]);
        disp("---");

        % Store results
        results{a, 1} = [i, j]; % Combination indices
        results{a, 2} = correct_sum;   % Number of correct recalls
        results{a, 3} = expected_output;
        results{a, 4} = out;
        results{a, 5} = [correct1, correct2];
        a = a + 1;
    end
end

% Extract total accuracies
total_accuracies = cell2mat(results(:, 2));
average_accuracy = sum(total_accuracies)/45;

% Plot total accuracy
figure;
plot(total_accuracies, '-o');
hold on;

% Plot overall average accuracy
yline(average_accuracy, '--');
hold off;

title('Total Accuracy');
xlabel('Input Set');
ylabel('Correct Recalls');
legend('Total Accuracy', 'Average Accuracy');
