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








badsearch(仮)
〜さぁ　羽を追いかけよう〜

特徴機能を文字る


概要

○ペルソナ(ターゲットとなるユーザー)
サークル運営者
・サークルメンバーを増やして色んな人と打ちたい(サークル側)
・日によって人員の埋め合わせがしたい

社会人(20~30代)
働き盛りで土日休みの人もいれば不定休の人もいる
ゲスト
・バドミントンを始めたい人(ダイエットや健康増進)
・経験者(リフレッシュ)
○背景
・新しい事にチャレンジしたい
・環境の変化(ライフイベント、転勤、引っ越し)
・自身の変化(太ってしまった)


課題
・気軽に近くにいるバドミントンサークル(スクール)を知りたい
・引越し先の地域にサークルがあるか知りたい
・複数のサークルを渡り歩いて色んな人と打ちたい
・都合の良い日に開放しているサークルを探し、参加したい
・サークルについて以下のような詳細情報を知りたい
　　経験者の有無、初心者：経験者の比率
　　男女比
　　活動拠点
　　活動曜日、頻度
　　試合メイン？練習メイン？
　　大会実績
　　参加料金
　　メンバーを募集しているか否か
　　直近の活動予定日
・活気があるのか知りたい
・人気なサークルなのか知りたい
・サークル運営者へ質問したい
・参加の相談をしたい


課題解決
全国のサークルを検索できる
詳細ページでサークルの詳細を確認できる
お気に入り(いいね)機能の導入多いと人気であることがわかる。
閲覧された回数がわかる



機能
サークル新規追加機能
Club
:name
:status_id
:since
:prefecture_id
:city
:gym
:gender_ratio
:bigginer_ratio
:age_range
:purpose
:homepage
:text


:created_at
:updated_at
watched
watched_week
favorite




サークル一覧表示機能(メンバー募集していないサークル・スクールは非表示)
サークル詳細表示機能
サークル詳細編集機能
サークル削除機能

サークル検索機能　絞り込み

ユーザー管理機能(devise)
User
:nickname
:gender
:career
:prefecture
:city
:profile

チャット機能orメールへの簡単アクセス機能
お気に入り(いいね!)機能
閲覧回数の表示機能


カレンダー機能
日付を指定して、参加できるサークルを検索できる機能
その日が解放されているのか



View
トップページ
さぁ羽を追いかけよう
Form
・都道府県・市町村






ログインしているサークル運営者とビジターはチャットができる
















よこすの意見
・男女比→女子のみを募集している
男子女子で絞りこみ
・経験者のレベルをイメージしやすい
基礎打ちができる、試合ができる
初心者→
中級者→
・メッセージ機能
ワンタッチでメールが多い
メールでのコンタクトがめんどくさい
コンタクトが容易すぎると民度が低くなるのではないか




・Clubs
サークル名
募集状況
創設時期(年)
創設時期(月)
都道府県
市区町村
使用体育館
✅主な活動時間
✅参加費
人数
年齢層
男女比
初心者比率
サークル目的
ホームページ


・募集しているメンバー像(ネスト)
性別　チェックボックス　単一
 男性のみ 
 女性のみ
 どちらも

経験者(レベルで細分化)　チェックボックス 複数可
 Lv.1　経験なし
 Lv.2　基礎打ちができる
 Lv.3　試合ができる
 Lv.4　素早いラリーができる
 Lv.5　大会で実績がある

年齢　チェックボックス　複数可
 10代
 20代
 30代
 40代
 50代
 60代
 制限なし




ユーザー登録の情報
地域を
複数のサークルへ訪問する


カレンダー機能
日付を指定して、参加できるサークルを検索できる機能
その日が解放されているのか



ビジターに制限をかけているが。



ビジター
日にちを指定
参加目安がわかる


・課題
運営する側が日によって人員の埋め合わせがしたい
多そうだから
