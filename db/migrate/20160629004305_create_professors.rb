class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :nome
      t.string :matricula

      t.timestamps null: false
    end
  end
end
