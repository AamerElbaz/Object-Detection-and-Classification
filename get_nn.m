function nn_class=get_nn(FeatureVec,TrainingVec,TrainingLab)

    [r,c]=min(eq_dist(FeatureVec,TrainingVec));
    nn_class=TrainingLab(r,c);
    
end