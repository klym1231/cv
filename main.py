import os
import numpy as np
import tensorflow as tf
import keras
from keras.preprocessing.image import ImageDataGenerator
from keras import regularizers
from keras import Sequential
from keras.layers import Dense, Flatten, Conv2D, MaxPooling2D, Dropout
from keras.callbacks import EarlyStopping
import pandas as pd
from keras.applications import VGG16
from keras.models import Model

dataset = 'DATA/'

image_size = (224, 224)

batch_size = 32
# batch_size = 64

train_data = ImageDataGenerator(rescale=1./255)
train_generator = train_data.flow_from_directory(
    os.path.join(dataset, 'train'),
    target_size=image_size,
    batch_size=batch_size,
    interpolation='nearest',
    seed=42,
    shuffle=True,
    class_mode='categorical')

val_data = ImageDataGenerator(rescale=1./255)
val_generator = val_data.flow_from_directory(
    os.path.join(dataset, 'val'),
    target_size=image_size,
    batch_size=batch_size,
    interpolation='nearest',
    seed=42,
    shuffle=False,
    class_mode='categorical')

test_data = ImageDataGenerator(rescale=1./255)
test_generator = test_data.flow_from_directory(
    os.path.join(dataset, 'test'),
    target_size=image_size,
    batch_size=batch_size,
    class_mode='categorical')

base_model = VGG16(weights='imagenet', include_top=False,
                   input_shape=(224, 224, 3))

learning_rate = 0.0001  # Tried 0.01, 0.001
optimizer = keras.optimizers.Adam(learning_rate=learning_rate)
loss = 'categorical_crossentropy'
metrics = ['accuracy']
epoch = 50              # Tried 10, 30, 50, 100

mycallbacks = [EarlyStopping(
    monitor='val_loss', mode='min', patience=5,  verbose=1)]

model = Sequential([
    base_model,
    Flatten(),
    Dense(256, activation='relu'),              # Tried 64, 128
    Dropout(0.5),
    Dense(len(train_generator.class_indices), activation='softmax')
])

model.compile(optimizer=optimizer,
              loss=loss,
              metrics=metrics)

history = model.fit(train_generator,
                    epochs=epoch,
                    callbacks=mycallbacks,
                    validation_data=val_generator)

model.save(f'model/{epoch}_model.h5')

test_loss, test_acc = model.evaluate(test_generator)

results = []
results.append({
    "epochs": epoch,
    "Test loss": test_loss,
    "Test accuracy": test_acc
})
pd.DataFrame(results).to_csv(f"result{epoch}.csv")