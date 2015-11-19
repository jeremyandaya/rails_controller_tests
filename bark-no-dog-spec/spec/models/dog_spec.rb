require 'rails_helper'

RSpec.describe Dog, :type => :model do

	# let(:valid_attributes) {     
	# 	@valid_attributes = {       
	# 		name: "Fluffy",       
	# 		email: "fluffster@doggie.com",       
	# 		password: "password321",       
	# 		password_confirmation: "password321",       
	# 		birthday: Time.new(2010),
	# 		# birthday: Time.new,       
	# 		city: "New York",       
	# 		state: "NY",
	# 		newsletter: true
	# 	}
	# }

	# let(:dog) { Dog.new(valid_attributes) } 

	# FactoryGirl
	dog = FactoryGirl.build(:dog)

	describe "is invalid without a " do     
		# let(:dog) { Dog.new(valid_attributes) }     

		it "name" do
			dog.name = nil       
			expect(dog).to be_invalid     
		end 

		it "birthday" do
			dog.birthday = nil       
			expect(dog).to be_invalid     
		end 

		it "city" do
			dog.city = nil       
			expect(dog).to be_invalid     
		end 

		it "state" do
			dog.state = nil       
			expect(dog).to be_invalid     
		end 

		it "email" do
			dog.email = nil       
			expect(dog).to be_invalid     
		end 

		it "unique email" do
			FactoryGirl.create(:dog)
			expect(dog).to be_invalid
		end
	end

	describe "#birthday?" do
		# let(:dog) { Dog.create valid_attributes }

		it "should return true if the dog has a birthday today" do
			dog.birthday = Time.now
			expect(dog.birthday?).to eq(true)
		end

		it "should return false if the dog does not have a birthday today" do
			dog.birthday = Time.new(2010)
			expect(dog.birthday?).to eq(false)
		end
	end

	describe "#age" do
		it "should return the age of the dog" do
			dog.birthday = Time.now - 3.years
			expect(dog.age).to eq(3)
		end
	end

	describe "#location" do
		dog2 = FactoryGirl.build(:dog)
		it "should return the location of the dog" do
			expect(dog2.location).to eq(dog2.city + ", " + dog2.state)
		end
	end

	describe "#puppy?" do
		it "should return puppy or not based on the age of the dog" do
			dog.birthday = Time.now - 10.months
			expect(dog.puppy?).to eq(true)
		end
	end

	describe "#age_in_dog_years" do
		it "should return dog age in dog years" do
			expect(dog.age_in_dog_years).to eq(dog.age * 7)
		end
	end

	describe "#subscribe_to_newsletter" do
		# let(:dog) { Dog.new valid_attributes }

		it "should return true if dog.newsletter is true" do
			dog.subscribe_to_newsletter
			expect(dog.newsletter).to eq(true)
		end
	end

	describe "#unsubscribe_from_newsletter" do
		# let(:dog) { Dog.new valid_attributes }
		
		it "should return false if dog.newsletter is false" do
			dog.unsubscribe_from_newsletter
			expect(dog.newsletter).to eq(false)
		end
	end

	describe "#subscribed?" do
		dog1 = FactoryGirl.build(:dog)
		dog2 = FactoryGirl.build(:dog, newsletter: false)
		dog3 = FactoryGirl.build(:dog, newsletter: nil)

		it "should return true if dog is subscribed" do
			expect(dog1.subscribed?).to eq(true)
		end

		it "should return false if dog2 is unsubscribed" do
			expect(dog2.subscribed?).to eq(false)
		end

		it "should return false if dog3 is unsubscribed" do
			expect(dog3.subscribed?).to eq(false)
		end
	end

	describe "#old_dog" do
		it "should return true if dog is older than 10 years" do
			dog4 = FactoryGirl.build(:dog, birthday: Time.new(1999))
			expect(dog4.old_dog?).to eq(true)
		end
	end

end










