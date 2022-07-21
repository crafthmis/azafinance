class Subscription < ApplicationRecord

  has_one :subscriber, class_name: 'User'
  has_one :subscribed_to, class_name: 'User'
end
