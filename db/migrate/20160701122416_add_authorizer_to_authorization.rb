class AddAuthorizerToAuthorization < ActiveRecord::Migration
  def change
    add_reference :authorizations, :authorizer, index: true, foreign_key: true
  end
end
