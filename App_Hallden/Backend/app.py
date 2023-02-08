from flask import Flask
from flask_restful import Api
from resources.register import Register
from flask import Blueprint

api_bp = Blueprint('api', __name__)
api = Api(api_bp)

api.add_resource(Register, '/register')
