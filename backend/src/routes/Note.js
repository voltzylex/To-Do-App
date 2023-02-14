const express =  require("express");
const router = express.Router();
const Note = require("../models/Note");
router.get("/list/:userID", async function (req, res) {
    var notes = await Note.find({ userid: req.params.userID });
    res.json(notes);
    // res.send("This is the notes page ");
});
router.get("/list", async function (req, res) {
    var notes = await Note.find();
    res.json(notes);
    // res.send("This is the notes page ");
});
router.post("/add", async function (req, res) {
    // res.json(req.body);
    await Note.deleteOne({id: req.body.id});
    /* Note.deleteOne will atomatically delete the previous id response and update the value */
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
router.post("/delete",async function(req,res){
    await Note.deleteOne({id: req.body.id});
    const response = {message:"Note has been Deleted!"+`id: ${req.body.id}`};
    res.json(response);
});
module.exports = router;