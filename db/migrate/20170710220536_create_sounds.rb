class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
    	t.string :name
    	t.text :description
    end
  end
end
