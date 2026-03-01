const express = require('express');

const port = 80;
const app = express();

app.use(bodyParser.json());

app.use('/', rootRouter);

app.listen(port, () => {
  console.log(`Color API listening on port: ${port}`);
});