from flask import Blueprint, request, url_for, redirect, render_template, flash, jsonify
from .gcloud_vision import detect_text

reading_app = Blueprint('reading_app', __name__)

@reading_app.route("/extract_img", methods = ["POST"])
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
        text = detect_text(image_binary)
        
        return jsonify({
            "Message" : text
        })
        
    except Exception as e:
        print(e)
        return jsonify({
            "Error" : f"{e}"
        })

@reading_app.app_errorhandler(404)
def page_not_found(e):
    return jsonify({
        "Error" : "Error"
    })