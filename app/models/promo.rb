class Promo < ActiveRecord::Base
  enum type_sale: [:fixed, :percent]

  validates :code, presence: true, uniqueness: true

  validates :sale, numericality: { greater_than: 0, less_than_or_equal_to: 100 }, if: :percent?
  validates :sale, numericality: { greater_than: 0}, if: :fixed?


  def active?
    return true unless limit
    usages < limit
  end
end
