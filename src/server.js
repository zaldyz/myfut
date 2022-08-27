import express, { json } from 'express';
import cors from 'cors';
import morgan from 'morgan';

const port = 3257;

const app = express();
app.use(cors());
app.use(json());
app.use(morgan('dev'));

const PORT = parseInt(process.env.PORT || port);
const HOST = process.env.IP || 'localhost';

// Root URL
app.get('/', (req, res) => {
  res.json(
    {
      message: "Welcome to the myFut web server!",
    }
  );
});

/**
 * Start server
 */
const server = app.listen(PORT, () => {
  console.log(`⚡️ Server listening on port ${PORT} at ${HOST}`);
});

