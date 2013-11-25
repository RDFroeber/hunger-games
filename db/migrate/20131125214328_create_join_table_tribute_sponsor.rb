class CreateJoinTableTributeSponsor < ActiveRecord::Migration
  def change
    create_join_table :tributes, :sponsors do |t|
      t.index [:tribute_id, :sponsor_id]
      t.index [:sponsor_id, :tribute_id]
    end
  end
end
