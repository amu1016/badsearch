# アプリケーション名	
Badsearch(バドサーチ)

# 概要	
本アプリケーションを通じて、全国のバドミントンサークルの中から自分の希望に合うサークルを見つけ出し、気軽に参加することができる。

# 本番環境	
URL	https://www.bad-search.com  
  
Basic認証  
ユーザー：badsearch  
Password：3333  
  
ログイン情報（テスト用）  
Eメール：test@gmail.com  
パスワード：aaa111  

# 制作背景(意図)
昨今、オリンピックや世界選手権大会などで、日本のバドミントン選手が世界で活躍していることから、世間でバドミントンの熱が高まっているのではないかと考えました。
そんな中、バドミントンを始めたいと思う人の背中を押したいと思いました。そのために、簡単に自分に合うバドミントンサークルを見つけ出し、気軽に参加できるような検索アプリがあれば良いと考えましたが、すでにサークル検索のWebサイトは存在していました。
しかし、既存のWebサイトはスポーツ全般向けのものであり、バドミントンを始めたいと思っている人たちにとって、使いやすいものなのかについて疑問を抱きました。そこで、バドミントン経験者の知人に聞き取りを実施しました。
すると、既存サイトでは下記のような課題があり、使いにくいとの意見をもらいました。  
- 気軽にサークル運営者へ問い合わせができない(手段がメールのみ)  
- サークルの直近の活動予定日がわからない  
- サークルの方針やレベル感を知ることができない  

以上の課題を解決するため、下記機能を盛り込む事で、バドミントンを始めたいと考える人たちにとってより使いやすくなると考えました。  
- 気軽にサークル運営者へ問い合わせができる機能(メールだけではなくチャット)  
- サークルの直近の活動予定日を知る機能(予定を書き込めるカレンダーを設置)  
- サークルの方針やレベル感を知る機能(レベルの指標を儲け、絞り込める)  
  
以上のことからバドミントンに特化したサークル検索アプリの制作に着手しました。

# DEMO
## トップページ
<img src="https://gyazo.com/d055a43da5f1541829d5b21bdc863be7">
ペルソナは20〜30歳代に設定しているため、シンプルでモダンなデザインを意識しました。

## サークル詳細画面


[![Image from Gyazo](https://i.gyazo.com/f5087da847751b43f243595fd7d66bf3.gif)](https://gyazo.com/f5087da847751b43f243595fd7d66bf3)
検索機能(gif)
リアルタイムチャット機能(gif)
カレンダー機能(gif)



## 機能一覧
- ユーザー登録、ログイン機能(devise)  
- サークル投稿機能  
  ○画像複数投稿機能(ActiveStorage)  
- いいね機能(Ajax)  
- リアルタイムチャット機能(ActionCable)  
- ページネーション(kaminari)  
- 検索機能(ransack)  
- カレンダー機能(FullCalendar)  

# 工夫したポイント
- 既存のサークル検索webサイトにはない、活動日から検索することができるようにした点。  
- サークル運営者に対して気軽に質問や相談ができるよう、問い合わせ方法を2つ(チャット、メール)用意してある点。  

# 使用技術

## バックエンド
Ruby, Ruby on Rails
## フロントエンド
HTML, CSS, JavaScript, jQuery, Vue.js, Ajax

## データベース(開発環境)
MySQL, SequelPro
## データベース(本番環境)
RDS for MySQL

## アプリケーションサーバ(開発環境)
Puma
## アプリケーションサーバ(本番環境)
Unicorn

## インフラ
Docker\Docker-compose(開発環境)  
AWS(EC2, ElastiCache(Redis), ALB, S3), Capistrano

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec

## エディタ
VSCode


# 課題や今後実装したい機能
- 本番環境におけるDocker環境の構築  
- テストコードの充実  
- CircleCI/CD  
- 通知機能(新規チャットがある場合)  


# DB設計
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