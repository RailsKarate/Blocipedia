FactoryGirl.define do
  factory :wiki do
    title "Wiki Title"
  	body "Wiki Body"
  	private false
  	user
  end

end