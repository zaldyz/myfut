// Function implementations for myfut expresss server
// import pg from 'pg';

/**
 * Return a list of all players in the DB
 * @returns {players: [player]}
 */
function playersListAll() {
  return {players: []};
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


export {playersListAll, playersSearch, playersFilter, playersAdd};