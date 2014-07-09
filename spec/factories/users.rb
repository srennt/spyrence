# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
  	f.email "bla@blabla.com"
    f.password "blax123bla"
    f.password_confirmation "blax123bla"
  end
end
