## users テーブル
| Column                    | Type   | Options                   |
| ------------------------- | ------ | ------------------------- |
| nickname                  | string | null: false, unique: true |
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
| text                      | text       | null: false                     |
| status                    | string     | null: false                     |
| price                     | integer    | null: false                     |
| delivery_charge           | string     | null: false                     |
| sender_region             | string     | null: false                     |
| shipment_date             | integer    | null: false                     |
| user                      | references | null: false, foreign_key: true  |


### Association
- belongs_to :user
- has_one :shopping_logs



--------------------------------------------------------------------------------------



## shopping_logs テーブル
| Column                    | Type       | Options                         |
| ------------------------- | ---------- | ------------------------------- |
| user                      | references | null: false, foreign_key: true  |


### Association
- belongs_to :user
- belongs_to :items
- has_one :shopping_address_informations




-----------------------------------------------------------------------------------




## shopping_address_informations テーブル
| Column                    | Type     | Options                   |
| ------------------------- | -------- | ------------------------- |
| postcode                  | string   | null: false               |
| prefecture                | string   | null: false               |
| city                      | string   | null: false               |
| block                     | string   | null: false               |
| building                  | string   | null: false               |
| phone_number              | integer  | null: false               |


### Association
- belongs_to :shopping_logs
