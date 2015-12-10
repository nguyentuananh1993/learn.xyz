require "factory_girl"
namespace :develop do
  desc "Create data for development"
  task create_data: :environment do
    3.times{FactoryGirl.create :category}

    category = Category.first
    10.times{FactoryGirl.create :question, category: category}
  end
end