# Face Detection
# 2024-07-11

# Install OpenCV package: opencv-python

import cv2
import sys

image = "day4datasets/test_pic5.jpg"
casc = "day4datasets/haarcascade_frontalface_default.xml"

# Create the haar cascade
faceCascade = cv2.CascadeClassifier(casc)

# Read image
img = cv2.imread(image)

# Remove color, convert to gray image
img_grey = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Detect faces
faces = faceCascade.detectMultiScale(img_grey, scaleFactor=1.4, minSize=(40,40))
print("Found {0} faces.".format(len(faces)))

for (x,y,w,h) in faces:
    r = int(w/2)
    cv2.circle(img, (x+r, y+r), r+20, (200,0,0,100), thickness=5, lineType=1)

cv2.imwrite("faces.jpg", img)
