# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Track.destroy_all
Album.destroy_all
Band.destroy_all

users = User.create!([
    {email: "user_1@gmail.com", password_digest: "banana_1", session_token: "1_banana"},
    {email: "user_2@gmail.com", password_digest: "banana_2", session_token: "2_banana"}
    ])

bands = Band.create!([
    {name: "band_1"}, {name: "band_2"}, {name: "band_3"}, {name: "band_4"}, {name: "band_5"}
    ])

albums = Album.create!([
    {name: "album_1", year: 2001, band_id: 2},
    {name: "album_2", year: 2002, band_id: 3},
    {name: "album_3", year: 2003, band_id: 1},
    {name: "album_4", year: 2004, band_id: 4},
    {name: "album_4", year: 2005, band_id: 5}
    ])