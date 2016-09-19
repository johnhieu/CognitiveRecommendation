%Method for recommending the first widget based on the rank, role and duration of all existing users of the system
%input: rank, role and duration of employment of the first time user
%output: A single recommended widget

function [ returnString ] = recommendWidget(rank, role, duration)
[~,~,data] = xlsread('decisionTreeTest.xls'); %The system will generate this file for matlab to work with
[row, col] = size(data);
class_label = {}; %This will hold the class labels for each record for the training dataset

number_of_training_data = (row-1) * 1; %this will train the model based on all the instances rather than separating training and testing dataset

training_data = data(2:number_of_training_data + 1, 1:col-1); 

%attribute labels:
attr_labels = data(1, 1:end-1);
for i=2:(number_of_training_data + 1)
    class_label(i-1,1) = cellstr(data{i,4});
end

training_data_b = cell2mat(training_data);

%decision tree:
dt = classregtree(training_data_b, class_label, 'method', 'classification', 'names', attr_labels);
%view(dt);

test_recommendation = [rank role duration];
recommendedWidget = dt.eval(test_recommendation);
returnString = recommendedWidget{1:1}; %At this stage, the returnString variable holds the recommended widget ID. 

end