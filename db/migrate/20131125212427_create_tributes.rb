class CreateTributes < ActiveRecord::Migration
  def change
    create_table :tributes do |t|
      t.references :game, null: false, index: true
      t.references :citizen, null: false, index: true
      t.references :escort, null: false, index: true
      t.string :skill
      t.integer :rating

    end
    #Adding a Foreign Key constraint for citizen_id and escort_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  #Executes RAW SQL
          ALTER TABLE tributes
          ADD CONSTRAINT fk_games
          FOREIGN KEY (game_id)
          REFERENCES games(id),
          ADD CONSTRAINT fk_citizens
          FOREIGN KEY (citizen_id)
          REFERENCES citizens(id),
          ADD CONSTRAINT fk_escorts
          FOREIGN KEY (escort_id)
          REFERENCES citizens(id)
        SQL
        #End of SQL string
      end
    end
  end
end
