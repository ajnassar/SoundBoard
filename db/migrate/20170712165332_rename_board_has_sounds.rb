class RenameBoardHasSounds < ActiveRecord::Migration
  def change
    rename_table :board_has_sounds, :board_sounds
  end
end