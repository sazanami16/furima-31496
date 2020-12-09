# テーブル設計

##　usersテーブル

| Column     | Type   | Option   |
| ---------- | ------ | -------- |
| nick_name  | string | NOT NULL |
| email      | string | NOT NULL |
| password   | string | NOT NULL |
| birth      | int    | NOT NULL |
| last_name  | string | NOT NULL |
| first_name | string | NOT NUll |

## itemsテーブル

| Column     | Type       | Option   |
| ---------- | ---------- | -------- |
| item_name  | string     | NOT NULL |
| text       | text       | NOT NULL |
| category   | string     | NOT NULL |
| condition  | string     | NOT NULL |
| fee        | string     | NOT NULL |
| region     | string     | NOT NULL |
| send       | string     | NOT NULL |
| price      | int        | NOT NULL |
| user       | references | -------- |

## purchase_itemsテーブル

| Column     | Type       | Option   |
| ---------- | ---------- | -------- |
| user       | references | -------- |
| item       | references | -------- |

## purchase_usersテーブル

| Column        | Type       | Option   |
| ------------- | ---------- | -------- |
| postal_code   | int        | NOT NULL |
| prefecture    | string     | NOT NULL |
| city          | string     | NOT NULL |
| address       | string     | NOT NULL |
| phone_number  | int        | NOT NULL |
| user          | references | -------- |
| purchase_item | references | -------- |