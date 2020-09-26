class CreateEventClubships < ActiveRecord::Migration[6.0]
  def change
    create_table :event_clubships do |t|
      t.integer :event_id
      t.integer :club_id

      t.timestamps
    end
  end
end
