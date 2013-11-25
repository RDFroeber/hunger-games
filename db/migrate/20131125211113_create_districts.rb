class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name, null: false
      t.string :industry, null: false
    end
  end
end
