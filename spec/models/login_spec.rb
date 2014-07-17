require 'rails_helper'

RSpec.describe Login, type: :model do 
	it 'should have attributes :email, encrypted_password' do
		expect(subject.attributes).to include('email', 'encrypted_password')
	end
	it 'should validate attributes presence' do
		expect(Login.new).not_to be_valid
		expect(Login.new(email:"haha@o2.pl",password:"costamcos")).to be_valid
	end
	it 'should have many comments' do
		t=Login.reflect_on_association(:posts)
		expect(t.macro).to equal :has_many
	end
	it 'should have many posts' do
		t=Login.reflect_on_association(:comments)
		expect(t.macro).to equal :has_many
	end
end