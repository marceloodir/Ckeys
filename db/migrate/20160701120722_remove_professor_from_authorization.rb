class RemoveProfessorFromAuthorization < ActiveRecord::Migration
  def change
    remove_reference :authorizations, :professor, index: true, foreign_key: true
  end
end
