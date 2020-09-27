class AddNameIsAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_admin, :bool
    add_column :users, :name, :string
    add_column :users, :nick_name, :string
  end
end
