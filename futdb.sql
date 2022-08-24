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

-- Inserting nations
insert into nations (nationName) values ('Afghanistan');
insert into nations (nationName) values ('Albania');
insert into nations (nationName) values ('Algeria');
insert into nations (nationName) values ('American Samoa');
insert into nations (nationName) values ('Andorra');
insert into nations (nationName) values ('Angola');
insert into nations (nationName) values ('Anguilla');
insert into nations (nationName) values ('Antigua and Barbuda');
insert into nations (nationName) values ('Argentina');
insert into nations (nationName) values ('Armenia');
insert into nations (nationName) values ('Aruba');
insert into nations (nationName) values ('Australia');
insert into nations (nationName) values ('Austria');
insert into nations (nationName) values ('Azerbaijan');
insert into nations (nationName) values ('Bahamas');
insert into nations (nationName) values ('Bahrain');
insert into nations (nationName) values ('Bangladesh');
insert into nations (nationName) values ('Barbados');
insert into nations (nationName) values ('Belarus');
insert into nations (nationName) values ('Belgium');
insert into nations (nationName) values ('Belize');
insert into nations (nationName) values ('Benin');
insert into nations (nationName) values ('Bermuda');
insert into nations (nationName) values ('Bhutan');
insert into nations (nationName) values ('Bolivia');
insert into nations (nationName) values ('Bosnia and Herzegovina');
insert into nations (nationName) values ('Botswana');
insert into nations (nationName) values ('Brazil');
insert into nations (nationName) values ('British Virgin Islands');
insert into nations (nationName) values ('Brunei Darussalam');
insert into nations (nationName) values ('Bulgaria');
insert into nations (nationName) values ('Burkina Faso');
insert into nations (nationName) values ('Burundi');
insert into nations (nationName) values ('Cambodia');
insert into nations (nationName) values ('Cameroon');
insert into nations (nationName) values ('Canada');
insert into nations (nationName) values ('Cape Verde Islands');
insert into nations (nationName) values ('Cayman Islands');
insert into nations (nationName) values ('Central African Republic');
insert into nations (nationName) values ('Chad');
insert into nations (nationName) values ('Chile');
insert into nations (nationName) values ('China PR');
insert into nations (nationName) values ('Chinese Taipei');
insert into nations (nationName) values ('Colombia');
insert into nations (nationName) values ('Comoros');
insert into nations (nationName) values ('Congo');
insert into nations (nationName) values ('Congo DR');
insert into nations (nationName) values ('Cook Islands');
insert into nations (nationName) values ('Costa Rica');
insert into nations (nationName) values ('Côte d''Ivoire');
insert into nations (nationName) values ('Croatia');
insert into nations (nationName) values ('Cuba');
insert into nations (nationName) values ('Curaçao');
insert into nations (nationName) values ('Cyprus');
insert into nations (nationName) values ('Czech Republic');
insert into nations (nationName) values ('Denmark');
insert into nations (nationName) values ('Djibouti');
insert into nations (nationName) values ('Dominica');
insert into nations (nationName) values ('Dominican Republic');
insert into nations (nationName) values ('Ecuador');
insert into nations (nationName) values ('Egypt');
insert into nations (nationName) values ('El Salvador');
insert into nations (nationName) values ('England');
insert into nations (nationName) values ('Equatorial Guinea');
insert into nations (nationName) values ('Eritrea');
insert into nations (nationName) values ('Estonia');
insert into nations (nationName) values ('Eswatini');
insert into nations (nationName) values ('Ethiopia');
insert into nations (nationName) values ('Faroe Islands');
insert into nations (nationName) values ('Fiji');
insert into nations (nationName) values ('Finland');
insert into nations (nationName) values ('France');
insert into nations (nationName) values ('FYR Macedonia');
insert into nations (nationName) values ('Gabon');
insert into nations (nationName) values ('Gambia');
insert into nations (nationName) values ('Georgia');
insert into nations (nationName) values ('Germany');
insert into nations (nationName) values ('Ghana');
insert into nations (nationName) values ('Gibraltar');
insert into nations (nationName) values ('Greece');
insert into nations (nationName) values ('Greenland');
insert into nations (nationName) values ('Grenada');
insert into nations (nationName) values ('Guam');
insert into nations (nationName) values ('Guatemala');
insert into nations (nationName) values ('Guinea');
insert into nations (nationName) values ('Guinea-Bissau');
insert into nations (nationName) values ('Guyana');
insert into nations (nationName) values ('Haiti');
insert into nations (nationName) values ('Honduras');
insert into nations (nationName) values ('Hong Kong');
insert into nations (nationName) values ('Hungary');
insert into nations (nationName) values ('Iceland');
insert into nations (nationName) values ('India');
insert into nations (nationName) values ('Indonesia');
insert into nations (nationName) values ('International');
insert into nations (nationName) values ('Iran');
insert into nations (nationName) values ('Iraq');
insert into nations (nationName) values ('Israel');
insert into nations (nationName) values ('Italy');
insert into nations (nationName) values ('Jamaica');
insert into nations (nationName) values ('Japan');
insert into nations (nationName) values ('Jordan');
insert into nations (nationName) values ('Kazakhstan');
insert into nations (nationName) values ('Kenya');
insert into nations (nationName) values ('Korea DPR');
insert into nations (nationName) values ('Korea Republic');
insert into nations (nationName) values ('Kosovo');
insert into nations (nationName) values ('Kuwait');
insert into nations (nationName) values ('Kyrgyzstan');
insert into nations (nationName) values ('Laos');
insert into nations (nationName) values ('Latvia');
insert into nations (nationName) values ('Lebanon');
insert into nations (nationName) values ('Lesotho');
insert into nations (nationName) values ('Liberia');
insert into nations (nationName) values ('Libya');
insert into nations (nationName) values ('Liechtenstein');
insert into nations (nationName) values ('Lithuania');
insert into nations (nationName) values ('Luxembourg');
insert into nations (nationName) values ('Macau');
insert into nations (nationName) values ('Madagascar');
insert into nations (nationName) values ('Malawi');
insert into nations (nationName) values ('Malaysia');
insert into nations (nationName) values ('Maldives');
insert into nations (nationName) values ('Mali');
insert into nations (nationName) values ('Malta');
insert into nations (nationName) values ('Mauritania');
insert into nations (nationName) values ('Mauritius');
insert into nations (nationName) values ('Mexico');
insert into nations (nationName) values ('Moldova');
insert into nations (nationName) values ('Mongolia');
insert into nations (nationName) values ('Montenegro');
insert into nations (nationName) values ('Montserrat');
insert into nations (nationName) values ('Morocco');
insert into nations (nationName) values ('Mozambique');
insert into nations (nationName) values ('Myanmar');
insert into nations (nationName) values ('Namibia');
insert into nations (nationName) values ('Nepal');
insert into nations (nationName) values ('Netherlands');
insert into nations (nationName) values ('New Caledonia');
insert into nations (nationName) values ('New Zealand');
insert into nations (nationName) values ('Nicaragua');
insert into nations (nationName) values ('Niger');
insert into nations (nationName) values ('Nigeria');
insert into nations (nationName) values ('Northern Ireland');
insert into nations (nationName) values ('Norway');
insert into nations (nationName) values ('Oman');
insert into nations (nationName) values ('Pakistan');
insert into nations (nationName) values ('Palestine');
insert into nations (nationName) values ('Panama');
insert into nations (nationName) values ('Papua New Guinea');
insert into nations (nationName) values ('Paraguay');
insert into nations (nationName) values ('Peru');
insert into nations (nationName) values ('Philippines');
insert into nations (nationName) values ('Poland');
insert into nations (nationName) values ('Portugal');
insert into nations (nationName) values ('Puerto Rico');
insert into nations (nationName) values ('Qatar');
insert into nations (nationName) values ('Republic of Ireland');
insert into nations (nationName) values ('Romania');
insert into nations (nationName) values ('Russia');
insert into nations (nationName) values ('Rwanda');
insert into nations (nationName) values ('Samoa');
insert into nations (nationName) values ('San Marino');
insert into nations (nationName) values ('São Tomé e Príncipe');
insert into nations (nationName) values ('Saudi Arabia');
insert into nations (nationName) values ('Scotland');
insert into nations (nationName) values ('Senegal');
insert into nations (nationName) values ('Serbia');
insert into nations (nationName) values ('Seychelles');
insert into nations (nationName) values ('Sierra Leone');
insert into nations (nationName) values ('Singapore');
insert into nations (nationName) values ('Slovakia');
insert into nations (nationName) values ('Slovenia');
insert into nations (nationName) values ('Solomon Islands');
insert into nations (nationName) values ('Somalia');
insert into nations (nationName) values ('South Africa');
insert into nations (nationName) values ('South Sudan');
insert into nations (nationName) values ('Spain');
insert into nations (nationName) values ('Sri Lanka');
insert into nations (nationName) values ('St. Kitts and Nevis');
insert into nations (nationName) values ('St. Lucia');
insert into nations (nationName) values ('St. Vincent and the Grenadines');
insert into nations (nationName) values ('Sudan');
insert into nations (nationName) values ('Suriname');
insert into nations (nationName) values ('Sweden');
insert into nations (nationName) values ('Switzerland');
insert into nations (nationName) values ('Syria');
insert into nations (nationName) values ('Tahiti');
insert into nations (nationName) values ('Tajikistan');
insert into nations (nationName) values ('Tanzania');
insert into nations (nationName) values ('Thailand');
insert into nations (nationName) values ('Timor-Leste');
insert into nations (nationName) values ('Togo');
insert into nations (nationName) values ('Tonga');
insert into nations (nationName) values ('Trinidad and Tobago');
insert into nations (nationName) values ('Tunisia');
insert into nations (nationName) values ('Turkey');
insert into nations (nationName) values ('Turkmenistan');
insert into nations (nationName) values ('Turks and Caicos Islands');
insert into nations (nationName) values ('Uganda');
insert into nations (nationName) values ('Ukraine');
insert into nations (nationName) values ('United Arab Emirates');
insert into nations (nationName) values ('United States');
insert into nations (nationName) values ('Uruguay');
insert into nations (nationName) values ('US Virgin Islands');
insert into nations (nationName) values ('Uzbekistan');
insert into nations (nationName) values ('Vanuatu');
insert into nations (nationName) values ('Venezuela');
insert into nations (nationName) values ('Vietnam');
insert into nations (nationName) values ('Wales');

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