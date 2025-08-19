
# ApnaBazar - A Full-Stack E-Commerce Platform 🛍️

ApnaBazar is a feature-rich, full-stack e-commerce application inspired by Amazon. It includes a mobile application for customers built with **Flutter** and a powerful backend with a dedicated admin panel built with **Node.js**, **Express**, and **MongoDB**.



## ✨ Features

The platform is split into two main parts: the user-facing mobile app and the admin management panel.

### User Mobile App (Flutter)
* **Secure Authentication**: User registration and login using email/password with JWT for session management.
* **Dynamic Home Page**: Displays a "Deal of the Day" and categorized product listings.
* **Product Search**: Users can search for any product available in the store.
* **Product Details**: View detailed product descriptions, images, and user ratings.
* **Product Ratings**: Users can rate products they have purchased.
* **Shopping Cart**: A fully functional cart to add, remove, and manage products.
* **Seamless Checkout**: Integrated with **Google Pay** and **Apple Pay** for a smooth payment process.
* **Order History**: Users can view their past orders and track their current status.

### Admin Panel (Node.js + Flutter)
* **Sales Dashboard**: An analytics dashboard displaying total sales and category-wise earnings with graphical charts.
* **Product Management**: Admins can easily add new products with images, details, and pricing. Existing products can also be viewed and deleted.
* **Order Management**: View all customer orders, and update their status (e.g., Packed, Shipped, Delivered).
* **Centralized Control**: A single place to manage the entire e-commerce operation.

---

## 🛠️ Tech Stack

### Frontend (Mobile App)
* **Framework**: [Flutter](https://flutter.dev/)
* **Language**: [Dart](https://dart.dev/)
* **State Management**: [Provider](https://pub.dev/packages/provider)
* **HTTP Client**: [http](https://pub.dev/packages/http)
* **Payment**: [pay](https://pub.dev/packages/pay)

### Backend
* **Runtime Environment**: [Node.js](https://nodejs.org/)
* **Framework**: [Express.js](https://expressjs.com/)
* **Database**: [MongoDB](https://www.mongodb.com/) with [Mongoose](https://mongoosejs.com/)
* **Authentication**: [JSON Web Tokens (JWT)](https://jwt.io/)
* **Password Hashing**: [bcrypt.js](https://www.npmjs.com/package/bcryptjs)
* **Cloud Storage**: [Cloudinary](https://cloudinary.com/) for image uploads.

---

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites
Make sure you have the following installed on your machine:
* [Node.js](https://nodejs.org/en/download/) (v14 or higher)
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.0 or higher)
* [MongoDB](https://www.mongodb.com/try/download/community)

### 1. Backend Setup

```bash
# 1. Clone the repository
git clone [https://github.com/your-username/apna-bazar.git](https://github.com/your-username/apna-bazar.git)

# 2. Navigate to the server directory
cd apna-bazar/server

# 3. Install NPM packages
npm install

# 4. Create a .env file in the /server directory and add the following variables
# You will need to create a MongoDB database and a Cloudinary account.
````

**`server/.env` file:**

```
PORT=3000
DB_URI=your_mongodb_uri
PASSWORD_KEY=your_bcrypt_secret_key
JWT_SECRET=your_jwt_secret_key
CLOUDINARY_CLOUD_NAME=your_cloudinary_cloud_name
CLOUDINARY_API_KEY=your_cloudinary_api_key
CLOUDINARY_API_SECRET=your_cloudinary_api_secret
```

```bash
# 5. Start the server
npm run dev
```

The server will start on `http://localhost:3000`.

### 2\. Frontend (Flutter App) Setup

```bash
# 1. Navigate to the client directory from the root folder
cd ../client

# 2. Get all the dependencies
flutter pub get

# 3. IMPORTANT: Update the API endpoint
# In `lib/constants/global_variables.dart`, change the `uri` to your local IP address or localhost.
# Example: String uri = 'http://<YOUR_LOCAL_IP_ADDRESS>:3000';

# 4. Run the app on your emulator or physical device
flutter run
```

-----

## 📁 Project Structure

```
apna-bazar/
├── server/                 # Node.js Backend
│   ├── index.js            # Main server file
│   ├── routes/             # API routes
│   ├── models/             # Mongoose data models
│   └── middlewares/        # Custom middlewares (e.g., auth)
│
└── client/                 # Flutter Application
    ├── lib/
    │   ├── main.dart       # App entry point
    │   ├── features/       # Screens and features organized by domain
    │   ├── providers/      # State management providers
    │   ├── models/         # Client-side data models
    │   ├── constants/      # Global constants and variables
    │   └── router.dart     # App navigation routes
    └── pubspec.yaml
```

-----



<!-- end list -->

```
```
