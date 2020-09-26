class AddCustomersTargetToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :customers_target, :integer
  end
end
