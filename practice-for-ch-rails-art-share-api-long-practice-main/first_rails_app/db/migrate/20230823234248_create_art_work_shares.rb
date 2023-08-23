class CreateArtWorkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :art_work_shares do |t|
      t.references :art_works, null: false, foreign_key: true
      t.references :viewer, null:false , foreign_key: {to_table: :users}
      t.timestamps
    end

    add_index :art_work_shares, [:art_work_id, :viewer_id], unique: true

  end
end
