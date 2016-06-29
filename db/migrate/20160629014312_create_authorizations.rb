class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.references :professor, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.date :date_register
      t.date :date_expiration

      t.timestamps null: false
    end
  end
end
