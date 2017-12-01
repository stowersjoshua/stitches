class AddPhotosToPanoramas < ActiveRecord::Migration
  def change
    add_column :panoramas, :photos, :string
  end
end
