FactoryGirl.define do
  factory :category do
    name {FFaker::Lorem.sentence}
  end
end