class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.text :name, null:false
      t.references :art_work, null:false, foreign_key: true
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end

    add_index :collections, [:name, :user_id, :art_work_id], unique: true

  end
end
