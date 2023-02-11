const express = require('express');
const app = express();
app.get("/",function(req,res){
    res.send("This is the home page ");
});
app.get("/notes",function(req,res){
    res.send("This is the notes page ");
});
app.listen(5000,function(){
    console.log("Server has been started");
});