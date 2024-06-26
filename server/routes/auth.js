const express = require("express");
const User = require("../models/user"); // User model
const  bcrypt = require('bcryptjs');
const jwt=require('jsonwebtoken');




const authRouter = express.Router();


// SIGN UP
authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    // Check if the user already exists
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: "User with this email already exists!" });
    }
//


    const hashpass = bcrypt.hashSync('password', 8);

    // Create a new user and save to the database
    let user = new User({
     name,
     email,
     password:hashpass
      });
    user = await user.save();

    console.log("User saved successfully");
    res.json(user);

  } catch (e) {
    console.error("Error during signup:", e);
    res.status(500).json({ error: e.message });
  }
});

// SIGN IN
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    // Check if the user exists
    const user = await User.findOne({ email });
    if (!user) {
      return res
            .status(400)
            .json({ msg: "User with this email does not exist!" });
    }

    // Check if the password matches
    const ismatch=bcrypt.compare(password,user.password);

    if(!ismatch){
    return res
           .status(400)
           .json({msg:"Incorrect Password"});
    }

    const token=jwt.sign({id:user._id},"passwordKey");

    res.json({token,...user._doc});

  } catch (e) {
    console.error("Error during signin:", e);
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);

    const user = await User.findById(verified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
//
//// get user data
//authRouter.get("/", auth, async (req, res) => {
//  const user = await User.findById(req.user);
//  res.json({ ...user._doc, token: req.token });
//});

module.exports = authRouter;