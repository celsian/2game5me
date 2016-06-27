class CreateGameImages < ActiveRecord::Migration
  def change
    create_table :game_images do |t|
      t.string :pic
      t.references :game, index: true

      t.timestamps null: false
    end
  end
end
