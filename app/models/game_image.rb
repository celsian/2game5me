class GameImage < ActiveRecord::Base
  belongs_to :game

  validates :pic, presence: true

  mount_uploader :pic, InspectionImageUploader
end