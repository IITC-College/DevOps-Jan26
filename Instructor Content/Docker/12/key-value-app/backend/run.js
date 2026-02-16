'use strict';
const path = require('path');
// Run server by absolute path so it works even when cwd is wrong (e.g. WSL UNC path → C:\Windows)
require(path.join(__dirname, 'src', 'server.js'));
