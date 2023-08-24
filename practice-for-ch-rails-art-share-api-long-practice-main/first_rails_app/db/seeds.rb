# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
    ArtWorkShare.destroy_all
    ArtWork.destroy_all
    User.destroy_all

    ArtWorkShare.connection.reset_pk_sequence!(:art_work_shares)
    ArtWork.connection.reset_pk_sequence!(:art_works)
    User.connection.reset_pk_sequence!(:users)

    u1 = User.create!(username: 'Shannon')
    u2 = User.create!(username: 'SB')
    u3 = User.create!(username: 'MA')

    a1 = ArtWork.create!(artist_id: u1.id, title: 'title1', image_url: 'title1.jpg')
    a2 = ArtWork.create!(artist_id: u1.id, title: 'title2', image_url: 'title2.jpg')
    a3 = ArtWork.create!(artist_id: u2.id, title: 'title3', image_url: 'title3.jpg')
    a4 = ArtWork.create!(artist_id: u3.id, title: 'title4', image_url: 'title4.jpg')

    as1 = ArtWorkShare.create!(art_work_id: a1.id, viewer_id: u2.id)
    as2 = ArtWorkShare.create!(art_work_id: a1.id, viewer_id: u3.id)    
    as3 = ArtWorkShare.create!(art_work_id: a2.id, viewer_id: u3.id)
    as4 = ArtWorkShare.create!(art_work_id: a3.id, viewer_id: u1.id)
    as5 = ArtWorkShare.create!(art_work_id: a3.id, viewer_id: u3.id)

end