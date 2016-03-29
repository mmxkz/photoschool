class Promo < ActiveRecord::Base
  enum type_sale: [:fixed, :percent]

  validates :code, presence: true, uniqueness: true

  def active?
    return true unless limit
    usages < limit
  end
end
