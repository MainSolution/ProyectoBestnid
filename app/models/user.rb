class User < ActiveRecord::Base
  rolify  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :articles
has_many :offers

ROLES = %w[admin user]
#validates_presence_of :nombre, :apellido, :nick , :password, :password_confirmation, :email
validates_uniqueness_of :nick , :email 
validates_length_of :password, minimum: 8
#validar el formato de correo 
mount_uploader :foto, FotoUploader 

    

end
