class User < ActiveRecord::Base
  validates_presence_of :nome, :matricula
  validates_uniqueness_of :matricula

  scope :servidores, ->{ where(servidor: true) }
  scope :alunos, ->{ where(servidor: false) }

  def nome_matricula
    "#{nome} - (#{matricula})"
  end
end
