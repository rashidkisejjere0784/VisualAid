from flask import Blueprint, request, url_for, redirect, render_template, flash, jsonify
from PIL import Image
import pytesseract

reading_app = Blueprint('reading_app', __name__)
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

@reading_app.route("/extract_img", methods = ["POST"])
def home():
    try:
        img_file = request.files["image"]
        text = pytesseract.image_to_string(Image.open(img_file))
        
    
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