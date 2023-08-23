class CreateArtWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :art_works do |t|
      t.string :title, null: false
      t.string :image_url, null: false, index: {unique: true}
      t.references :artist, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end

    add_index :art_works, [:artist_id, :title], unique: true

  end
end
