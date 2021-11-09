○アプリケーション名	Badsearch

○概要	
本アプリケーションを通じて、全国のバドミントンサークルの中から自分の希望に合うサークルを見つけ出し、気軽に参加することができる。

## 機能一覧
・ユーザー登録、ログイン機能(devise)
・サークル投稿機能
・いいね機能(Ajax)
・チャット機能(ActionCable)
・ページネーション(kaminari)
・検索機能(ransack)
・カレンダー機能(FullCalendar)

○本番環境	
URL	https:
ログイン機能等を実装した場合は、ログインに必要な情報を記述。またBasic認証等を設けている場合は、そのID/Passも記述すること。

○制作背景(意図)
ペルソナ

○DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)

○工夫した点
・既存のサークル検索webサイトにはない、活動日から検索することができるようにした点。
・サークル運営者に対して気軽に質問や相談ができるよう、問い合わせ方法を2つ(チャット、メール)用意してある点。

○使用技術
・Ruby2.6.5
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

○課題や今後実装したい機能
通知機能(新規チャットがある場合)


○DB設計
# テーブル設計

## users テーブル

| Column              | Type    | Options                       |
| ------------------- | ------- | ----------------------------- |
| nickname            | string  | null: false                   |
| email               | string  | null: false, unique: true     |
| encrypted_password  | string  | null: false                   |
| prefecture_id       | bigint  | null: true, foreign_key: true |
| gender_id           | integer |                               |
| career              | string  |                               |
| profile             | text    |                               |


### Association

- has_one :club
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
- has_many :likes
- has_many :like_clubs, through: :likes, source: :club
- belongs_to :prefecture


## clubs テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| status_id          | integer    | null: false                     |
| since_year         | integer    | null: false                     |
| since_month        | integer    | null: false                     |
| prefecture         | bigint     | null: false, foreign_key: true  |
| city               | bigint     | null: false, foreign_key: true  |
| gym                | string     | null: false                     |
| action_time        | string     | null: false                     |
| fee                | string     |                                 |
| persons            | string     | null: false                     |
| age_range          | string     | null: false                     |
| gender_ratio       | string     | null: false                     |
| beginner_ratio     | string     | null: false                     |
| purpose            | string     | null: false                     |
| homepage           | string     |                                 |
| email              | string     | null: false                     |
| information        | string     | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_many_attached :images
- has_many :likes
- has_many :users, through: :likes
- has_many :events
- has_one :want
- belongs_to :prefecture
- belongs_to :city

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

## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| club   | references | null: false, foreign_key: true |

### Association
- belongs_to :club
- belongs_to :user

## events テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| start   | datetime   |                                |
| end     | datetime   |                                |
| place   | string     |                                |
| club    | references | null: false, foreign_key: true |

### Association
- belongs_to :club

## prefectures テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |

### Association
- has_many :cities, dependent: :destroy
- has_many :users, dependent: :destroy
- has_many :clubs, dependent: :destroy

## cities テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     |                                |
| prefecture | references | null: false, foreign_key: true |

### Association
- belongs_to :prefecture
- has_many :clubs

## wants テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| sex_id     | integer    |                                |
| club       | references | null: false, foreign_key: true |

### Association
- belongs_to :club
- has_many :want_levels
- has_many :levels, through: :want_levels
- has_many :want_ages
- has_many :ages, through: :want_ages

## want_levels テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| want       | references | foreign_key: true              |
| level      | references | foreign_key: true              |

### Association
- belongs_to :want
- belongs_to :level

## want_ages テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| want       | references | foreign_key: true              |
| age        | references | foreign_key: true              |

### Association
- belongs_to :want
- belongs_to :age

## levels テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |

### Association
- has_many :want_levels
- has_many :wants, through: :want_levels

## ages テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |

### Association
- has_many :want_ages
- has_many :wants, through: :want_ages




























洗い出した要件	スプレッドシートにまとめた要件定義を記述。
実装した機能についての画像やGIFおよびその説明	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。
実装予定の機能	洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。
データベース設計	ER図等を添付。
ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。