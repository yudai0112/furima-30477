class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :product,            null: false #商品名
      t.text :product_copy,         null: false #商品説明
      t.integer :category_id,       null: false #カテゴリー
      t.integer :status_id,         null: false #商品状態
      t.integer :burden_id,         null: false #配送料の負担
      t.integer :area_id,           null: false #配送元地域
      t.integer :area_day_id,       null: false #配送までの日数
      t.integer :price,             null: false #価格
      t.references :user,           null: false, foreign_key: true #user
    end
  end
end
