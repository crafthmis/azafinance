class User < ApplicationRecord
  has_many :transactions, foreign_key: :user_id, inverse_of: :user
end