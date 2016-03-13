class Promo < ActiveRecord::Base
  enum type_sale: [:fixed, :percent]
end
