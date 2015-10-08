class User < ActiveRecord::Base
  enum role: [:standard, :premium, :admin]
    after_initialize :set_default_role, :if => :new_record?
 
  def set_default_role
    self.role ||= :standard
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :wikis

  def upgrade_account
    self.update_attributes(role: 'premium')
  end
  
end
