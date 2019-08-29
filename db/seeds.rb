# Add seed data here. Seed your database with `rake db:seed`

artist1 = Artist.create(name: "Adele")

genre1 = Genre.create(name: "Pop")

song1 = Song.create(name: "Hello", artist_id: 1)
song2 = Song.create(name: "Rolling in the Deep", artist_id: 1)

songggenre1 = SongGenre.create(genre_id: 1, song_id: 1)
songggenre1 = SongGenre.create(genre_id: 1, song_id: 2)