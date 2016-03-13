class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string   :code, uniq: true, null: false
      t.integer  :usages, default: 0
      t.integer  :limit
      t.integer  :sale, null: false
      t.timestamps null: false
    end
  end
end
