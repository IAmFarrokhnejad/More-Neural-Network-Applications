%Used for comparing architectures

average_accuracies = [];
corruptions = [];
% recall_perc = zeros(4,101);
% recall_perc(:,1) = [65;89;106;120];
% average65 = zeros(1,13);
% average89 = zeros(1,13);
% average106 = zeros(1,13);
% average120 = zeros(1,13);

for q=0:0.5:6
   main3;
%     for z=1:100 
%         recall_perc(:,z+1) = cell2mat(results([65,89,106,120], 2));
%     end
    
end


figure;
plot(corruptions, average_accuracies, '-o');
title('Feedback vs. Normal Accuracy');
xlabel('Corruption %');
ylabel('Average Correct Recalls');
hold on;

average_accuracies = [];
corruptions = [];

for q=0:0.5:6 %z=1:1000
    main3hop;
    %recall_perc(:,z+1) = cell2mat(results([2,3,85], 2));
end


plot(corruptions, average_accuracies, '-+');
legend("Normal", "Feedback");
hold off;
