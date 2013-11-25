class CreateJoinTableRoundTribute < ActiveRecord::Migration
  def change
    create_join_table :rounds, :tributes do |t|
      t.index [:round_id, :tribute_id]
      t.index [:tribute_id, :round_id]
    end
  end
end
