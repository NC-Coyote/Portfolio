# Handwritten digit recognition for MNIST dataset using Convolutional Neural Networks

# Step 1: Import all required keras libraries
from keras.datasets import mnist # This is used to load mnist dataset later
from keras.utils import np_utils as npu # This will be used to convert your test image to a categorical class (digit from 0 to 9)

import tensorflow as tf

# Step 2: Load and return training and test datasets
def load_dataset():
	# 2a. Load dataset X_train, X_test, y_train, y_test via imported keras library
    (X_train, y_train), (X_test, y_test) = mnist.load_data()
    # 2b. reshape for X train and test vars - Hint: X_train = X_train.reshape((X_train.shape[0], 28, 28, 1)).astype('float32')
    X_train = X_train.reshape((X_train.shape[0], 28, 28, 1)).astype('float32')
    X_test = X_test.reshape((X_test.shape[0], 28, 28, 1)).astype('float32')
	# 2c. normalize inputs from 0-255 to 0-1 - Hint: X_train = X_train / 255
    X_train /= 255.0
    X_test /= 255.0    
	# 2d. Convert y_train and y_test to categorical classes - Hint: y_train = np_utils.to_categorical(y_train)
    y_train = npu.to_categorical(y_train)
    y_test = npu.to_categorical(y_test)
	# 2e. return your X_train, X_test, y_train, y_test
    return X_train, y_train, X_test, y_test

# Step 3: define your CNN model here in this function and then later use this function to create your model
def digit_recognition_cnn():
	# 3a. create your CNN model here with Conv + ReLU + Flatten + Dense layers
    model = tf.keras.models.Sequential()
            # convolution layer 1
    model.add(tf.keras.layers.Conv2D(filters=30, kernel_size=(5, 5), activation='relu', input_shape=(28,28,1)))
            # pooling layer 1
    model.add(tf.keras.layers.MaxPool2D(pool_size=2, strides=2))
            # convolution layer 2
    model.add(tf.keras.layers.Conv2D(filters=15, kernel_size=(3, 3), activation='relu'))
            # pooling layer 2
    model.add(tf.keras.layers.MaxPool2D(pool_size=2, strides=2))
            # dropout (20%)
    model.add(tf.keras.layers.Dropout(0.20))
            # flatten
    model.add(tf.keras.layers.Flatten())
            # dense layer 1 (128 units + ReLU)
    model.add(tf.keras.layers.Dense(units=128, activation='relu'))
            # dense layer 2 (50 units + ReLU)
    model.add(tf.keras.layers.Dense(units=50, activation='relu'))
            # dense layer 3 (10 units + softmax)
    model.add(tf.keras.layers.Dense(units=10, activation='softmax'))
	# 3b. Compile your model with categorical_crossentropy (loss), adam optimizer and accuracy as a metric
    model.compile(optimizer = 'adam', loss='categorical_crossentropy', metrics = ['accuracy'])
	# 3c. return your model
    return model

# Load MNIST data
X_train, y_train, X_test, y_test = load_dataset()
# Step 4: Call digit_recognition_cnn() to build your model
builtModel = digit_recognition_cnn()
# Step 5: Train your model and see the result in Command window. Set epochs to a number between 10 - 20 and batch_size between 150 - 200
builtModel.fit(X_train, y_train, epochs = 15, batch_size = 175)
# Step 6: Evaluate your model via your_model_name.evaluate() function and copy the result in your report
builtModel.evaluate(X_test, y_test, verbose = 0)
# Step 7: Save your model via your_model_name.save('digitRecognizer.h5')
builtModel.save('digitRecognizer.h5')


# Code below to make a prediction for a new image.
# Step 8: load required keras libraries
from keras.preprocessing.image import load_img
from keras.preprocessing.image import img_to_array
from keras.models import load_model

import numpy as np
 
# Step 9: load and normalize new image
def load_new_image(path):
    # 9a. load new image
    newImage = load_img(path, color_mode = "grayscale", target_size=(28, 28))
	# 9b. Convert image to array
    newImage = img_to_array(newImage)
	# 9c. reshape into a single sample with 1 channel (similar to how you reshaped in load_dataset function)
    newImage = newImage.reshape(1, 28, 28, 1).astype('float32')
	# 9d. normalize image data - Hint: newImage = newImage / 255
    newImage /= 255.0
	# 9e. return newImage
    return newImage

# Step 10: load a new image and predict its class
def test_model_performance():
	# 10a. Call the above load image function
    img = load_new_image('sample_images/digit7.png')
	# 10b. load your CNN model (digitRecognizer.h5 file)
    loadedModel = load_model('digitRecognizer.h5')
	# 10c. predict the class - Hint: imageClass = your_model_name.predict_classes(img)
    #imageClass = loadedModel.predict_classes(img)    # apparently, this is depricated so I used the np.argmax... command on the following line
    imageClass = np.argmax(loadedModel.predict(img), axis=-1)
	# 10d. Print prediction result
    print("\nThe handwritten number is: ", imageClass[0])
    print("\n\n")
 
# Step 11: Test model performance here by calling the above test_model_performance function
test_model_performance()