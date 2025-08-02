from pymongo import MongoClient
from bson.objectid import ObjectId
from robot.api.deco import keyword
import json
from collections.abc import MutableMapping

class MongoDBLibrary:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    
    def __init__(self):
        self.client = None
        self.db = None

    @keyword('Connect To MongoDB')
    def connect(self, uri, db_name):
        self.client = MongoClient(uri)
        self.db = self.client[db_name]
        return True

    @keyword('Disconnect From MongoDB')
    def disconnect(self):
        if self.client:
            self.client.close()
        return True

    # Products
    @keyword('Create Product')
    def create_product(self, product_data):
        if not isinstance(product_data, MutableMapping):
            raise ValueError("Product data must be a dictionary")
        return str(self.db.products.insert_one(product_data).inserted_id)

    @keyword('Get Product')
    def get_product(self, product_id):
        product = self.db.products.find_one({"_id": ObjectId(product_id)})
        return json.loads(json.dumps(product, default=str)) if product else None

    @keyword('Update Product')
    def update_product(self, product_id, update_data):
        return self.db.products.update_one(
            {"_id": ObjectId(product_id)},
            {"$set": update_data}
        ).modified_count

    @keyword('Delete Product')
    def delete_product(self, product_id):
        return self.db.products.delete_one(
            {"_id": ObjectId(product_id)}
        ).deleted_count

    # Users
    @keyword('Create User')
    def create_user(self, user_data):
        if not isinstance(user_data, MutableMapping):
            raise ValueError("User data must be a dictionary")
        return str(self.db.users.insert_one(user_data).inserted_id)

    @keyword('Get User')
    def get_user(self, user_id):
        user = self.db.users.find_one({"_id": ObjectId(user_id)})
        return json.loads(json.dumps(user, default=str)) if user else None

    @keyword('Update User')
    def update_user(self, user_id, update_data):
        return self.db.users.update_one(
            {"_id": ObjectId(user_id)},
            {"$set": update_data}
        ).modified_count

    @keyword('Delete User')
    def delete_user(self, user_id):
        return self.db.users.delete_one(
            {"_id": ObjectId(user_id)}
        ).deleted_count

    # Carts
    @keyword('Create Cart')
    def create_cart(self, cart_data):
        if not isinstance(cart_data, MutableMapping):
            raise ValueError("Cart data must be a dictionary")
        return str(self.db.carts.insert_one(cart_data).inserted_id)

    @keyword('Get Cart')
    def get_cart(self, cart_id):
        cart = self.db.carts.find_one({"_id": ObjectId(cart_id)})
        return json.loads(json.dumps(cart, default=str)) if cart else None

    @keyword('Update Cart')
    def update_cart(self, cart_id, update_data):
        return self.db.carts.update_one(
            {"_id": ObjectId(cart_id)},
            {"$set": update_data}
        ).modified_count

    @keyword('Delete Cart')
    def delete_cart(self, cart_id):
        return self.db.carts.delete_one(
            {"_id": ObjectId(cart_id)}
        ).deleted_count

    # Categories
    @keyword('Create Category')
    def create_category(self, category_data):
        if not isinstance(category_data, MutableMapping):
            raise ValueError("Category data must be a dictionary")
        return str(self.db.categories.insert_one(category_data).inserted_id)

    @keyword('Get Category')
    def get_category(self, category_id):
        category = self.db.categories.find_one({"_id": ObjectId(category_id)})
        return json.loads(json.dumps(category, default=str)) if category else None

    @keyword('Update Category')
    def update_category(self, category_id, update_data):
        return self.db.categories.update_one(
            {"_id": ObjectId(category_id)},
            {"$set": update_data}
        ).modified_count

    @keyword('Delete Category')
    def delete_category(self, category_id):
        return self.db.categories.delete_one(
            {"_id": ObjectId(category_id)}
        ).deleted_count
