class Condition < ApplicationRecord
  belongs_to :contract

  enum type: { contract: 0, agreement: 1 }
end
