require 'csv'

file_path = 'lib/全国自治体一覧.csv'
csv_data = CSV.read(file_path)

prefectures_list = csv_data.map { |row| row[1] }.uniq

cities_list = csv_data.map do |row|
    next if row[2] == nil
    row[1, 2]
  end.compact

prefectures_list.each do |prefecture|
  Prefecture.create!(name: prefecture)
end

cities_list.each do |prefecture, city|
  prefecture = Prefecture.find_by(name: prefecture)
  prefecture.cities.create(name: city)
end

levels = Level.create!(
  [
    { name: 'Level1' },
    { name: 'Level2' },
    { name: 'Level3' },
    { name: 'Level4' },
    { name: 'Level5' }
  ]
)

ages = Age.create!(
  [
    { name: '10代' },
    { name: '20代' },
    { name: '30代' },
    { name: '40代' },
    { name: '50代' },
    { name: '60代' }
  ]
)


users = User.create!(
  [
    { nickname: 'test1', email: 'test1@gmail.com', encrypted_password: 'aaa111', prefecture_id: 1 },
    { nickname: 'test2', email: 'test2@gmail.com', encrypted_password: 'aaa112', prefecture_id: 2 },
    { nickname: 'test3', email: 'test3@gmail.com', encrypted_password: 'aaa113', prefecture_id: 3 },
    { nickname: 'test4', email: 'test4@gmail.com', encrypted_password: 'aaa114', prefecture_id: 4 },
    { nickname: 'test5', email: 'test5@gmail.com', encrypted_password: 'aaa115', prefecture_id: 5 },
    { nickname: 'test6', email: 'test6@gmail.com', encrypted_password: 'aaa116', prefecture_id: 6 },
    { nickname: 'test7', email: 'test7@gmail.com', encrypted_password: 'aaa117', prefecture_id: 7 },
    { nickname: 'test8', email: 'test8@gmail.com', encrypted_password: 'aaa118', prefecture_id: 8 },
    { nickname: 'test9', email: 'test9@gmail.com', encrypted_password: 'aaa119', prefecture_id: 9 },
    { nickname: 'test10', email: 'test10@gmail.com', encrypted_password: 'aaa1110', prefecture_id: 10 },
    { nickname: 'test11', email: 'test11@gmail.com', encrypted_password: 'aaa1111', prefecture_id: 11 },
    { nickname: 'test12', email: 'test12@gmail.com', encrypted_password: 'aaa1112', prefecture_id: 12 },
    { nickname: 'test13', email: 'test13@gmail.com', encrypted_password: 'aaa1113', prefecture_id: 13 },
    { nickname: 'test14', email: 'test14@gmail.com', encrypted_password: 'aaa1114', prefecture_id: 14 },
    { nickname: 'test15', email: 'test15@gmail.com', encrypted_password: 'aaa1115', prefecture_id: 15 },
    { nickname: 'test16', email: 'test16@gmail.com', encrypted_password: 'aaa1116', prefecture_id: 16 },
    { nickname: 'test17', email: 'test17@gmail.com', encrypted_password: 'aaa1117', prefecture_id: 17 },
    { nickname: 'test18', email: 'test18@gmail.com', encrypted_password: 'aaa1118', prefecture_id: 18 },
    { nickname: 'test19', email: 'test19@gmail.com', encrypted_password: 'aaa1119', prefecture_id: 19 },
    { nickname: 'test20', email: 'test20@gmail.com', encrypted_password: 'aaa1120', prefecture_id: 20 }
  ]
)


clubs = Club.create!(
  [
    { name: 'テストサークル1', status_id: 1, since_year: 2015, since_month: 1, prefecture: 1, city: 1, gym: 'test1体育館', action_time: '月19時〜22時', fee: '100円', persons: '10名程度', age_range: '20〜30歳代', gender_ratio: '1:1', beginner_ratio: '2:1', purpose: '市の大会で優勝すること', email: 'test1@gmail.com', information: '初心者大歓迎です', user_id: 1 },
    { name: 'テストサークル2', status_id: 1, since_year: 2016, since_month: 2, prefecture: 1, city: 1, gym: 'test2体育館', action_time: '火19時〜22時', fee: '100円', persons: '10名程度', age_range: '20〜40歳代', gender_ratio: '1:2', beginner_ratio: '3:1', purpose: '市の大会で優勝すること', email: 'test2@gmail.com', information: '初心者大歓迎です', user_id: 2 },
    { name: 'テストサークル3', status_id: 2, since_year: 2017, since_month: 3, prefecture: 1, city: 1, gym: 'test3体育館', action_time: '水19時〜22時', fee: '100円', persons: '10名程度', age_range: '20〜40歳代', gender_ratio: '2:1', beginner_ratio: '2:1', purpose: '市の大会で優勝すること', email: 'test3@gmail.com', information: '初心者大歓迎です', user_id: 3 },
    { name: 'テストサークル4', status_id: 1, since_year: 2018, since_month: 4, prefecture: 1, city: 1, gym: 'test4体育館', action_time: '木19時〜22時', fee: '100円', persons: '10名程度', age_range: '20〜40歳代', gender_ratio: '1:1', beginner_ratio: '3:1', purpose: '市の大会で優勝すること', email: 'test4@gmail.com', information: '初心者大歓迎です', user_id: 4 },
    { name: 'テストサークル5', status_id: 1, since_year: 2011, since_month: 5, prefecture: 1, city: 1, gym: 'test5体育館', action_time: '金19時〜22時', fee: '100円', persons: '10名程度', age_range: '20〜40歳代', gender_ratio: '2:1', beginner_ratio: '4:1', purpose: '市の大会で優勝すること', email: 'test5@gmail.com', information: '初心者大歓迎です', user_id: 5 },
    { name: 'テストサークル6', status_id: 2, since_year: 2012, since_month: 6, prefecture: 1, city: 1, gym: 'test6体育館', action_time: '月18時〜22時', fee: '100円', persons: '10名程度', age_range: '20〜30歳代', gender_ratio: '1:1', beginner_ratio: '2:1', purpose: '市の大会で優勝すること', email: 'test6@gmail.com', information: '初心者大歓迎です', user_id: 6 },
    { name: 'テストサークル7', status_id: 1, since_year: 2013, since_month: 7, prefecture: 1, city: 1, gym: 'test7体育館', action_time: '火18時〜22時', fee: '100円', persons: '10名程度', age_range: '20〜40歳代', gender_ratio: '1:2', beginner_ratio: '2:1', purpose: '市の大会で優勝すること', email: 'test7@gmail.com', information: '初心者大歓迎です', user_id: 7 },
    { name: 'テストサークル8', status_id: 1, since_year: 2014, since_month: 8, prefecture: 1, city: 1, gym: 'test8体育館', action_time: '水18時〜22時', fee: '100円', persons: '10名程度', age_range: '20〜30歳代', gender_ratio: '1:1', beginner_ratio: '1:1', purpose: '市の大会で優勝すること', email: 'test8@gmail.com', information: '初心者大歓迎です', user_id: 8 },
    { name: 'テストサークル9', status_id: 2, since_year: 2015, since_month: 9, prefecture: 1, city: 1, gym: 'test9体育館', action_time: '木18時〜22時', fee: '100円', persons: '10名程度', age_range: '20〜40歳代', gender_ratio: '2:1', beginner_ratio: '2:1', purpose: '市の大会で優勝すること', email: 'test9@gmail.com', information: '初心者大歓迎です', user_id: 9 },
    { name: 'テストサークル10', status_id: 1, since_year: 2009, since_month: 10, prefecture: 1, city: 1, gym: 'test10体育館', action_time: '金18時〜22時', fee: '100円', persons: '10名程度', age_range: '20〜30歳代', gender_ratio: '1:1', beginner_ratio: '1:1', purpose: '市の大会で優勝すること', email: 'test10@gmail.com', information: '初心者大歓迎です', user_id: 10 },
    { name: 'テストサークル11', status_id: 1, since_year: 2010, since_month: 11, prefecture: 1, city: 1, gym: 'test11体育館', action_time: '月17時〜20時', fee: '100円', persons: '10名程度', age_range: '20〜40歳代', gender_ratio: '2:1', beginner_ratio: '2:1', purpose: '市の大会で優勝すること', email: 'test11@gmail.com', information: '初心者大歓迎です', user_id: 11 },
    { name: 'テストサークル12', status_id: 2, since_year: 2011, since_month: 12, prefecture: 1, city: 1, gym: 'test12体育館', action_time: '火17時〜20時', fee: '100円', persons: '10名程度', age_range: '20〜30歳代', gender_ratio: '1:1', beginner_ratio: '3:1', purpose: '市の大会で優勝すること', email: 'test12@gmail.com', information: '初心者大歓迎です', user_id: 12 },
    { name: 'テストサークル13', status_id: 1, since_year: 2008, since_month: 1, prefecture: 1, city: 1, gym: 'test13体育館', action_time: '水17時〜20時', fee: '100円', persons: '10名程度', age_range: '20〜40歳代', gender_ratio: '1:2', beginner_ratio: '2:1', purpose: '市の大会で優勝すること', email: 'test13@gmail.com', information: '初心者大歓迎です', user_id: 13 },
    { name: 'テストサークル14', status_id: 1, since_year: 2015, since_month: 2, prefecture: 1, city: 1, gym: 'test14体育館', action_time: '木17時〜20時', fee: '100円', persons: '10名程度', age_range: '20〜30歳代', gender_ratio: '1:1', beginner_ratio: '2:1', purpose: '市の大会で優勝すること', email: 'test14@gmail.com', information: '初心者大歓迎です', user_id: 14 },
    { name: 'テストサークル15', status_id: 1, since_year: 2016, since_month: 3, prefecture: 1, city: 1, gym: 'test15体育館', action_time: '金17時〜20時', fee: '100円', persons: '10名程度', age_range: '20〜30歳代', gender_ratio: '1:2', beginner_ratio: '4:1', purpose: '市の大会で優勝すること', email: 'test15@gmail.com', information: '初心者大歓迎です', user_id: 15 },
    { name: 'テストサークル16', status_id: 1, since_year: 2017, since_month: 4, prefecture: 1, city: 1, gym: 'test16体育館', action_time: '月16時〜22時', fee: '100円', persons: '10名程度', age_range: '20〜40歳代', gender_ratio: '3:1', beginner_ratio: '2:1', purpose: '市の大会で優勝すること', email: 'test16@gmail.com', information: '初心者大歓迎です', user_id: 16 },
    { name: 'テストサークル17', status_id: 1, since_year: 2018, since_month: 5, prefecture: 1, city: 1, gym: 'test17体育館', action_time: '火16時〜19時', fee: '100円', persons: '10名程度', age_range: '20〜30歳代', gender_ratio: '1:1', beginner_ratio: '3:1', purpose: '市の大会で優勝すること', email: 'test17@gmail.com', information: '初心者大歓迎です', user_id: 17 },
    { name: 'テストサークル18', status_id: 2, since_year: 2019, since_month: 6, prefecture: 1, city: 1, gym: 'test18体育館', action_time: '水16時〜19時', fee: '100円', persons: '10名程度', age_range: '20〜40歳代', gender_ratio: '3:1', beginner_ratio: '3:1', purpose: '市の大会で優勝すること', email: 'test18@gmail.com', information: '初心者大歓迎です', user_id: 18 },
    { name: 'テストサークル19', status_id: 1, since_year: 2020, since_month: 7, prefecture: 1, city: 1, gym: 'test19体育館', action_time: '木16時〜19時', fee: '100円', persons: '10名程度', age_range: '20〜30歳代', gender_ratio: '1:1', beginner_ratio: '2:1', purpose: '市の大会で優勝すること', email: 'test19@gmail.com', information: '初心者大歓迎です', user_id: 19 },
    { name: 'テストサークル20', status_id: 1, since_year: 2021, since_month: 8, prefecture: 1, city: 1, gym: 'test20体育館', action_time: '金16時〜19時', fee: '100円', persons: '10名程度', age_range: '20〜40歳代', gender_ratio: '3:1', beginner_ratio: '2:1', purpose: '市の大会で優勝すること', email: 'test20@gmail.com', information: '初心者大歓迎です', user_id: 20 }
  ]
)