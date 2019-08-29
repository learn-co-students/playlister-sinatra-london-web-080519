# Add seed data here. Seed your database with `rake db:seed`
Artist.destroy_all
Song.destroy_all
Genre.destroy_all
SongGenre.destroy_all

eminem = Artist.create(name: "Eminem")
amazons = Artist.create(name: "Amazons")
tame_impala = Artist.create(name: "Tame Impala")

lose_yourself = Song.create(name: "Lose Yourself", artist: eminem)
ultraviolet = Song.create(name: "Ultraviolet", artist: amazons)
black_magic = Song.create(name: "Black Magic", artist: amazons)
less_i_know = Song.create(name: "Less I Know The Better", artist: tame_impala)

rap = Genre.create(name: "Rap")
rock = Genre.create(name: "Rock")
pop = Genre.create(name: "Pop")

sg1 = SongGenre.create(genre: rap, song: lose_yourself)
sg2 = SongGenre.create(genre: rock, song: ultraviolet)
sg3 = SongGenre.create(genre: rock, song: black_magic)
sg4 = SongGenre.create(genre: pop, song: less_i_know)
