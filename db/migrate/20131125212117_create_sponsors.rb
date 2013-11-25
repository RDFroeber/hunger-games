class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.references :citizen, null: false, index: true
      t.string :style
    end
    #Adding a Foreign Key constraint for citizen_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  #Executes RAW SQL
          ALTER TABLE sponsors
          ADD CONSTRAINT fk_citizens
          FOREIGN KEY (citizen_id)
          REFERENCES citizens(id)
        SQL
        #End of SQL string
      end
    end
  end
end
