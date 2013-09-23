class Wtwo < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('year DESC') }
  validates :path, presence: true
  validates :user_id, presence: true
end
