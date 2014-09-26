FactoryGirl.define do

  # sequences 
  sequence(:title) {|n| "Example title #{n}"}

  factory :admin_user do
  	email 'admin@example.com'
  	password 'password'
  	password_confirmation 'password'
  end

  factory :page do 
  	title
  	body 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
    page_type 'Home'
  end

  trait :is_published do
    is_published true 
  end
end