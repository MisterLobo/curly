/**
 * This is not a production server yet!
 * This is only a minimal backend to get started.
 */

import express from 'express'
import * as path from 'path'
import app from './utils/app'
import authRoutes from './routes/auth'
import urlRoutes from './routes/urls'

app.use('/auth', authRoutes)
app.use('/urls', urlRoutes)

app.use('/assets', express.static(path.join(__dirname, 'assets')));

app.get('/', (req, res) => {
  res.send({ message: 'Hello World!' });
});

app.get('/api', (req, res) => {
  res.send({ message: 'Welcome to api!' });
});

const port = process.env.PORT || 3333;
const server = app.listen(port, () => {
  console.log(`Listening at http://localhost:${port}/api`);
});
server.on('error', console.error);
