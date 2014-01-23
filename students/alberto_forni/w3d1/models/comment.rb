class Comment < ActiveRecord::Base
  belongs_to :post

  before_create :set_created_at

  validates :text,
    :presence => { :message => 'You have to insert a comment' },
    :length => {:maximum => 300, :too_long => "%{count} characters is the maximum allowed" }
  
  validates :author,
    :presence => { :message => 'You have to insert your name' },
    :length => {:maximum => 255, :too_long => "%{count} characters is the maximum allowed" }

  def set_created_at
    self.created_at = Time.now
  end
end