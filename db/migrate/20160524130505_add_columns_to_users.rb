class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :area, :string
    add_column :users, :sex, :string
    add_column :users, :age, :integer
    add_column :users, :detail, :text
  end
end
