from flask_restful import Resource

class User(Resource):
    def __init__(self, user_id, api_key, first_name, last_name, email, password):
        self.user_id = user_id
        self.api_key = api_key
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.password = password
            
    def get(self):
        return {"message": "Hello, World"}