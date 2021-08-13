# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| prefecture_id       | integer |                           |
| gender_id           | integer |                           |
| career              | string  |                           |
| profile             | text    |                           |

### Association

- has_many :clubs


## clubs テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| status_id          | integer    | null: false                     |
| since_year         | integer    | null: false                     |
| since_month        | integer    | null: false                     |
| prefecture_id      | integer    | null: false                     |
| city               | string     | null: false                     |
| gym                | string     | null: false                     |
| gender_ratio       | string     | null: false                     |
| beginner_ratio     | string     | null: false                     |
| age_range          | string     | null: false                     |
| purpose            | string     | null: false                     |
| homepage           | string     |                                 |
| information        | string     | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user

## messages テーブル(追加) 

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
