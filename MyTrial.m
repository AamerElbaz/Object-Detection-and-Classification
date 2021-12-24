function [distance]=eq_dist(FeatureVec,TrainingVec)

  distance=[];
  
    for i=1:size(TrainingVec,1)
        distance=[distance;sqrt(sum((FeatureVec-TrainingVec(i,:)).^2))];
    end  
end

function nn_class=get_nn(FeatureVec,TrainingVec,TrainingLab)

    [r,c]=min(eq_dist(FeatureVec,TrainingVec));
    nn_class=TrainingLab(r,c);
    
end

function knn_class=get_knn(FeatureVec,TrainingVec,TrainingLab,k)

    [sorted,idx]=sort(eq_dist(FeatureVec,TrainingVec));
    
    sortedLab={};
    
    for i=1:k
       sortedLab={sortedLab;TrainingLab(idx(i,1),1)};
    end
    knn_class=mode(sortedLab)
    
end