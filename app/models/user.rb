class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	validates :name, :age, presence: true
	validates :name, format: /[A-Z][a-z]*/
end	