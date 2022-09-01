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
  const idStr = req.query.id ? 'id, ' : ''; 
  pool.query(
  `SELECT ${idStr}fullname, overall, position, club, league, pace, shooting, passing, dribbling, defence, physical 
  FROM cards 
  WHERE lower(unaccent(fullname)) ~* $1
  ORDER BY overall DESC, fullname`, [req.query.name.toLowerCase()], (err, result) => {
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
    FROM cards
    ORDER BY overall DESC, fullname`, (err, result) => {
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
  const { 
    fullname, position, club, league, overall,
    pace, shooting, passing, dribbling, defence, physical
  } = req.body;

  pool.query(
    `INSERT INTO cards 
    (fullname, overall, position, club, league, pace, shooting, passing, dribbling, defence, physical)
    VALUES
    ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)`, 
    [fullname, parseInt(overall), position, club, league, parseInt(pace), parseInt(shooting), parseInt(passing), parseInt(dribbling), parseInt(defence), parseInt(physical)],
     (err, result) => {
      if (err) {
        res.json(
          {
            error: 'Player could not be added'
          }
        );
      } else {
        res.json(
          {
            message: `Player ${fullname} added!`
          }
          );
      }
  });
  
});

app.delete('/players/remove', (req, res, next) => {
  pool.query(
    `DELETE FROM cards
    WHERE 
    id = $1`, 
    [parseInt(req.query.playerId)],
     (err, result) => {
      if (err) {
        res.json(
          {
            error: 'Player could not be removed'
          }
        );
      } else {
        res.json(
          {
            message: `Player succesfully removed!`
          }
        );
      }
  });
});

/**
 * Start server
 */
const server = app.listen(PORT, () => {
  console.log(`⚡️ Server listening on port ${PORT} at ${HOST}`);
});

