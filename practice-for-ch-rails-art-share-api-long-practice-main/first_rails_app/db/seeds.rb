# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
    Collection.destroy_all
    Like.destroy_all
    Comment.destroy_all
    ArtWorkShare.destroy_all
    ArtWork.destroy_all
    User.destroy_all

    Collection.connection.reset_pk_sequence!(:collections)
    Like.connection.reset_pk_sequence!(:likes)
    Comment.connection.reset_pk_sequence!(:comments)
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


    c1 = Comment.create!(art_work_id: 1, author_id:2 , body: 'Wonderful!!')
    c2 = Comment.create!(art_work_id: 2, author_id:3 , body: 'Fanatstic!!')
    c3 = Comment.create!(art_work_id: 1, author_id:3 , body: 'Awesome!!')
    c4 = Comment.create!(art_work_id: 2, author_id:1 , body: 'Wonderful!!')
    c5 = Comment.create!(art_work_id: 1, author_id:1 , body: 'Thankyou all !!')


    l1 = Like.create!(likeable_id:1, likeable_type: :ArtWork, liker_id:1)
    l2 = Like.create!(likeable_id:2, likeable_type: :Comment, liker_id:2)
    l3 = Like.create!(likeable_id:3, likeable_type: :ArtWork, liker_id:3)
    l4 = Like.create!(likeable_id:4, likeable_type: :Comment, liker_id:3)

    col1 = Collection.create!(art_work_id: 1, user_id: 1, name: "my_first")
    col2 = Collection.create!(art_work_id: 2, user_id: 1, name: "my_first")
    col3 = Collection.create!(art_work_id: 3, user_id: 2, name: "my_sec")

end