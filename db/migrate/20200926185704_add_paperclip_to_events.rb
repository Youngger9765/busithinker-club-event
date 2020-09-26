class AddPaperclipToEvents < ActiveRecord::Migration[6.0]
  def change
    add_attachment :events, :banner
  end
end
