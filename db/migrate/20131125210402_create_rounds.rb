class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :game, null: false, index: true
      t.text :zone1
      t.text :zone2
      t.text :zone3
      t.text :zone4
      t.text :zone5
      t.text :zone6
    end
    #Adding a Foreign Key constraint for game_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  #Executes RAW SQL
          ALTER TABLE rounds
          ADD CONSTRAINT fk_games
          FOREIGN KEY (game_id)
          REFERENCES games(id)
        SQL
        #End of SQL string
      end
    end
  end
end
