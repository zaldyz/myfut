-- myFut Database
-- Creates the tables for the myFut Database

create table Leagues (
  id          serial, 
  leagueName  text not null, 
  primary key (id)
);

create table Nations (
  id          serial, 
  nationName  text not null,
  primary key (id)
);

create table Revisions (
  id          serial,
  revision    text not null unique,
  primary key (id)
);

create table Clubs (
  id          serial, 
  clubName    text not null,
  league      integer not null,
  foreign key (league) references Leagues(id),
  primary key (id)
);

create table Players (
  id          serial, 
  firstName   text, 
  lastName    text not null,
  primary key (id)
);

create table Cards (
	id          serial,
	overall     integer not null check (overall >= 0 and overall <= 99),
	playerType  varchar(2) not null check (playerType in ('GK', 'PL')),
  position    varchar(3) not null check (position in ('ST', 'RF', 'LF', 'RW', 'LW', 'CF', 'CAM', 'CM', 'CDM', 'RM', 'LM', 'CB', 'LB', 'RB', 'LWB', 'RWB', 'GK')),
	club        integer not null,
  nation      integer not null,
  revision    integer not null,
  foreign key (club) references Clubs(id),
  foreign key (nation) references Nations(id),
  foreign key (revision) references Revisions(id),
  primary key (id)
);

-- Inserting leagues (Top 5)
insert into leagues (leagueName) values ('LaLiga Santander');
insert into leagues (leagueName) values ('Premier League');
insert into leagues (leagueName) values ('Serie A');
insert into leagues (leagueName) values ('Bundesliga');
insert into leagues (leagueName) values ('Ligue 1');

-- Inserting all top 5 clubs, syntax requires the name of an existing league
insert into clubs (clubName, league)
  select 'Arsenal' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Aston Villa' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Chelsea' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Everton' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Leeds United' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Liverpool' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Manchester City' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Manchester Utd' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Newcastle Utd' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Southampton' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Spurs' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'West Ham' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Leicester City' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Wolves' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Norwich' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Watford' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Burnley' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Crystal Palace' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Brighton' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Brentford' as clubName, id as league
  from leagues
  where leagueName='Premier League';

insert into clubs (clubName, league)
  select 'Atlético de Madrid' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'FC Barcelona' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'Real Madrid' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'Athletic Club' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'Real Betis' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'RC Celta' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'RCD Espanyol' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'RCD Mallorca' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'Real Sociedad' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'Valencia CF' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'D.Alavés' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'Elche CF' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'CA Osasuna' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'Rayo Vallecano' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'Sevilla FC' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'Villarreal CF' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'Levante UD' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'Getafe CF' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'Cádiz CF' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select 'Granada' as clubName, id as league
  from leagues
  where leagueName='LaLiga Santander';

insert into clubs (clubName, league)
  select '1. FC Köln' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select '1. FSV Mainz 05' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'FC Bayern' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'Dortmund' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'M''gladbach' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'SC Freiburg' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'Leverkusen' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'VfB Stuttgart' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'Bielefeld' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'VfL Bochum' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'Greuther Fürth' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'Hertha Berlin' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'VfL Wolfsburg' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'Frankfurt' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'Union Berlin' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'TSG Hoffenheim' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'FC Augsburg' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'RB Leipzig' as clubName, id as league
  from leagues
  where leagueName='Bundesliga';

insert into clubs (clubName, league)
  select 'Bordeaux' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'RC Lens' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'LOSC' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'OL' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'FC Metz' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'AS Monaco' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'Montpellier' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'FC Nantes' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'OGC Nice' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'Paris SG' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'Rennes' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'Strasbourg' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'FC Lorient' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'OM' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'Troyes' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'Stade Brestois' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'Stade de Reims' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'Angers SCO' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'Clermont' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'ASSE' as clubName, id as league
  from leagues
  where leagueName='Ligue 1';

insert into clubs (clubName, league)
  select 'Inter' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Milan' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Napoli' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Torino' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Udinese' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Bologna' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Venezia' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Hellas Verona' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Empoli' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Sampdoria' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Cagliari' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Salernitana' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Fiorentina' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Genoa' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Sassuolo' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'La Spezia' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Piemonte Calcio' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Roma FC' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'SS Lazio' as clubName, id as league
  from leagues
  where leagueName='Serie A';

insert into clubs (clubName, league)
  select 'Atalanta BC' as clubName, id as league
  from leagues
  where leagueName='Serie A';