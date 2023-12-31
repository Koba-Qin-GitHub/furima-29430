## users テーブル
| Column                    | Type   | Options                   |
| ------------------------- | ------ | ------------------------- |
| nickname                  | string | null: false               |
| email                     | string | null: false, unique: true |
| encrypted_password        | string | null: false               |
| last_name                 | string | null: false               |
| first_name                | string | null: false               |
| last_name_kana            | string | null: false               |
| first_name_kana           | string | null: false               |
| birthday                  | date   | null: false               |


### Association
- has_many :items
- has_many :shopping_logs



--------------------------------------------------------------------------------------



## items テーブル
| Column                    | Type       | Options                         |
| ------------------------- | ---------- | ------------------------------- |
| name                      | string     | null: false                     |
| content                   | text       | null: false                     |
| price                     | integer    | null: false                     |
| category_id               | integer    | null: false                     |
| status_id                 | integer    | null: false                     |
| delivery_charge_id        | integer    | null: false                     |
| prefecture_id             | integer    | null: false                     |
| shipment_date_id          | integer    | null: false                     |
| user                      | references | null: false, foreign_key: true  |


### Association
- belongs_to :user
- has_one :shopping_log



--------------------------------------------------------------------------------------



## shopping_logs テーブル
| Column                    | Type       | Options                         |
| ------------------------- | ---------- | ------------------------------- |
| user                      | references | null: false, foreign_key: true  |
| item                      | references | null: false, foreign_key: true  |


### Association
- belongs_to :user
- belongs_to :item
- has_one :shopping_address_information




-----------------------------------------------------------------------------------




## shopping_address_informations テーブル
| Column                    | Type        | Options                         |
| ------------------------- | ----------- | ------------------------------- |
| postcode                  | string      | null: false                     |
| prefecture_id             | integer     | null: false                     |
| city                      | string      | null: false                     |
| block                     | string      | null: false                     |
| building                  | string      |                                 |
| phone_number              | string      | null: false                     |
| shopping_log              | references  | null: false, foreign_key: true  |


### Association
- belongs_to :shopping_log
