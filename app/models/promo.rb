class Promo < ActiveRecord::Base
  enum type_sale: [:fixed, :percent]

  validates :code, presence: true, uniqueness: true
end
