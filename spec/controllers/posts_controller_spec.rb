require "rails_helper"

RSpec.describe PostsController, type: :controller do 
		before(:each) do
			@login=Login.create(email:'test@test.pl', password: 'testpassword')
			sign_in @login
		end

		describe "GET#index" do
			it "respond succesfully with an HTTP 200 status code" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
			end	
			it 'renders the index template' do
				get :index
				expect(response).to render_template("index")
			end
			it 'loads all the posts into @posts' do
				post1, post2 = Post.create(tresc: "haha",user_id:"1", autor:"ja"),Post.create(tresc: "hahahah",user_id:"2", autor:"jaaaa")	
				get :index
				expect(assigns(:post)).to match_array([post1,post2])
			end

		end
end