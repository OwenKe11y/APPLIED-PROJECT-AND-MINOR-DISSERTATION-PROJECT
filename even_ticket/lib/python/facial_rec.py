import face_recognition as fr
import os
import cv2
import face_recognition
import numpy as np
from time import sleep

# Looks through the faces folder and encodes all the faces
def get_encoded_faces():    
    encoded = {}
    
    for filename in os.listdir("../../python/faces"):          
        if filename.endswith(".jpg") or filename.endswith(".png"):
            face = fr.load_image_file("../../python/faces/" + filename)
            os.remove("../../python/faces/" + filename)
            encoding = fr.face_encodings(face)[0]
            encoded[filename.split(".")[0]] = encoding
            
    # Returns array of the image name and encoded face
    return encoded



# Takes in the file path of the scanned image
def classify_face(im):
    # Seperate list of known faces into face name and encoded image
    faces = get_encoded_faces()
    faces_encoded = list(faces.values())
    known_face_names = list(faces.keys())

    # Reads in the scanned image
    img = cv2.imread(im, 1)
    
    # The coordinates of each corner of the scanned face
    face_locations = face_recognition.face_locations(img)
    # The encoded details of the scanned face and its coordinates
    unknown_face_encodings = face_recognition.face_encodings(img, face_locations)
    
    face_names = []

    # Compares the scanned face against every known face in the database
    for face_encoding in unknown_face_encodings:
        # See if the scanned face is a match for the known face(s)
        matches = face_recognition.compare_faces(faces_encoded, face_encoding)
        name = "Unknown"
        
        # use the known face with the smallest distance to the new face
        face_distances = face_recognition.face_distance(faces_encoded, face_encoding)
        # Gets the index of the best matched face
        best_match_index = np.argmin(face_distances)

        # If theres a match, return the name of the matched face
        if matches[best_match_index]:
            name = known_face_names[best_match_index]

        face_names.append(name)

        if face_names[0] == "Unknown":
            print("No match")
        else:
            print("Match Face of "+face_names[0])

        os.remove("../../python/face.jpg")
       
# Classify the image of path python, test   
classify_face("../../python/face.jpg")
