import express, { json } from 'express';
import cors from 'cors';
import morgan from 'morgan';
import pkg from 'pg';
const { Pool } = pkg;

const pool = new Pool({database: 'myfut'});

/*
pool.query('SELECT * FROM users WHERE id = $1', [1], (err, res) => {
  if (err) {
    throw err
  }
  console.log('user:', res.rows[0])
})
*/

const port = 3257;

const app = express();
app.use(cors());
app.use(json());
app.use(morgan('dev'));

const PORT = parseInt(process.env.PORT || port);
const HOST = process.env.IP || 'localhost';

// Root URL
app.get('/', (req, res) => {
  res.json({
    message: "Welcome to the myFut web server!"
  });
});


app.get('/players/search', (req, res, next) => {
  pool.query(
  `SELECT fullname, overall, position, club, league, pace, shooting, passing, dribbling, defence, physical 
  FROM cards 
  WHERE fullname ~* $1`, [req.query.name], (err, result) => {
    if (err) {
      return next(err);
    }
    res.json(
      {
        players: result.rows,
      }
    );
  })
});

/**
 * Start server
 */
const server = app.listen(PORT, () => {
  console.log(`⚡️ Server listening on port ${PORT} at ${HOST}`);
});

