class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :login
	has_many :comments
	validates :autor, :login_id, :tresc, presence: true
end