class User < ApplicationRecord

  before_create :create_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # validates :email, presence: true

  has_many :tickets
  has_many :users_roles
  has_many :roles, :through => :users_roles

  ROLES = %i[user moderator admin]

  def roles=(roles) 
   roles = [*roles].map { |r| r.to_sym }
   self.role = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
   ROLES.reject do |r|
     ((role.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role) 
    roles.include?(role)
  end
end
