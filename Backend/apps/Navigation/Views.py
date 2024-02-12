from flask import Blueprint, request, url_for, redirect, render_template, flash, jsonify
from .image_caption import getCaption

navigation_app = Blueprint('navigation_app', __name__)

@navigation_app.route("/caption_img", methods = ["POST"])
def home():
    try:
        img_file = request.files["image"]
        
        # Check if the file has a name and is not empty
        if img_file.filename == '' or img_file.read() == b'':
            return jsonify({'error': 'Invalid file'}), 400
            
        img_file.seek(0)

        # Read the image file in binary
        image_binary = img_file.read()

        # Pass the binary image data to the detect_text function
        text = getCaption(image_binary)
        
        return jsonify({
            "Message" : text
        })
        
    except Exception as e:
        print(e)
        return jsonify({
            "Error" : f"{e}"
        })


@navigation_app.app_errorhandler(404)
def page_not_found(e):
    return jsonify({
        "Error" : "Error"
    })
    
