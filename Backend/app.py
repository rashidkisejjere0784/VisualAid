from flask import Flask

# blueprint import
from apps.Navigation.Views import navigation_app

def create_app():
    app = Flask(__name__)
    # setup with the configuration provided
    app.config.from_object('config.DevelopmentConfig')
    
    # setup all our dependencies
    #database.init_app(app)
    
    # register blueprint
    app.register_blueprint(navigation_app, url_prefix="/navigation")
    
    return app

if __name__ == "__main__":
    create_app().run()