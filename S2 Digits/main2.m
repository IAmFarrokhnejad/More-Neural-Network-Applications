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

% Combine all weight matrices into one matrix
W_all = [W0; W1; W2; W3; W4; W5; W6; W7; W8; W9];

% Initialize the output matrix
out = zeros(35, 2);

% Define corruption percentage
q = 0;
c = q*10;

%Store results
results = cell(45, 5); % 10C2 = 45 different sets of numbers

% Loop through all combinations of four patterns
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

        % Calculate the output for each pattern
        out(:, 1) = (corrupt(pat_in1(:)', c) * W_tot)';
        out(:, 2) = (corrupt(pat_in2(:)', c) * W_tot)';
        out = hardlims(out);
        
        % Compare outputs with expected outputs
        expected_output = [pat_in1(:), pat_in2(:)];
        correct1 = all(out(:,1)==expected_output(:,1));
        correct2 = all(out(:,2)==expected_output(:,2));
        correct_sum = correct1 + correct2; 
        
        % Display information about the set
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

    end
end

% Extract total accuracies
total_accuracies = cell2mat(results(:, 2));
average_accuracy = sum(total_accuracies)/45;
average_accuracies = [average_accuracies,average_accuracy];
corruptions = [corruptions, c];

% % Plot total accuracy
%figure;
%plot(total_accuracies, '-o');
%hold on;

% % Plot overall average accuracy
%yline(average_accuracy, '--');
%hold off;

%title('Total Accuracy');
%xlabel('Input Set');
%ylabel('Accuracy');
%legend('Total Accuracy', 'Average Accuracy');
