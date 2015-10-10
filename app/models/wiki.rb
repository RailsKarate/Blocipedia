class Wiki < ActiveRecord::Base
  belongs_to :user

  has_many :collaborators
  has_many :collaborated_users, through: :collaborators, source: :user

  validates :title, presence:true
  validates :title, length:{minimum: 4}
  validates :body, presence:true
  validates :body, length:{minimum: 6}
  before_save :default_wiki_public

def default_wiki_public
    if self.isprivate.nil?
      self.update_attribute :isprivate, false
    end
  end

end
