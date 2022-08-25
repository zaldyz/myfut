-- Simple myFut DB

create table Cards (
	id          serial,
  fullname    text not null,
	overall     integer not null check (overall >= 0 and overall <= 99),
	playerType  varchar(2) not null check (playerType in ('GK', 'PL')),
  position    varchar(3) not null check (position in ('ST', 'RF', 'LF', 'RW', 'LW', 'CF', 'CAM', 'CM', 'CDM', 'RM', 'LM', 'CB', 'LB', 'RB', 'LWB', 'RWB', 'GK')),
	club        varchar(50) not null,
	league      varchar(50) not null,
  nation      varchar(50) not null,
  revision    varchar(50),
  pace        integer not null check (pace >= 0 and pace <= 99),
  shooting    integer not null check (shooting >= 0 and shooting <= 99),
  passing     integer not null check (passing >= 0 and passing <= 99),
  dribbling   integer not null check (dribbling >= 0 and dribbling <= 99),
  defence     integer not null check (defence >= 0 and defence <= 99),
  physical    integer not null check (physical >= 0 and physical <= 99),
  primary key (id)
);