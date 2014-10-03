FactoryGirl.define do

  # sequences 
  sequence(:title) {|n| "Example title #{n}"}
  sequence(:email) {|n| "example#{n}@example.com"}

  factory :user do 
    email 
    password 'password21'

    trait :admin do 
      admin true 
    end
  end

  factory :page do 
  	title
  	body 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
    page_type 'Home'

    factory :child_page do |f|
      f.parent FactoryGirl.create(:page)
    end
  end

  trait :published do
    is_published true 
  end
end