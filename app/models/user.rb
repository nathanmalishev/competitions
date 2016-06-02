class User < ActiveRecord::Base
  belongs_to :competition
  validates :user, presence: true,
                   uniqueness: true,
                   length: { minimum: 2}
end
