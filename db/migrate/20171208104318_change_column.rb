class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :users, :phone, :string
  	change_column :prospects, :phone, :string
  end
end
