require 'rails_helper'

RSpec.describe Post, type: :model do 
	it 'should have attributes :tresc, :autor, :user_id' do
		expect(subject.attributes).to include('tresc', 'autor', 'login_id')
	end
	it 'should validate tresc presence' do
		expect(Post.new).not_to be_valid
		expect(Post.new(tresc:"hehe", login_id:"1",autor:"ja")).to be_valid
	end
	it 'should belong to login' do
		t=Post.reflect_on_association(:login)
		expect(t.macro).to equal :belongs_to
	end
	it 'should have many comments' do
		t=Post.reflect_on_association(:comments)
		expect(t.macro).to equal :has_many
	end
end