class Order < ApplicationRecord

  belongs_to :lesson
  belongs_to :student
  # Money Gem
  monetize :amount_cents
end
