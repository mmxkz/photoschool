class AddPromoTypeToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :type_sale, :integer, null: false, default: 0
  end
end
