class BoardSound < ActiveRecord::Base
	validates :board_id, uniqueness: { 
    scope: :sound_id, 
    message: "Sound has already been added to Board"
  }

	belongs_to :board
	belongs_to :sound
end