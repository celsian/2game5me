class AddReleaseDatetoGames < ActiveRecord::Migration
  def change
    add_column :games, :release_date, :string
  end
end
