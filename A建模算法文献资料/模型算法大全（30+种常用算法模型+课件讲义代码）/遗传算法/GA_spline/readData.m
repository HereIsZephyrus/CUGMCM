function readData()
origin=dlmread('20150915dataform.csv');
global voltageX;
global outputY;
global len;
len=length(origin)/2;
voltageX=origin(1:2:(len)*2-1,:);
outputY=origin(2:2:(len)*2,:);
end