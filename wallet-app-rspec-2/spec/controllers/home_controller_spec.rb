require 'rails_helper'
RSpec.describe HomeController, :type => :controller do

	let(:valid_attributes) { @valid_attributes = { name: "Fluffy", email: "fluffster@aol.com", password: "testtest", password_confirmation: "testtest", birthday: Time.now-3.years, city: "New York", state: "NY",newsletter: true  } }
	let(:valid_session) { {dog_id: 1} }

	# describe "GET 'index'" do
	# 	it "returns http success" do
	# 		get 'index'
	# 		expect(response).to have_http_status(:success)
	# 	end

	# 	after(:each) do 
	# 		puts "TEST COMPLETE!"
	# 	end
	# end

	describe "GET index" do     
		it "assigns all dogs as @dogs" do       
			dog = Dog.create! valid_attributes       
			get :index, {}, valid_session       
			expect(assigns(:dogs)).to eq([dog])     
		end 
	end
end

