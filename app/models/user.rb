class User < ApplicationRecord
  has_many :cheets
  has_many :subscriptions, foreign_key: :subscriber_id, inverse_of: :subscriber
end