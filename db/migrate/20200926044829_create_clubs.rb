class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    add_column :events, :club_id, :integer
    add_index :events, :club_id
  end
end
