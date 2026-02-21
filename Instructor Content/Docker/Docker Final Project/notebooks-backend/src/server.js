const express = require("express");

const PORT = process.env.PORT;
const app = express();

const mongoose = require("mongoose");

app.get("/", (req, res) => {
  res.json({
    message: "hello from notebooks",
  });
});

const port = process.env.PORT;

mongoose
  .connect(process.env.DB_URL)
  .then(() => {
    console.log("Connected MongoDB, starting server");
    app.listen(port, () => {
      console.log(`notebooks server listening on port ${port}`);
    });
  })
  .catch((err) => {
    console.error("Something went wrong", err);
  });
