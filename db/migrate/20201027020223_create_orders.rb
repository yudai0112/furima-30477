class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.timestamps
      t.references :user,           null: false, foreign_key: true #user
      t.references :item,           null: false, foreign_key: true #item

    end
  end
end
