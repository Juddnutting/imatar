class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :profile


  def self.search(search)
  	if search
  		find_by(email: search.strip.downcase) || NoRecord.new
  	end
  end

  def message
    "Profile Found"
  end

end
