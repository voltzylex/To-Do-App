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
const mongoDbPath = "mongodb+srv://sushilKumar:volt123@cluster0.am2rpuf.mongodb.net/?retryWrites=true&w=majority";
mongoose.connect(mongoDbPath).then(function () {
    app.get("/", function (req, res) {
        const response = {statuscode:res.statusCode, message:"Api works"}
        res.json(response);
    });
    const noteRouter = require("./routes/Note");
    app.use("/notes",noteRouter);
});
const PORT = process.env.PORT || 5000;
app.listen(PORT, function () {
    console.log("Server has been started "+PORT);
});