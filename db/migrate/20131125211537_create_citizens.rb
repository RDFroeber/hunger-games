class CreateCitizens < ActiveRecord::Migration
  def change
    create_table :citizens do |t|
      t.references :district, null: false, index: true
      t.string :type

      # All Citizens
      t.string :name, null: false
      t.string :gender, null: false
      t.integer :age, null: false
      t.integer :tesserae
      t.boolean :alive, default: true
      t.timestamps

      # tribute
      t.references :game, index: true
      t.string :skill
      t.integer :rating

      # sponsor
      t.string :style

    end
    #Adding a Foreign Key constraint for district_id and game_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  #Executes RAW SQL
          ALTER TABLE citizens
          ADD CONSTRAINT fk_districts
          FOREIGN KEY (district_id)
          REFERENCES districts(id),
          ADD CONSTRAINT fk_games
          FOREIGN KEY (game_id)
          REFERENCES games(id)
        SQL
        #End of SQL string
      end
    end
  end
end
