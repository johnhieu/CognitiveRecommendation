function [ returnString ] = GenerateAssociationRules(fileName)
%import weka library and add java path
javaaddpath('C:\Program Files\Weka-3-8\weka.jar'); %Path to the weka.jar executable file
import weka.core.Instances.*;

options = '-N 15 -T  -C 0.3 -D 0.05 -U 1.0 -M 0.01 -S -1.0 -c -1'; % parameters for Apriori algorithm 
tempVar = java.lang.String(options);
params = tempVar.split(' ');
association = weka.associations.Apriori;
association.setOptions(params); % set the parameters
ConvertCSVtoARFF(fileName); % call to method for convertion of csv to arff
returnString = 'No rules found';
arffFileName = fileName(1:end-4);
arffFileName = strcat(arffFileName,'.arff');
reader = javaObject('java.io.FileReader', arffFileName); %File name has to be in .arff format
data = javaObject('weka.core.Instances', reader);
association.buildAssociations(data); % Generate the association rules
tempString = association.toString();
tempString = java.lang.String(tempString);

 
if tempString.indexOf('Best rules found') == -1 %No rules are generated from the dataset
    returnString = 'No rules found';
else
    returnString = char(tempString.substring(tempString.indexOf('Best rules found'))); %just sending back the rules to the caller

end