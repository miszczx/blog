class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	belongs_to :login
	validates :tresc, :login_id, :post_id, presence: true
end