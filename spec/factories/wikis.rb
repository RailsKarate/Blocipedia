FactoryGirl.define do
  factory :wiki do
    title "Wiki Title"
  	body "Wiki Body"
  	
  	transient do
    	private false
    end

  	user
  end

end