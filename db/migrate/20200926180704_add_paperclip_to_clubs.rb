class AddPaperclipToClubs < ActiveRecord::Migration[6.0]
  def change
    add_attachment :clubs, :banner
    add_attachment :clubs, :logo
  end
end
