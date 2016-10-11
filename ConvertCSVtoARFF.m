function [  ] = ConvertCSVtoARFF(csvFileName)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
javaaddpath('C:\Program Files\Weka-3-8\weka.jar'); %Path to the weka.jar executable file
import weka.core.Instances.*;
import weka.core.converters.*;

csvLoader = weka.core.converters.CSVLoader;
sourceFile = javaObject('java.io.File', csvFileName)
csvLoader.setSource(sourceFile);
data = csvLoader.getDataSet();

arffSaver = weka.core.converters.ArffSaver;
arffSaver.setInstances(data);
arffFileName = csvFileName(1:end-4);
arffFileName = strcat(arffFileName,'.arff');
destinationFile = javaObject('java.io.File', arffFileName);
arffSaver.setFile(destinationFile);
arffSaver.writeBatch();

end

