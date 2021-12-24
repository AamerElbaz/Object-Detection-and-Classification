 
function[] = True_training(path,label)

global img_training;
img_training =[];
global img_testing;
img_testing =[];
global label_training;
label_training = {};
global label_testing;
label_testing ={};


         for img_index = 1:100
             image = imread(sprintf('%s/image_%04d.jpg',path,img_index));
             resized_image = imresize(image,[450 450]);
             [Feature_vector,hogVisualization] = extractHOGFeatures(resized_image);
            
             if img_index < 71
                 img_training = [img_training;Feature_vector];
                 label_training  = [label_training;label];
                 
             else
                 img_testing = [img_testing,Feature_vector];
                 label_testing  = [label_testing,label];
             
             
             end
    
         end
             figure;
             imshow(resized_image);
             hold on;
             plot(hogVisualization);
             
end