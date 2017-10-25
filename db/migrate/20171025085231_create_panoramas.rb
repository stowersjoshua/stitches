class CreatePanoramas < ActiveRecord::Migration
  def change
    create_table :panoramas do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
