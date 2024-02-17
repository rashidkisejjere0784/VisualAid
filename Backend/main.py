from flask import Flask
import os

# blueprint import
from apps.Navigation.Views import navigation_app
from apps.Reading.Views import reading_app

def create_app():
    
    app = Flask(__name__)
    # setup with the configuration provided
    app.config.from_object('config.DevelopmentConfig')
    
    # setup all our dependencies
    #database.init_app(app)
    
    # register blueprint
    app.register_blueprint(navigation_app, url_prefix="/navigation")
    app.register_blueprint(reading_app, url_prefix="/reading")
    
    return app

app = create_app()
app.run(debug=True, host="0.0.0.0", port=8080)