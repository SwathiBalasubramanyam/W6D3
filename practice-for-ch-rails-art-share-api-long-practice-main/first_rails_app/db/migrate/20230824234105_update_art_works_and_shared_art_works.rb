class UpdateArtWorksAndSharedArtWorks < ActiveRecord::Migration[7.0]
  def change
    
    add_column :art_works, :favorite, :boolean
    
    add_column :art_work_shares, :favorite, :boolean

  end
end
