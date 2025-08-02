# pageobject/variables.py

# MongoDB Configuration
MONGODB_URI = "mongodb+srv://faoid:passer@cluster0.iktmvbm.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
DB_NAME = "fakestoredb"

# Collections
PRODUCTS_COLLECTION = "products"
USERS_COLLECTION = "users"
CARTS_COLLECTION = "carts"
CATEGORIES_COLLECTION = "categories"

# --- Test Data ---

# PRODUCT
PRODUCT_TEST = {
    "title": "Fjallraven - Foldsack No. 1 Backpack",
    "price": 109.95,
    "description": "Your perfect pack...",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/image.jpg",
    "rating": {"rate": 3.9, "count": 120}
}

UPDATE_PRODUCT = {
    "price": 99.95,
    "rating.rate": 4.2
}

# CATEGORY
CATEGORY_TEST = {
    "name": "men's clothing",
    "description": "Articles destinés aux hommes",
    "image": "https://example.com/mens_clothing.jpg"
}

UPDATE_CATEGORY = {
    "description": "Vêtements et accessoires pour hommes"
}

# CART
CART_TEST = {
    "userId": "5f8d0f3d6a8d4e3b4c7e2f1a",
    "date": "2020-03-02T00:00:00.000Z",
    "products": [
        {"productId": "5f8d0f3d6a8d4e3b4c7e2f1b", "quantity": 4},
        {"productId": "5f8d0f3d6a8d4e3b4c7e2f1c", "quantity": 1}
    ]
}

UPDATE_CART = {
    "products.0.quantity": 5,
    "date": "2020-03-03T00:00:00.000Z"
}

# USER
USER_TEST = {
    "email": "john@gmail.com",
    "username": "johnd",
    "password": "hashedpassword",
    "name": {
        "firstname": "John",
        "lastname": "Doe"
    },
    "address": {
        "city": "kilcoole",
        "street": "7835 new road",
        "zipcode": "12926-3874",
        "geolocation": {
            "lat": "-37.3159",
            "long": "81.1496"
        }
    },
    "phone": "1-570-236-7033"
}

UPDATE_USER = {
    "email": "john.doe@gmail.com",
    "address.city": "Dublin"
}
# --- Invalid Test Data ---

PRODUCT_SANS_DESCRIPTION = {
    "title": "Produit Sans Description",
    "price": 29.99,
    "category": "electronics",
    "image": "https://example.com/image.jpg",
    "rating": {
        "rate": 4.5,
        "count": 12
    }
}
PRODUCT_PRIX_NEGATIF = {
    "title": "Produit Prix Négatif",
    "price": -15.0,
    "description": "Produit avec un prix invalide",
    "category": "electronics",
    "image": "https://example.com/image.jpg",
    "rating": {
        "rate": 4.0,
        "count": 8
    }
}
# --- Invalid User Test Data ---

USER_SANS_ZIPCODE = {
    "email": "test1@example.com",
    "username": "user1",
    "password": "pass123",
    "phone": "771234567",
    "name": {
        "firstname": "Ali",
        "lastname": "Sow"
    },
    "address": {
        "city": "Dakar",
        "street": "Rue 1",
        "geolocation": {
            "lat": "14.7",
            "long": "-17.4"
        }
        # zipcode manquant
    }
}

USER_SANS_FIRSTNAME = {
    "email": "test2@example.com",
    "username": "user2",
    "password": "pass456",
    "phone": "770987654",
    "name": {
        "lastname": "Diop"
        # firstname manquant
    },
    "address": {
        "city": "Thies",
        "street": "Rue 2",
        "zipcode": "21000",
        "geolocation": {
            "lat": "15.3",
            "long": "-16.9"
        }
    }
}
CART_SANS_USERID = {
    "date": "2020-03-02T00:00:00.000Z",
    "products": [
        {"productId": "5f8d0f3d6a8d4e3b4c7e2f1b", "quantity": 4},
        {"productId": "5f8d0f3d6a8d4e3b4c7e2f1c", "quantity": 1}
    ]
}