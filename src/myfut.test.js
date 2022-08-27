// Tests for function implementation behaviour

import { playersListAll, playersSearch, playersFilter, playersAdd, resetDB } from 'src/myfut';

describe('Testing playersList, playersAdd and resetDB', () => {
  test('playersListAll: Empty database', () => {
    resetDB();
    expect(playersListAll()).toMatchObject({players: []});
  });

  test('playersListAll: Three players', () => {
    resetDB();
    expect(playersAdd('Robert Lewandowski', 99, 'PL', 'ST', 'FC Barcelona', 'LaLiga Santander', 97, 99, 90, 98, 52, 98)).toMatchObject({});
    expect(playersAdd('Robert Longhead', 95, 'PL', 'ST', 'FC Passehlona', 'LaLiga Santander', 97, 99, 90, 98, 52, 98)).toMatchObject({});
    expect(playersAdd('Timo Trashdog', 30, 'PL', 'ST', 'SentBackcuzGARB FC', 'Not good enough for premier league', 97, 20, 78, 98, 52, 98)).toMatchObject({});
    expect(playersListAll()).toMatchObject({players: [
      {fullname: 'Robert Lewandowski', ovr: 99, ptype: 'PL', pos: 'ST', club: 'FC Barcelona', league: 'LaLiga Santander', pac: 97, sho: 99, pas: 90, dri: 98, def: 52, phy: 98},
      {fullname: 'Robert Longhead', ovr: 95, ptype: 'PL', pos: 'ST', club: 'FC Passehlona', league: 'LaLiga Santander', pac: 97, sho: 99, pas: 90, dri: 98, def: 52, phy: 98},
      {fullname: 'Timo Trashdog', ovr: 30, ptype: 'PL', pos: 'ST', club: 'SentBackcuzGARB FC', league: 'Not good enough for premier league', pac: 97, sho: 20, pas: 78, dri: 98, def: 52, phy: 98}
    ]});
  });
});

describe('Testing playersSearch', () => {
  test('playersSearch: Empty database', () => {
    resetDB();
    expect(playersSearch('Robert')).toMatchObject({players: []});
  });

  test('playersSearch: Three players', () => {
    resetDB();
    expect(playersAdd('Robert Lewandowski', 99, 'PL', 'ST', 'FC Barcelona', 'LaLiga Santander', 97, 99, 90, 98, 52, 98)).toMatchObject({});
    expect(playersAdd('Robert Longhead', 95, 'PL', 'ST', 'FC Passehlona', 'LaLiga Santander', 97, 99, 90, 98, 52, 98)).toMatchObject({});
    expect(playersAdd('Timo Trashdog', 30, 'PL', 'ST', 'SentBackcuzGARB FC', 'Not good enough for premier league', 97, 20, 78, 98, 52, 98)).toMatchObject({});
    expect(playersSearch('Robert')).toMatchObject({players: [
      {fullname: 'Robert Lewandowski', ovr: 99, ptype: 'PL', pos: 'ST', club: 'FC Barcelona', league: 'LaLiga Santander', pac: 97, sho: 99, pas: 90, dri: 98, def: 52, phy: 98},
      {fullname: 'Robert Longhead', ovr: 95, ptype: 'PL', pos: 'ST', club: 'FC Passehlona', league: 'LaLiga Santander', pac: 97, sho: 99, pas: 90, dri: 98, def: 52, phy: 98},
    ]});
  });
});

describe('Testing playersFilter', () => {
  test('playersFilter: Empty database', () => {
    resetDB();
    const filters = {
      club: undefined,
      league: 'LaLiga Santander',
      minOverall: 96,
      maxOverall: undefined, 
      minPace: undefined, 
      maxPace: undefined,
      minSho: undefined, 
      maxSho: undefined,
      minPas: undefined, 
      maxPas: undefined,
      minDri: undefined, 
      maxDri: undefined,
      minDef: undefined, 
      maxDef: undefined,
      minPhy: undefined, 
      maxPhy: undefined,
    };
    expect(playersFilter(filters)).toMatchObject({players: []});
  });

  test('playersFilter: Three players', () => {
    resetDB();
    expect(playersAdd('Robert Lewandowski', 99, 'PL', 'ST', 'FC Barcelona', 'LaLiga Santander', 97, 99, 90, 98, 52, 98)).toMatchObject({});
    expect(playersAdd('Robert Longhead', 95, 'PL', 'ST', 'FC Passehlona', 'LaLiga Santander', 97, 99, 90, 98, 52, 98)).toMatchObject({});
    expect(playersAdd('Timo Trashdog', 30, 'PL', 'ST', 'SentBackcuzGARB FC', 'Not good enough for premier league', 97, 20, 78, 98, 52, 98)).toMatchObject({});
    const filters = {
      club: undefined,
      league: 'LaLiga Santander',
      minOverall: 96,
      maxOverall: undefined, 
      minPace: undefined, 
      maxPace: undefined,
      minSho: undefined, 
      maxSho: undefined,
      minPas: undefined, 
      maxPas: undefined,
      minDri: undefined, 
      maxDri: undefined,
      minDef: undefined, 
      maxDef: undefined,
      minPhy: undefined, 
      maxPhy: undefined,
    };
    expect(playersFilter(filter)).toMatchObject({players: [
      {fullname: 'Robert Lewandowski', ovr: 99, ptype: 'PL', pos: 'ST', club: 'FC Barcelona', league: 'LaLiga Santander', pac: 97, sho: 99, pas: 90, dri: 98, def: 52, phy: 98},
    ]});
  });
});



