const mongoose = require("mongoose");

// User Schema definition
const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true, // Ensures the name is provided
    trim: true, // Trims leading and trailing white spaces
  },
  email: {
    type: String,
    required: true, // Email is required
    unique: true, // Ensure email is unique across users
    trim: true, // Trims leading and trailing white spaces
    lowercase: true, // Ensures email is stored in lowercase
    validate: {
      validator: (value) => {
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Common email regex pattern
        return emailPattern.test(value); // Check if email matches the pattern
      },
      message: "This Email is not valid",
    },
  },
  password: {
    type: String,
    required: true, // Password is required
    validate: {
      validator: (value) => {
        return value.length > 6; // Ensure password is at least 7 characters
      },
      message: "Password must be at least 7 characters long", // Improved message
    },
  },
  address: {
    type: String,
    default: "", // Default address to empty string
  },
  type: {
    type: String,
    default: "user", // Default user type to 'user'
  },
  createdAt: {
    type: Date,
    default: Date.now, // Automatically set creation date
  },
});

// Create and export the User model
const User = mongoose.model("User", userSchema);
module.exports = User;
