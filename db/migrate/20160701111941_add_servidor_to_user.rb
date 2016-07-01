class AddServidorToUser < ActiveRecord::Migration
  def change
    add_column :users, :servidor, :boolean, :default => false
  end
end
