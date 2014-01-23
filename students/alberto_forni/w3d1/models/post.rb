class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :title,
    :presence => { :message => 'You have to insert a title' },
    :uniqueness => {:message => 'Another post has the same title'},
    :length => {
      :maximum => 255, :too_long => "%{count} characters is the maximum allowed",
      :minimum => 3, :too_short => "%{count} is the minimum required"
    }
  validates :body,
    :presence => {:message => 'You need to insert a post'},
    :length => {:maximum => 255, :too_long => "%{count} characters is the maximum allowed" }
  validates :author,
    :presence => {:message => 'You need to insert an author'},
    :length => {:maximum => 255, :too_long => "%{count} characters is the maximum allowed" }

  before_create :set_created_at

  before_update :update_created_at

  def set_created_at
    self.created_at = Time.now
  end

  def update_created_at
    self.updated_at = Time.now
  end
end