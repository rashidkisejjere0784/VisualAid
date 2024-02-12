import vertexai
from vertexai.vision_models import ImageTextModel, Image
from .credentials import *
import os
from google.oauth2 import service_account

credentials = service_account.Credentials.from_service_account_file("apps/Navigation/visualaid-412011-ec689afbd8e7.json")


def getCaption(image):
    vertexai.init(project=PROJECT_ID, location=LOCATION, credentials=credentials)
    model = ImageTextModel.from_pretrained("imagetext")

    source_image = Image(image)

    captions = model.get_captions(
        image=source_image,
        # Optional:
        number_of_results=1,
        language="en",
    )
    return captions 