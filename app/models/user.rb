class User < ActiveRecord::Base
  has_many :authorizations, :dependent => :restrict_with_exception
  has_many :loans, :dependent => :restrict_with_exception
  
  validates_presence_of :nome, :matricula
  validates_uniqueness_of :matricula

  scope :servidores, ->{ where(servidor: true) }
  scope :alunos, ->{ where(servidor: false) }
  scope :administradores, ->{ where(admin: true) }

  def nome_matricula
    "#{nome} - (#{matricula})"
  end
end
