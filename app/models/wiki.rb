class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  validates :user, presence: true

  validates :title, presence:true
  validates :title, length:{minimum: 4}
  validates :body, presence:true
  validates :body, length:{minimum: 6}
  
  before_save :default_wiki_public

  scope :private_wikis, -> (user) { where(isprivate: true) }
  scope :public_wikis, -> (user) { where(isprivate: false) }

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  def collaborator_for(user)
    collaborators.where(user: user).first
  end

  def default_wiki_public
      if self.isprivate.nil?
        self.update_attribute :isprivate, false
      end
  end

end
