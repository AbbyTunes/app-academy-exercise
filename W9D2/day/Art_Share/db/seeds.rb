# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# Models use single formatting

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all
    
    users = User.create!([ {username: 'Name_1'}, {username: 'Name_2'}, {username: 'Name_3'}, {username: 'Name_4'} ])

    artworks = Artwork.create!([
    { title: 'art_1' ,image_url: 'link_1.com', artist_id: User.second.id },
    { title: 'art_2' ,image_url: 'link_2.com', artist_id: User.all[3].id }, 
    { title: 'art_3' ,image_url: 'link_3.com', artist_id: User.first.id } 
   ])

    artwork_shares = ArtworkShare.create!([ 
    { artwork_id: Artwork.all[2].id, viewer_id: User.second.id }, 
    { artwork_id: Artwork.all[1].id ,viewer_id:  User.first.id },
    { artwork_id: Artwork.all[0].id, viewer_id: User.all[3].id} 
  ])
  # viewer_id: 3 # better not hardcode
  # artist: User.second # can use association methods


