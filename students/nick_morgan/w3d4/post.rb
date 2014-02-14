class Post < ActiveRecord:: Base
  has_many :comment

  before_update :refresh_update_date
  before_create :set_created_at

  def refresh_updated_date

    self.updated_at = Time.now
  end

  def set_created_at
    self.set_created_at = Time.now
  end
end

class Comment < ActiveRecord:: Base
  belongs_to :post
end

post = Post.find
comments = post.comments

comment = Comment.new

comment = post.comments.build(params[:comment])

if comment.valid?

  comment.save