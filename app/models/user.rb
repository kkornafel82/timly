class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

has_many :businesses

def admin?
  role == 'admin'
end

def standard?
  role == 'standard'
end

def premium?
  role == "premium"
end


end
