require 'rails_helper'

RSpec.describe DogsController, :type => :controller do

	let(:valid_attributes){
		@valid_attributes = {
			name: "Bilbo",
			birthday: "November 1, 1855",
			email: "bark@growl.com",
			city: "Barklyn",
			state: "NY:",
			password: "password123",
			password_confirmation: "password123"
		}
	}

	let(:invalid_attributes){
		@invalid_attributes = {
			email: nil
		}
	}

	describe "GET #index" do
		it "assigns all dogs as @dogs" do
			dog = Dog.create! valid_attributes
			get :index
			expect(assigns(:dogs)).to eq([dog])
		end
	end

	describe "GET #show" do
		it "assigns the requested dog as @dog" do
			dog = Dog.create! valid_attributes
			get :show, id: dog.id
			expect(assigns(:dog)).to eq(dog)
		end
	end

	describe "GET #new" do
		it "assigns a new dog as @dog" do
			# dog = Dog.new
			get :new
			expect(assigns(:dog)).to be_a(Dog)
		end
	end

	describe "GET #edit" do     
		it "should assign the correct dog to @dog" do     
			dog = Dog.create! valid_attributes
			get :edit, id: dog.id
			expect(assigns(:dog)).to eq(dog)     
		end  
	end

	describe "DELETE destroy" do
		it "destroys the requested dog" do
			dog = Dog.create! valid_attributes
			get :destroy, id: dog.id
			expect(assigns(:dog)).to eq(dog)
		end
		it "redirect to the dogs list" do
			dog = Dog.create! valid_attributes
			get :destroy, id: dog.id
			expect(response).to redirect_to(dogs_path)
		end
	end

	describe "POST #create" do 
		context "Valid Attributes" do
			it "should assign the record to @dog" do
				# dog = Dog.create! valid_attributes
				post :create, {dog: valid_attributes}
				expect(assigns(:dog)).to eq(Dog.find_by_name(valid_attributes[:name]))
			end
			it "should redirect to the correct dog" do
				post :create, {dog: valid_attributes}
				expect(response).to redirect_to dog_path(assigns(:dog))
				# assigns(:dog) = @dog
			end
		end
		context "Invalid Attributes" do
			it "should not create record to @dog" do
				# dog = Dog.create! invalid_attributes
				post :create, {dog: valid_attributes}
				expect(Dog.find_by_email(invalid_attributes[:email])).to eq(nil)

			end
		end
	end

	describe "PUT #update" do 
		context "Valid Attributes" do
			it "should match the specific record to @dog" do
				dog = Dog.create! valid_attributes
				name = "Spotty"
				put :update, {id: dog.id, dog: {name: name}}
				expect(assigns(:dog)).to eq(Dog.find_by_name(name))
			end

			it "should redirect to the view of @dog" do
				dog = Dog.create! valid_attributes
				name = "Spotty"
				put :update, {id: dog.id, dog: {name: name}}
				expect(response).to redirect_to dog_path(assigns(:dog))
			end

			it "should update the record in the database" do
				dog = Dog.create! valid_attributes
				name = "Spotty"
				put :update, {id: dog.id, dog: {name: name}}
				expect(Dog.find_by_email(valid_attributes[:email]).name).to eq(name)
			end
		end
		context "Invalid Attributes" do
			it "should match the specific record to @dog" do
				dog = Dog.create! valid_attributes
				email = nil
				put :update, {id: dog.id, dog: {email: email}}
				expect(assigns(:dog)[:email]).to eq(nil)
			end

			it "should re-render the edit page" do
				dog = Dog.create! valid_attributes
				email = nil
				put :update, {id: dog.id, dog: {email: email}}
				expect(response).to render_template(:edit)
			end
		end
	end

	# after(:each) do     
	# 	puts "TEST COMPLETE!"   
	# end

end













