from google.cloud import vision
import os

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "./credentials/visualaid-412011-7f42cdcc8be0.json"

def detect_text(content):
    """Detects text in the file."""

    # Instantiates a client
    client = vision.ImageAnnotatorClient()

    image = vision.Image(content=content)

    # Performs text detection on the image file
    response = client.text_detection(image=image)
    texts = response.text_annotations

    print("Texts:")
    texts_list = [{'description': text.description, 'bounding_box': [(vertex.x, vertex.y) for vertex in text.bounding_poly.vertices]} for text in texts]
    
    detected_text = " ".join([annotation['description'] for annotation in texts_list])


    return detected_text
