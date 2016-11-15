class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # make sure they are not blank
  validates_presence_of :name, :phone, :email
  
  def getFormsCount
    Form.where(:id_user => id).count()
  end
end
