const express = require('express');
const app = express();
const mongoose = require('mongoose');
const Note = require("./models/Note");
const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
// extended = true -> Nested objects (Correct)
// extended = false -> Nested objects (nOT Correct)
app.use(bodyParser.json());
mongoose.set('strictQuery', true);
mongoose.connect("mongodb+srv://sushilKumar:volt123@cluster0.am2rpuf.mongodb.net/?retryWrites=true&w=majority").then(function () {
    app.get("/", function (req, res) {
        res.send("This is the home page 1");
    });
    app.get("/notes/list/:userID", async function (req, res) {
        var notes = await Note.find({ userid: req.params.userID });
        res.json(notes);
        // res.send("This is the notes page ");
    });
    app.get("/notes/list", async function (req, res) {
        var notes = await Note.find();
        res.json(notes);
        // res.send("This is the notes page ");
    });
    app.post("/notes/add", async function (req, res) {
        // res.json(req.body);
        await Note.deleteOne({id: req.body.id});
        const newNote = await new Note(
           { id:req.body.id,
            userid:req.body.userid,
            title: req.body.title,
            content:req.body.content,
           }
        );
           await newNote.save();
           const response = {message:"New Note Created!"+`id: ${req.body.id}`};
        res.json(response);
        res.send("This is the notes page ");
    });
});

app.listen(5000, function () {
    console.log("Server has been started");
});