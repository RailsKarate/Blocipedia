FactoryGirl.define do
  factory :wiki do
    title "Wiki Title"
  	body "Wiki Body"

  	isprivate false
  	user
  end

end