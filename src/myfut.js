// Function implementations for myfut expresss server

/**
 * Returns the query string and values for the given set of filters
 */
function processFilter(club, league, ovr, pac, sho, pas, dri, def, phy) {
  if (!checkValues(club, league, ovr, pac, sho, pas, dri, def, phy)) {
    throw new Error('Invalid Filters!');
  }
  let queryStr = `SELECT fullname, overall, position, club, league, pace, shooting, passing, dribbling, defence, physical 
  FROM cards`;

  let conditions = [];
  
  let argCount = 1;
  let args = [];

  // Check club and league filters
  if (!(club == undefined)) {
    conditions.push(`lower(unaccent(club)) = $${argCount}`);
    args.push(club.toLowerCase());
    argCount++;
  }

  // Check league filters
  if (!(league == undefined)) {
    conditions.push(`lower(unaccent(league)) = $${argCount}`);
    args.push(league.toLowerCase());
    argCount++;
  }

  // Check range filters
  const ranges = [ovr, pac, sho, pas, dri, def, phy];
  const rangeNames = ['overall', 'pace', 'shoooting', 'passing', 'dribbling', 'defence', 'physical'];
  for (let i = 0; i < 7; i++) {
    if (!(ranges[i] == undefined)) {
      const m = ranges[i].match(/^(\d+),(\d+)$/);
      conditions.push(`${rangeNames[i]} BETWEEN $${argCount} AND $${argCount + 1}`);
      args.push(parseInt(m[1]));
      args.push(parseInt(m[2]));
      argCount += 2;
    }
  }
  if (conditions) {
    queryStr = queryStr + ` WHERE
     `;
  }

  return {
    queryStr: queryStr + conditions.join(' AND ') + ' ORDER BY overall DESC, fullname',
    values: args
  };
}

/**
 * Checks the filter parameters for empty strings or illegal ranges
 */
function checkValues(club, league, ovr, pac, sho, pas, dri, def, phy) {
  if (club == '') {
    return false;
  } else if (league == '') {
    return false;
  } 

  // Check ranges
  return checkRange(ovr) && checkRange(pac) && checkRange(sho) && checkRange(pas)
     && checkRange(dri) && checkRange(def) && checkRange(phy);
}

/**
 * Checks whether a range parameter is valid
 */
function checkRange(range) {
  if (!(range == undefined)) {
    const m = range.match(/^(\d+),(\d+)$/);
    if (m) {
      if (!isNaN(m[1]) && !isNaN(m[2])) {
        return parseInt(m[1]) >= 1 && parseInt(m[1]) <= 99 && parseInt(m[2]) >= 1 && parseInt(m[2]) <= 99;
      };
    }
    return false;
  }
  return true;
}

export { processFilter };