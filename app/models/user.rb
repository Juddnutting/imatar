class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  validates :name, presence: true, length: {minimum: 3, maximum: 50}

  def self.search(search)
  	if search
  		find_by(email: search.strip.downcase) || NoRecord.new
  	end
  end

end
