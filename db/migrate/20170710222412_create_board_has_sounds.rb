class CreateBoardHasSounds < ActiveRecord::Migration
  def change
    create_table :board_has_sounds do |t|
    	t.integer :board_id
    	t.integer :sound_id
    end
  end
end
