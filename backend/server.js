const express = require('express');
const app = express();
const mongoose = require('mongoose');
mongoose.set('strictQuery', true);
mongoose.connect("mongodb+srv://sushilKumar:volt123@cluster0.am2rpuf.mongodb.net/?retryWrites=true&w=majority").then(function(){
    app.get("/",function(req,res){
        res.send("This is the home page ");
    });
    app.get("/notes",function(req,res){
        res.send("This is the notes page ");
    });
});

app.listen(5000,function(){
    console.log("Server has been started");
});