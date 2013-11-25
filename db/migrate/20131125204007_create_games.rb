class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :president, null: false
      t.string :name, null: false
    end
  end
end
