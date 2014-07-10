# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
  	f.email "bla@blabla.com"
    f.password "bla123bla"
    f.password_confirmation "bla123bla"
  end
end
