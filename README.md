# テーブル設計

##　 users テーブル

| Column             | Type   | Option       |
| ------------------ | ------ | ------------ |
| nick_name          | string | NOT NULL     |
| email              | string | unique: true |
| encrypted_password | string | NOT NULL     |
| birth              | date   | NOT NULL     |
| last_name          | string | NOT NULL     |
| first_name         | string | NOT NUll     |
| last_reading       | string | NOT NULL     |
| first_reading      | string | NOT NULL     |

### Association

- has_many :items
- has_one  :user_item

## items テーブル

| Column        | Type       | Option           |
| ------------- | ---------- | ---------------- |
| name          | string     | NOT NULL         |
| text          | text       | NOT NULL         |
| category_id   | integer    | NOT NULL         |
| condition_id  | integer    | NOT NULL         |
| fee_id        | integer    | NOT NULL         |
| prefecture_id | integer    | NOT NULL         |
| send_time_id  | integer    | NOT NULL         |
| price         | integer    | NOT NULL         |
| user          | references | foreign_key:true |

### Association

- belongs_to :user
- has_one :user_item

## user_items テーブル

| Column | Type       | Option           |
| ------ | ---------- | ---------------- |
| user   | references | foreign_key:true |
| item   | references | foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order

## orders テーブル

| Column        | Type       | Option           |
| ------------- | ---------- | ---------------- |
| postal_code   | string     | NOT NULL         |
| prefecture_id | integer    | NOT NULL         |
| city          | string     | NOT NULL         |
| address       | string     | NOT NULL         |
| building      | string     | ---------------- |
| phone_number  | string     | NOT NULL         |
| user_item     | references | foreign_key:true |

### Association

- belongs_to :user_item
