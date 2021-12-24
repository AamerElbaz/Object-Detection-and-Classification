function [distance]=eq_dist(FeatureVec,TrainingVec)
global img_testing;
FeatureVec = img_testing;



  distance=[];
  
    for i=1:size(TrainingVec,1)
        distance=[distance;sqrt(sum((FeatureVec-TrainingVec(i,:)).^2))];
    end  
end