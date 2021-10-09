# Badsearch

# 使用技術

・Ruby　2.6.5
・Ruby on Rails 6.0.0
・MySQL 5.6.51
・Nginx
・Puma
・AWS
・Docker/Docker-compose
・
・
・
・
・
・
・
・
・
・



# 機能一覧

・ユーザー登録、ログイン機能(devise)
・
・
・
・
・
・
・
・
・













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
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages


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

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user