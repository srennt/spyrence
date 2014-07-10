# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
  	f.email "bla@blabla.com"
    f.username "blabla"
    f.age "23"
  end
end
