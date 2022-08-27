// Function implementations for myfut expresss server

import pkg from 'pg';
const { Client } = pkg;

/*
const client = new Client({
  database: 'myfut'
})
client.connect()
client.query('SELECT fullname, club from cards limit $1::int', [1], (err, res) => {
  console.log(res.rows)
  console.log(err ? err.stack : res.rows[0].message) // Hello World!
  client.end()
})
*/
console.log(playersListAll());

/**
 * Return a list of all players in the DB
 * @returns {players: [player]}
 */
function playersListAll() {
  let result = [];
  const client = new Client({
    database: 'myfut'
  });
  client.connect();
  client.query('SELECT * from cards', (err, res) => {
    if (err) {
      client.end();
      return {error: `DB Query error: ${err.stack}`};
    }
    // console.log(res.rows);
    result = [...res.rows];
    return result;
    client.end();
    //return {players: result};
  });
  return result;
}

/**
 * Returns a list of all players whose name matches with search
 * @returns {players: [player]}
 */
function playersSearch(search) {
  return {players: []};
}

/**
 * Returns a list of all players who match the filters provided
 * filters = {club, league, minOvr, maxOvr, minPac, maxPac...}
 * @returns {players: [player]}
 */
function playersFilter(filters) {
  return {players: []};
}

/**
 * Adds a player to the myfut database
 * @returns {} on success
 * @returns {error: 'error'} on error
 */
function playersAdd(fullname, overall, playertype, position, club, 
  league, pace, shooting, passing, dribbling, defence, physical) 
{
  return {};
}

/**
 * Clears all entries in the myfut db
 * @returns {}
 */
function resetDB() {
  return {};
}


export { playersListAll, playersSearch, playersFilter, playersAdd, resetDB };