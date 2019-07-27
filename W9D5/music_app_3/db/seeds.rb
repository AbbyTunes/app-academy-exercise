# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 
# an array of hashes

Track.destroy_all
Album.destroy_all
Band.destroy_all
    
bands = Band.create!([ {name: 'Band_1'}, {name: 'Band_2'}, {name: 'Band_3'}, {name: 'Name_4'} ])

albums = Album.create!([ 
        {title: "title_1", year: 2001, music_type: true, album_id: 1},
        {title: "title_2", year: 2002, music_type: false, album_id: 1},
        {title: "title_3", year: 2003, music_type: false, album_id: 4},
        {title: "title_4", year: 2004, music_type: true, album_id: 3},
        {title: "title_4", year: 2004, music_type: true, album_id: 2}
    ])

tracks = Track.create!([
        {track_id: 2, title: "track_title_1", ord: 1, lyrics: "I love one", track_type: false},
        {track_id: 3, title: "track_title_2", ord: 2, lyrics: "I love two", track_type: true},
        {track_id: 1, title: "track_title_3", ord: 3, lyrics: "I love three", track_type: false},
        {track_id: 4, title: "track_title_4", ord: 4, lyrics: "I love four", track_type: true},
        {track_id: 5, title: "track_title_5", ord: 5, lyrics: "I love five", track_type: false},
        {track_id: 6, title: "track_title_6", ord: 6, lyrics: "I love six", track_type: true}
    ])