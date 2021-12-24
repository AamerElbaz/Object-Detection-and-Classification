pathes={};      




function [img_training,img_testing,label_training,label_testing] = True_training(path,label)
img_training =   [];  
img_testing  =   [];
label_training = {};
label_testing  = {};

         for img_index = 1:85
             image = imread(sprintf('%s/image_%04d.jpg',path,img_index));
             resized_image = imresize(image,[128 128]);
             [Feature_vector,hogVisualization] = extractHOGFeatures(resized_image);
            
             if img_index < 71
                 img_training = [img_training(x*70,:);Feature_vector];
                 label_training  = {label_training;label};
                 
             else
                 img_testing = [img_testing;Feature_vector];
                 label_testing  = {label_testing;label};
             
             end
    
         end
             figure;
             imshow(resized_image);
             hold on;
             plot(hogVisualization);
end

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
    knn_class=mode(sortedLab);
end