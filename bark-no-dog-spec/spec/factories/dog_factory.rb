FactoryGirl.define do   
	factory :dog do     
		name "Fluffy"      
		email "fluffster@doggie.com"       
		password "password321"       
		password_confirmation "password321"       
		birthday Time.new(2010)
		city "New York"       
		state "NY"
		newsletter true   
	end 
end