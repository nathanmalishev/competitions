class Competition < ActiveRecord::Base
  has_many :users
  validates :title, presence: true,
                    length: { minimum: 5}
end
