create table if not exists Genre (
	id SERIAL primary key,
	name VARCHAR(40) not null
);

create table if not exists Musician (
	id SERIAL primary key,
	name VARCHAR(40) not null
);

create table if not exists MusiciansGenres (
	genre_id INTEGER not null references Genre(id),
	musician_id INTEGER not null references Musician(id),
	constraint pk primary key (genre_id, musician_id)
);

create table if not exists Album (
	id SERIAL primary key,
	name VARCHAR(40) not null,
	year_of_release DATE not null
);

create table if not exists AlbumMusician (
	musician_id INTEGER not null references Musician(id),
	album_id INTEGER not null references Album(id),
	constraint pk primary key (musician_id, album_id)
);

create table if not exists Songs (
	id SERIAL primary key,
	name VARCHAR(40) not null,
	duration_sec INTEGER not null,
	album_id INTEGER not null references Album(id)
);

create table if not exists Collection (
	id SERIAL primary key,
	name VARCHAR(40) not null,
	year_of_release DATE not null
);

create table if not exists SongsOfCollection (
	song_id INTEGER not null references Songs(id),
	collection_id INTEGER not null references Collection(id),
);