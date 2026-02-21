const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.json({
    message: "hello from notes",
  });
});

app.listen(3001, () => {
  console.log("notes server listening on port 3001");
});