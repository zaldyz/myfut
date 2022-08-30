import express, { json } from 'express';
import { processFilter } from './myfut.js'
import cors from 'cors';
import morgan from 'morgan';
import pkg from 'pg';
const { Pool } = pkg;

const pool = new Pool({database: 'myfut'});

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
  WHERE lower(unaccent(fullname)) ~* $1`, [req.query.name.toLowerCase()], (err, result) => {
    if (err) {
      return next(err);
    }
    res.json(
      {
        players: result.rows,
      }
    );
  });
});

app.get('/players/all', (req, res, next) => {
  pool.query(
    `SELECT fullname, overall, position, club, league, pace, shooting, passing, dribbling, defence, physical 
    FROM cards`, (err, result) => {
      if (err) {
        return next(err);
      }
      res.json(
        {
          players: result.rows,
        }
      );
  });
});

app.get('/players/search/id', (req, res, next) => {
  pool.query(
    `SELECT id, fullname, overall, position
    FROM cards
    WHERE lower(unaccent(fullname)) ~* $1`, [req.query.name.toLowerCase()], (err, result) => {
      if (err) {
        return next(err);
      }
      res.json(
        {
          players: result.rows,
        }
      );
  });
});

app.get('/players/filter', (req, res, next) => {
  try {
    const filter = processFilter(req.query.club, req.query.league, req.query.overall, 
      req.query.pace, req.query.shooting, req.query.passsing, req.query.dribbling, 
      req.query.defence, req.query.physical);
    pool.query(
      filter.queryStr, filter.values, (err, result) => {
        if (err) {
          return next(err);
        }
        res.json(
          {
            players: result.rows,
          }
        );
      });
  } catch {
    res.json({
      error: 'Invalid Filters!'
    })
  }
});

app.post('/players/add', (req, res, next) => {
  res.json({
    error: 'Route not implemented yet!'
  })
});

app.delete('/players/remove', (req, res, next) => {
  res.json({
    error: 'Route not implemented yet!'
  })
});

/**
 * Start server
 */
const server = app.listen(PORT, () => {
  console.log(`⚡️ Server listening on port ${PORT} at ${HOST}`);
});

