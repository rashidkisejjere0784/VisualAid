from google.cloud import vision
import os

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "./credentials/visualaid-412011-7f42cdcc8be0.json"

def detect_text(content):
    """Detects text in the file."""

    client = vision.ImageAnnotatorClient()

    image = vision.Image(content=content)

    response = client.text_detection(image=image)
    texts = response.text_annotations
    print("Texts:")
    extracted_text = ""

    for text in texts:
        extracted_text += str(text.description) + " "
  

    if response.error.message:
        raise Exception(
            "{}\nFor more info on error messages, check: "
            "https://cloud.google.com/apis/design/errors".format(response.error.message)
        )

    
    return extracted_text