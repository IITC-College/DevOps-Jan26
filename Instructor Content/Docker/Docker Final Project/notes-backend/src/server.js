const express = require("express");
const app = express();
const port = process.env.PORT;
const bodyParser = require("body-parser");
const noteRouter = require("./routes");
const mongoose = require("mongoose");

app.use(bodyParser.json());
app.use("/api/notes", noteRouter);
app.get("/api/notes/health", (req, res) => {
  res.json({
    message: "hello from notes",
  });
});

mongoose
  .connect(process.env.DB_URL)
  .then(() => {
    console.log("Connected MongoDB, starting server");
    app.listen(port, () => {
      console.log(`notes server listening on port ${port}`);
    });
  })
  .catch((err) => {
    console.error("Something went wrong", err);
  });
