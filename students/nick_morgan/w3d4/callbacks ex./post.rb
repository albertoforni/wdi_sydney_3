class Post < ActiveRecord:: Base
  before_update :refresh_update_date
  before_create :set_created_at

  def refresh_updated_date
    
    self.updated_at = Time.now
  end

  def set_created_at
    self.set_created_at = Time.now
  end
end