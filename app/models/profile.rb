class Profile < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "400x400>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  before_save :create_email_hash
  validates :image, presence: true

	def create_email_hash
		self.email_hash = Digest::MD5.hexdigest(self.user.email)
	end

end
