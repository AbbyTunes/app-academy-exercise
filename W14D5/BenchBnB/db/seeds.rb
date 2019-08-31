# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bench.delete_all 

Bench.create!(
    description: 'bench_1',
    lat: 37.770131,
    lng: -122.448805
)

Bench.create!(
    description: 'bench_2',
    lat: 37.713406,
    lng: -122.469218
)

Bench.create!(
    description: 'bench_3',
    lat: 37.792835,
    lng: -122.406424
)

Bench.create!(
    description: 'bench_4',
    lat: 37.752070,
    lng: -122.444372
)

Bench.create!(
    description: 'bench_5',
    lat: 37.781385,
    lng: -122.493712
)
