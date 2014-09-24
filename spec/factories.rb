FactoryGirl.define do
  factory :admin_user do
  	email 'admin@example.com'
  	password 'password'
  	password_confirmation 'password'
  end

  factory :page do 
  	title 'My Title'
  	body 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
  	
  end
end