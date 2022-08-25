#!/usr/bin/env python3

# Script which inserts the data in DATA_FILE into the postgreSQL database
# Ensure database 'myfut' exists, and server is running
# Data in DATA_FILE should be in the form: 
# PLAYER NAME|CLUB|LEAGUE|POS|OVR|PAC|SHO|PAS|DRI|DEF|PHY

import sys
import psycopg2

if len(sys.argv) != 2:
  print(f'usage: {sys.argv[0]} <DATA_FILE>', file=sys.stderr)
  sys.exit(1)

DATA_FILE = sys.argv[1]

def insertData(cur):
  try:
    with open(DATA_FILE, 'r') as f:
      for player in f:
        if player.startswith("PLAYER NAME"):
          continue
        fields = player.split('|')
        pType = fields[3] if fields[3] == 'GK' else 'PL'
        insert = '''
	      INSERT INTO Cards 
        (fullname, overall, playerType, position, club, league, pace, shooting, passing, dribbling, defence, physical)
        VALUES 
        (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);
	      '''
        cur.execute(insert, [fields[0], fields[4], pType, fields[3], fields[1], fields[2], fields[5], fields[6], fields[7], fields[8], fields[9], fields[10]])
        print(f'Inserted {fields[0]}!')
  except FileNotFoundError:
    print(f'error reading file: {DATA_FILE}', file=sys.stderr)
    sys.exit(1)

try:
  db = psycopg2.connect("dbname=myfut")
  insertData(db.cursor())
  db.commit()
except psycopg2.Error as err:
	print("DB error: ", err)
finally:
	if db:
		db.close()


