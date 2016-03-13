class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string     :description, :text
      t.integer    :price, null: false
      t.string     :ip, null: false
      t.belongs_to :promo
      t.timestamps null: false
    end
  end
end
