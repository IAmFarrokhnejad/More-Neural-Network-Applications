%Define patterns
pat_1 = [-1 -1 1 -1 -1
         -1  1 1 -1 -1
         -1 -1 1 -1 -1
         -1 -1 1 -1 -1
         -1 -1 1 -1 -1
         -1 -1 1 -1 -1
         -1  1 1  1 -1];
     
pat_2 = [-1  1  1  1 -1
          1 -1 -1 -1  1
         -1 -1 -1 -1  1
         -1 -1 -1  1 -1
         -1 -1  1 -1 -1
         -1  1 -1 -1 -1
          1  1  1  1  1];
     
pat_3 = [-1  1  1  1 -1
          1 -1 -1 -1  1
         -1 -1 -1 -1  1
         -1 -1  1  1 -1
         -1 -1 -1 -1  1
          1 -1 -1 -1  1
         -1  1  1  1 -1];
     
pat_4 = [-1 -1 -1 -1  1
         -1 -1 -1  1  1
         -1 -1  1 -1  1
         -1  1 -1 -1  1
          1  1  1  1  1
         -1 -1 -1 -1  1
         -1 -1 -1 -1  1];
     
pat_5 = [ 1  1  1  1  1
          1 -1 -1 -1 -1
          1 -1 -1 -1 -1
          1  1  1  1 -1
         -1 -1 -1 -1  1
         -1 -1 -1 -1  1
          1  1  1  1 -1];
     
pat_6 = [-1  1  1  1  1
          1 -1 -1 -1 -1
          1 -1 -1 -1 -1
          1  1  1  1 -1
          1 -1 -1 -1  1
          1 -1 -1 -1  1
         -1  1  1  1 -1];
     
pat_7 = [ 1  1  1  1  1
         -1 -1 -1 -1  1
         -1 -1 -1  1 -1
         -1 -1 -1  1 -1
         -1 -1  1 -1 -1
         -1 -1  1 -1 -1
         -1  1 -1 -1 -1];
     
pat_8 = [-1  1  1  1 -1
          1 -1 -1 -1  1
          1 -1 -1 -1  1
         -1  1  1  1 -1
          1 -1 -1 -1  1
          1 -1 -1 -1  1
         -1  1  1  1 -1];
     
pat_9 = [-1  1  1  1 -1
          1 -1 -1 -1  1
          1 -1 -1 -1  1
         -1  1  1  1  1
         -1 -1 -1 -1  1
         -1 -1 -1 -1  1
          1  1  1  1 -1];
     
pat_0 = [-1  1  1  1 -1
          1 -1 -1 -1  1
          1 -1 -1 -1  1
          1 -1 -1 -1  1
          1 -1 -1 -1  1
          1 -1 -1 -1  1
         -1  1  1  1 -1];

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
out = zeros(35, 4);

% Define corruption percentage
% q = 0;
c = q*10;

%Store results
results = cell(210, 5); % 10C4 = 210 different sets of numbers

% Loop through all combinations of four patterns
a = 1;
for i = 0:6
    for j = i + 1:7
        for k = j + 1:8
            for m = k+1:9
                % Reset W_tot for the next iteration
                W_tot = zeros(35,35);
                
                % Update W_tot by summing selected weight matrices
                W_tot = W_tot + W_all(i * 35 + 1:(i + 1) * 35, :);
                W_tot = W_tot + W_all(j * 35 + 1:(j + 1) * 35, :);
                W_tot = W_tot + W_all(k * 35 + 1:(k + 1) * 35, :);
                W_tot = W_tot + W_all(m * 35 + 1:(m + 1) * 35, :);
                
                % Extract input patterns
                pat_in1 = pats(i * 7 + 1:(i + 1) * 7, :);
                pat_in2 = pats(j * 7 + 1:(j + 1) * 7, :);
                pat_in3 = pats(k * 7 + 1:(k + 1) * 7, :);
                pat_in4 = pats(m * 7 + 1:(m + 1) * 7, :);
                expected_output = [pat_in1(:), pat_in2(:), pat_in3(:), pat_in4(:)];
                
                % Calculate the output for each pattern
                out(:, 1) = (corrupt(pat_in1(:)', c) * W_tot)';
                out(:, 2) = (corrupt(pat_in2(:)', c) * W_tot)';
                out(:, 3) = (corrupt(pat_in3(:)', c) * W_tot)';
                out(:, 4) = (corrupt(pat_in4(:)', c) * W_tot)';
                out = hardlims(out);
                
                for y=1:100 % Feedback y times
                    out(:, 1) = (out(:,1)' * W_tot)';
                    out(:, 2) = (out(:,2)' * W_tot)';
                    out(:, 3) = (out(:,3)' * W_tot)';
                    out(:, 4) = (out(:,4)' * W_tot)';
                    out = hardlims(out);
                end
                
                
                % Display information about the set and compare with expected output
                
                correct1 = all(out(:,1)==expected_output(:,1));
                correct2 = all(out(:,2)==expected_output(:,2));
                correct3 = all(out(:,3)==expected_output(:,3));
                correct4 = all(out(:,4)==expected_output(:,4));
                correct_sum = correct1 + correct2 + correct3 + correct4;
                
                disp(['Set i=', num2str(i), ', j=', num2str(j), ', k=', num2str(k), ', m=', num2str(m)]);
                disp(['Accuracy i: ', num2str(correct1)]);
                disp(['Accuracy j: ', num2str(correct2)]);
                disp(['Accuracy k: ', num2str(correct3)]);
                disp(['Accuracy m: ', num2str(correct4)]);
                disp(['Accuracy Total: ', num2str(correct_sum)]);
                disp("---");
                
                % Store results
                results{a, 1} = [i, j, k, m]; % Combination indices
                results{a, 2} = correct_sum;   % Number of correct recalls
                results{a, 3} = expected_output;
                results{a, 4} = out;
                results{a, 5} = [correct1, correct2, correct3, correct4];
                
                a = a + 1;
            end
        end
    end
end

% Extract total accuracies
total_accuracies = cell2mat(results(:, 2));
average_accuracy = sum(total_accuracies)/210;
average_accuracies = [average_accuracies,average_accuracy];
corruptions = [corruptions, c];

% % Plot total accuracy
% figure;
% plot(total_accuracies, '-o');
% hold on;
% 
% % Plot overall average accuracy
% yline(average_accuracy, '--');
% hold off;
% 
% title('Total Accuracy');
% xlabel(['Input Set (w/ ', num2str(c), '% corruption)']);
% ylabel('Accuracy');
% legend('Total Accuracy', 'Average Accuracy');
