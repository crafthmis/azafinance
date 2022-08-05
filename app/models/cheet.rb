
class Cheet < ApplicationRecord
  belongs_to :user
  validate :length_in_limit

  def length_in_limit
    message.length <= 100
  end
end