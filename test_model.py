import argparse
from keras.models import load_model
import numpy as np
from keras.preprocessing.image import ImageDataGenerator

def parse_args():
    parser = argparse.ArgumentParser(description='Testing a pre-trained TensorFlow model on a folder of images')
    parser.add_argument('--model_path', type=str, help='File path of the trained model')
    parser.add_argument('--image_folder_path', type=str, help='path to the folder with images to be tested')
    parser.add_argument('--output_file_path', type=str, help='path to the output text file')
    parser.add_argument('--target_size', type=int, default=224, help='target size of the input image')
    return parser.parse_args()

results = []

args = parse_args()

model = load_model(args.model_path)

test_datagen = ImageDataGenerator(rescale=1./255)
test_generator = test_datagen.flow_from_directory(args.image_folder_path,
                                        target_size=(args.target_size, args.target_size),
                                        shuffle=False,
                                        batch_size=32,
                                        class_mode='categorical')

predictions = model.predict(test_generator)
loss, accuracy = model.evaluate(test_generator)

print("Test accuracy:", accuracy)
print("Test loss:", loss)

class_labels = test_generator.class_indices
class_labels = dict((a,b) for b,a in class_labels.items())

with open(args.output_file_path, 'w') as f:
    for i in range(len(predictions)):
        top_classes = np.argsort(predictions[i])[::-1][:5]
        img_path = test_generator.filepaths[i]
        f.write('Image: {}\n'.format(img_path))
        for j in top_classes:
            f.write('    {}: {:.2f}%\n'.format(class_labels[j], predictions[i][j]*100))
        f.write('\n')