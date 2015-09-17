class Wiki < ActiveRecord::Base
  belongs_to :user

  validates :title, presence:true
  validates :title, length:{minimum: 4}
  validates :body, presence:true
  validates :body, length:{minimum: 6}

end
