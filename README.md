# テーブル設計

##　usersテーブル

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
- has_one  :purchase_item

## itemsテーブル

| Column       | Type       | Option           |
| ------------ | ---------- | ---------------- |
| item_name    | string     | NOT NULL         |
| text         | text       | NOT NULL         |
| category_id  | integer    | NOT NULL         |
| condition_id | integer    | NOT NULL         |
| fee_id       | integer    | NOT NULL         |
| region_id    | integer    | NOT NULL         |
| send_id      | integer    | NOT NULL         |
| price        | integer    | NOT NULL         |
| user         | references | foreign_key:true |

### Association

- belongs_to :user
- has_one    :purchase_item


## purchase_itemsテーブル

| Column     | Type       | Option           |
| ---------- | ---------- | ---------------- |
| user       | references | foreign_key:true |
| item       | references | foreign_key:true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :purchase_user


## purchase_usersテーブル

| Column        | Type       | Option           |
| ------------- | ---------- | ---------------- | 
| postal_code   | string     | NOT NULL         |
| prefecture    | string     | NOT NULL         |
| city          | string     | NOT NULL         | 
| address       | string     | NOT NULL         |
| phone_number  | string     | NOT NULL         |
| purchase_item | references | foreign_key:true |

### Association
- belongs_to :purchase_item