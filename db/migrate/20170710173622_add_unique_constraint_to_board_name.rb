class AddUniqueConstraintToBoardName < ActiveRecord::Migration
  def change
  	add_index :boards, :name, unique: true
  end
end
