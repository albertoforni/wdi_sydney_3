class Animal < ActiveRecord::Base
  belongs_to :shelter

  validates :name, presence: true

  before_create :set_donated_at

  def set_donated_at
    self.adopted = false
    self.donated_at = Time.now
  end
end