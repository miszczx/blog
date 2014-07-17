require 'rails_helper'

RSpec.describe Comment, type: :model do 
	it 'should have attributes :tresc, :user_id, post_id' do
		expect(subject.attributes).to include('tresc', 'post_id', 'login_id')
	end
	it 'should validate attributes presence' do
		expect(Comment.new).not_to be_valid
		expect(Comment.new(tresc:"hehe", login_id:"1",post_id:"1")).to be_valid
	end
	it 'should belong to login' do
		t=Comment.reflect_on_association(:login)
		expect(t.macro).to equal :belongs_to
	end
	it 'should belong to post' do
		t=Comment.reflect_on_association(:post)
		expect(t.macro).to equal :belongs_to
	end
end