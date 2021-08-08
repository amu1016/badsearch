# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| gender              | string  |                           |
| career              | string  |                           |
| prefecture_id       | integer | null: false               |
| city                | string  | null: false               |
| profile             | text    | null: false               |

### Association

- has_many :clubs
- has_many :purchases


## clubs テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| status_id          | integer    | null: false                     |
| category_id        | integer    | null: false                     |
| condition_id       | integer    | null: false                     |
| postage_id         | integer    | null: false                     |
| prefecture_id      | integer    | null: false                     |
| days_to_ship_id    | integer    | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- has_one :purchase
- belongs_to :user

## destinations テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| postal_code        | string     | null: false                     |
| prefecture_id      | integer    | null: false                     |
| city               | string     | null: false                     |
| address            | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | string     | null: false                     |
| purchase           | references | null: false, foreign_key: true  |

### Association

- belongs_to :purchase

## purchases テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| user               | references | null: false, foreign_key: true  |
| item               | references | null: false, foreign_key: true  |

### Association

- has_one :destination
- belongs_to :user
- belongs_to :item