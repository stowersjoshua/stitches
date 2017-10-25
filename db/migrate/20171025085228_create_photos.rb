class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :panorama, index: true

      t.timestamps
    end
  end
end
