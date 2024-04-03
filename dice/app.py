from flask import Flask

def create_app():
    """
    create a new flask application using Flask factory pattern

    :return: flask Application
    """

    app = Flask(__name__,instance_relative_config = True)

    app.config.from_object('config.settings')
    app.config.from_pyfile('settings.py',silent=True)

    @app.route('/')
    def index():
        return app.config['HELLO']
    
    return app