#!/usr/bin/env python3

import re
import requests
from bs4 import BeautifulSoup

# Script which scrapes player data for all gold players from futhead.com 

# Specify file name to write data to
DATA_FILE = 'data.txt'

print('Scraping FIFA22 gold players...')
players = []
attributes = []
FutHead = requests.get('https://www.futhead.com/22/players/?level=gold&bin_platform=ps')
bs = BeautifulSoup(FutHead.text, 'html.parser')
TotalPages = int(re.sub('\s +', '', str(bs.find('span', {'class': 'font-12 font-bold margin-l-r-10'}).get_text())).split(' ')[1])
print('Number of pages to be parsed = ', TotalPages)

# Loop through all pages
for page in range(1, TotalPages + 1):
  FutHead = requests.get('http://www.futhead.com/22/players/?page=' + str(page) + '&level=gold&bin_platform=ps')
  bs = BeautifulSoup(FutHead.text, 'html.parser')
  Stats = bs.findAll('span', {'class': 'player-stat stream-col-60 hidden-md hidden-sm'})
  Names = bs.findAll('span', {'class': 'player-name'})
  Information = bs.findAll('span', {'class': 'player-club-league-name'})
  Ratings = bs.findAll('span', {'class': re.compile('revision-gradient shadowed font-12')})
  num = len(bs.findAll('li', {'class': 'list-group-item list-group-table-row player-group-item dark-hover'}))

  # Parsing all players information
  for i in range(num):
    p = []
    p.append(Names[i].get_text())
    strong = Information[i].strong.extract()
    try:
      p.append(re.sub('\s +', '', str(Information[i].get_text())).split('| ')[1])
    except IndexError:
      p.append('')
    try:
      p.append(re.sub('\s +', '', str(Information[i].get_text())).split('| ')[2])
    except IndexError:
      p.append('')
    p.append(strong.get_text())
    p.append(Ratings[i].get_text())
    players.append(p)

  # Parsing players stats
  temp = []
  for stat in Stats:
    if Stats.index(stat) % 6 == 0:
      if len(temp) > 0:
        attributes.append(temp)
      temp = []
    if stat.find('span', {'class': 'value'}) is None:
      pass
    else:
      temp.append(stat.find('span', {'class': 'value'}).get_text())
  print('Page ' + str(page) + ' is done!')
  # break

data = list(zip(players, attributes))

with open(DATA_FILE, 'w') as f:
  print(r'PLAYER NAME|CLUB|LEAGUE|POS|OVR|PAC|SHO|PAS|DRI|DEF|PHY', file=f)
  for player in data:
    print(f'{player[0][0]}|{player[0][1]}|{player[0][2]}|{player[0][3]}|{player[0][4]}|{player[1][0]}|{player[1][1]}|{player[1][2]}|{player[1][3]}|{player[1][4]}|{player[1][5]}', file=f)

print(f'Data written to {DATA_FILE}!')