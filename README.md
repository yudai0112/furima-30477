# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| nickname        | string | null: false | #ニックネーム
| email           | string | null: false | #メールアドレス
| password        | string | null: false | #パスワード
| first_name      | string | null: false | #姓
| last_name       | string | null: false | #名
| first_name_kana | string | null: false | #カナ姓
| last_name_kana  | string | null: false | #カナ名
| birthday        | date   | null: false | #生年月日

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type   | Options     |
| ------        | ------ | ----------- |
| product       | string | null: false | #商品名
| product_copy  | text   | null: false | #商品説明
| category_id   | integer| null: false | #カテゴリー
| status_id     | integer| null: false | #商品状態
| burden_id     | integer| null: false | #配送料の負担
| area_id       | integer| null: false | #配送元地域
| area_day_id   | integer| null: false | #配送までの日数
| price         | integer| null: false | #価格
| user          | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :burden
- belongs_to_active_hash :area
- belongs_to_active_hash :area_day


## orders テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :buy

## buys テーブル

| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| postal_code  | string     | null: false | #郵便番号
| area_id      | integer    | null: false | #都道府県
| city         | string     | null: false | #市区町村
| address      | string     | null: false | #番地
| building     | string     | #建物名
| tel          | string     | null: false | #電話番号
| buy          | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to_active_hash :area



