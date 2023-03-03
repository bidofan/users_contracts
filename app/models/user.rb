class User < ApplicationRecord
  has_many :contracts
  has_many :suppliers, through: :contracts
end
