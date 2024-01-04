from flask import Blueprint, request, url_for, redirect, render_template, flash, jsonify

navigation_app = Blueprint('navigation_app', __name__)

@navigation_app.route("/")
def home():
    return jsonify({
        "Message" : "Hello World"
    })

@navigation_app.app_errorhandler(404)
def page_not_found(e):
    return jsonify({
        "Error" : "Error"
    })