class Professor < ActiveRecord::Base
  validates_presence_of :nome, :matricula
  validates_uniqueness_of :matricula

  def nome_matricula
    "#{nome} - (#{matricula})"
  end
end
