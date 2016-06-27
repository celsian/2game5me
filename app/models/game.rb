class Game < ActiveRecord::Base
  has_many :game_images, dependent: :destroy
end
