class CreateRoundsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :rounds, :citizens do |t|
      t.index [:round_id, :citizen_id]
      t.index [:citizen_id, :round_id]
    end
  end
end
