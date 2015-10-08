class Wiki < ActiveRecord::Base
  belongs_to :user

  validates :title, presence:true
  validates :title, length:{minimum: 4}
  validates :body, presence:true
  validates :body, length:{minimum: 6}
  before_save :default_wiki_public

def default_wiki_public
    if self.private.nil?
      self.update_attribute :private, false
    end
  end

end
