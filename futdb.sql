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