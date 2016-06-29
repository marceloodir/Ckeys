class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :user, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.datetime :input_register
      t.datetime :output_register

      t.timestamps null: false
    end
  end
end
