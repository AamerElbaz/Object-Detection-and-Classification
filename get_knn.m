function knn_class=get_knn(FeatureVec,TrainingVec,TrainingLab,k)

    [sorted,idx]=sort(eq_dist(FeatureVec,TrainingVec));
    
    sortedLab={};
    
    for i=1:k
       sortedLab={sortedLab;TrainingLab(idx(i,1),1)};
    end
    knn_class=mode(sortedLab);
end