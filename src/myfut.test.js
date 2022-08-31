// Tests for function implementation behaviour
import request from 'sync-request';

const url = 'http://localhost';
const port = 3257;

function playersSearch(name) {
  const res = request(
    'GET',
    `${url}:${port}/players/search`,
    {
      qs: {
        name: name,
      },
    }
  );
  return JSON.parse(res.getBody());
}

function playersSearchId(name) {
  const res = request(
    'GET',
    `${url}:${port}/players/search/id`,
    {
      qs: {
        name: name,
      },
    }
  );
  return JSON.parse(res.getBody());
}

function playersList() {
  const res = request(
    'GET',
    `${url}:${port}/players/all`
  );
  return JSON.parse(res.getBody());
}

function playersFilter(filters) {
  const res = request(
    'GET',
    `${url}:${port}/players/filter`,
    {
      qs: filters
    }
  );
  return JSON.parse(res.getBody());
}

function playersAdd(player) {
  const res = request(
    'POST',
    `${url}:${port}/players/add`,
    {
      json: player
    }
  );
  return JSON.parse(res.getBody());
}

function playersRemove(playerId) {
  const res = request(
    'DELETE',
    `${url}:${port}/players/remove`,
    {
      qs: {
        playerId: playerId
      }
    }
  );
  return JSON.parse(res.getBody());
}

describe('Testing playersList, playersAdd and resetDB', () => {
  test('playersListAll: list all players', () => {
    expect(playersList()).toMatchObject(
      { 
        players: expect.arrayContaining(
          [
            expect.objectContaining({
              fullname: expect.any(String),
              overall: expect.any(Number),
              position: expect.any(String),
              club: expect.any(String),
              league: expect.any(String),
              pace: expect.any(Number),
              shooting: expect.any(Number),
              passing: expect.any(Number),
              dribbling: expect.any(Number),
              defence: expect.any(Number),
              physical: expect.any(Number),
            })
          ]
        )
      }
    );
  });
});

describe('Testing playersSearch', () => {
  test('playersSearch: Valid search', () => {
    expect(playersSearch("Silva")).toMatchObject(
      { 
        players: expect.arrayContaining(
          [
            expect.objectContaining({
              fullname: expect.any(String),
              overall: expect.any(Number),
              position: expect.any(String),
              club: expect.any(String),
              league: expect.any(String),
              pace: expect.any(Number),
              shooting: expect.any(Number),
              passing: expect.any(Number),
              dribbling: expect.any(Number),
              defence: expect.any(Number),
              physical: expect.any(Number),
            })
          ]
        )
      }
    );
  });

  test('playersSearch: No results', () => {
    expect(playersSearch("Hablooblob")).toMatchObject({
      players: []
    });
  });
});

describe('Testing playersFilter', () => {
  test('playersFilter: Valid filter', () => {
    const filters = {
      league: 'LaLiga Santander',
      overall: '1,97', 
    };
    expect(playersFilter(filters)).toMatchObject(
      { 
        players: expect.arrayContaining(
          [
            expect.objectContaining({
              fullname: expect.any(String),
              overall: expect.any(Number),
              position: expect.any(String),
              club: expect.any(String),
              league: expect.any(String),
              pace: expect.any(Number),
              shooting: expect.any(Number),
              passing: expect.any(Number),
              dribbling: expect.any(Number),
              defence: expect.any(Number),
              physical: expect.any(Number),
            })
          ]
        )
      }
    );
  });

  test('playersFilter: Invalid Filter', () => {
    const filters = {
      league: 'LaLiga Santander',
      overall: '0,95', 
      passing: '-3,1',  
    };
    expect(playersFilter(filters)).toMatchObject(
      { 
        error: expect.any(String),
      }
    );
  });
});

describe('Testing playerSearchID, playersAdd and resetDB', () => {
  test('playersSearchId: Valid search', () => {
    expect(playersSearchId("Silva")).toMatchObject(
      { 
        players: expect.arrayContaining(
          [
            expect.objectContaining({
              id: expect.any(Number),
              fullname: expect.any(String),
              overall: expect.any(Number),
              position: expect.any(String),
            })
          ]
        )
      }
    );
  });

  test('playersSearchId: No results', () => {
    expect(playersSearchId("Hablooblob")).toMatchObject({
      players: []
    });
  });
});

// Tests for players/add and players/remove
describe('Testing playersAdd and playersRemove', () => {
  test('playersAdd: Invalid player', () => {
    const newPlayer = {
      fullname: '',
      overall: 92,
      position: "RB",
      club: "Leeds United",
      league: "Premier League",
      pace: 97,
      shooting: 65,
      passing: 100,
      dribbling: 92,
      defence: 88,
      physical: 86
    }
    expect(playersAdd(newPlayer)).toMatchObject(
      { 
        error: expect.any(String)
      }
    );
  });

  test('playersAdd: add valid player then remove', () => {
    const newPlayer = {
      fullname: 'Daniel Hoohaa',
      overall: 92,
      position: "RB",
      club: "Leeds United",
      league: "Premier League",
      pace: 97,
      shooting: 65,
      passing: 94,
      dribbling: 92,
      defence: 88,
      physical: 86
    }
    // Add player
    expect(playersAdd(newPlayer)).toMatchObject({
      message: expect.any(String)
    });

    // Get the player's ID
    const Ids = playersSearchId("Daniel Hoohaa");
    const DanielId = Ids.players[0].id;

    // Remove player
    expect(playersRemove(DanielId)).toMatchObject({
      message: expect.any(String)
    });

    // Check that player has been removed
    expect(playersSearchId("Daniel Hoohaa")).toMatchObject({
      players: []
    })
  });
});
