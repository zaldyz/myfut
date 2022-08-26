# Set up instructions

## The Database
The DBMS being used by myFut is [postgreSQL](https://www.postgresql.org/). You can download and install it for free [here](https://www.postgresql.org/download/).

### Step 1: Creating the Database
Ensure that you have a postgreSQL server running, and create a fresh database named `myfut`.
```
$ createdb myfut
```
Once the database has been created, we can access it using postgreSQL's interactive, terminal-based front end `psql`
```
$ psql myfut
```
Your prompt should now look something like `myfut=#`.
Now, to initialise the database with `db_init.sql`, enter the following.
```
myfut=# \i db_init.sql
```
The database should now contain `cards` and `cards_id_seq`, we can verify this by entering `\d` into the command line, the output should look like the following:
```
myfut=# \d
              List of relations
 Schema |     Name     |   Type   |  Owner
--------+--------------+----------+----------
 public | cards        | table    | admin
 public | cards_id_seq | sequence | admin
(2 rows)
```
### Step 2: Populating the Database
We have created and initialised a fresh database, but now we need our data. 
The script `scraper.py` will scrape the latest data from [futhead.com](futhead.com), and write the data to a file `data.txt` in the following form:
```
PLAYER NAME|CLUB|LEAGUE|POS|OVR|PAC|SHO|PAS|DRI|DEF|PHY
```
Currently, the script only scrapes FIFA 22 FUT players that are **gold** rarity or above, but support for previous years and bronze/silver rarity can be easily added in the future. 

To run the following scripts, the following PyPi packages are required:
* [beautifulsoup4](https://pypi.org/project/beautifulsoup4/)
* [requests](https://pypi.org/project/requests/)
* [psycopg2](https://pypi.org/project/psycopg2/)

To install:
```
$ pip install requests
```
```
$ pip install bs4
```
```
$ pip install psycopg2
```

Finally, we can run the script:
```
$ python3 scraper.py
```
Once the script finishes executing, a new file `data.txt` containing latest player data should appear in the current directory.

Now to insert our newly acquired data into our database. 

First ensure the postgreSQL server is running, and the database `myfut` exists and is initialised as per the instructions in Step 1.

The script `insert.py` will read a data file containing player data and insert each entry into our database. 

```
$ python3 insert.py data.txt
```
The database should now contain entries for all gold rarity or higher cards! We can verify this by trying out some queries on the data:
```
$ psql myfut
psql (14.4)
Type "help" for help.

myfut=# select fullname, overall, club from cards where league='LaLiga Santander' limit 10;
      fullname      | overall |        club
--------------------+---------+--------------------
 Robert Lewandowski |      99 | FC Barcelona
 Ousmane Dembélé    |      99 | FC Barcelona
 Gareth Bale        |      98 | Real Madrid
 Karim Benzema      |      98 | Real Madrid
 Marcelo            |      97 | Real Madrid
 Luka Modrić        |      97 | Real Madrid
 Antoine Griezmann  |      96 | Atlético de Madrid
 Ferland Mendy      |      96 | Real Madrid
 Ferran Torres      |      96 | FC Barcelona
 Eden Hazard        |      96 | Real Madrid
(10 rows)

myfut=# select fullname, overall, league, club from cards where pace=99 and league='Premier League' limit 5;
      fullname       | overall |     league     |          club
---------------------+---------+----------------+------------------------
 Mohamed Salah       |      99 | Premier League | Liverpool
 Cristiano Ronaldo   |      99 | Premier League | Manchester Utd
 Allan Saint-Maximin |      97 | Premier League | Newcastle Utd
 Ole Gunnar Solskjær |      97 | Premier League | England Premier League
 Marcus Rashford     |      97 | Premier League | Manchester Utd
(5 rows)
```
