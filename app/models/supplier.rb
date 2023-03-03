class Supplier < ApplicationRecord
  has_many :contracts
  has_many :users, through: :contracts

  scope :trusted, -> { where(spend: 50000) }
end
