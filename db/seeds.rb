require "csv"

#ユーザー生成

User.create(nickname:         "てすと",
            password:         "1234abcd",
            email:            "test@test.com",
            date_of_birth:    "1996-11-20",
            last_name:        "てすと",
            first_name:       "たろう",
            last_name_kana:   "テスト",
            first_name_kana:  "タロウ",
            phone_number:     "12312341234"
)



root_categories = Array.new

i = 0
CSV.foreach("db/csv/root_categories.csv") do |row_root|
  root_category = Category.create(name: row_root[0])
  j = 0
  CSV.foreach("db/csv/child_categories/#{i}.csv") do |row_child|
    child_category = root_category.children.create(name: row_child[0])
    k = 0
    CSV.foreach("db/csv/grandchild_categories/#{i}-#{j}.csv") do |row_grandchild|
      grandchild_category = child_category.children.create(name: row_grandchild[0])
      k += 1
    end
    j += 1
  end
  i += 1
end



# #カテゴリー生成

# #レディースブロック

# #レディースの子カテゴリー配列
# lady_child_array = ['トップス','ジャケット/アウター','パンツ','スカート','ワンピース','靴','ルームウェア/パジャマ','レッグウェア','帽子','バッグ','アクセサリー','ヘアアクセサリー','小物','時計','ウィッグ/エクステ','浴衣/水着','スーツ/フォーマル/ドレス','マタニティ','その他']
# #レディースの孫カテゴリー配列
# lady_grandchild_array = [['すべて','Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ/ブラウス(半袖/袖なし)','シャツ/ブラウス(七分/長袖)','ポロシャツ','キャミソール','タンクトップ','ホルターネック','ニット/セーター','チュニック','カーディガン/ボレロ','アンサンブル','ベスト/ジレ','パーカー','トレーナー/スウェット','ベアトップ/チューブトップ','ジャージ','その他'], ['すべて','テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ダウンベスト','ジャンパー/ブルゾン','ポンチョ','ロングコート','トレンチコート','ダッフルコート','ピーコート','チェスターコート','モッズコート','スタジャン','毛皮/ファーコート','スプリングコート','スカジャン','その他'], ['すべて','デニム/ジーンズ','ショートパンツ','カジュアルパンツ','ハーフパンツ','チノパン','ワークパンツ/カーゴパンツ','クロップドパンツ','サロペット/オーバーオール','オールインワン','サルエルパンツ','ガウチョパンツ','その他'], ['すべて','ミニスカート','ひざ丈スカート','ロングスカート','キュロット','その他'], ['すべて','ミニワンピース','ひざ丈ワンピース','ロングワンピース','その他'], ['すべて','ハイヒール/パンプス','ブーツ','サンダル','スニーカー','ミュール','モカシン','ローファー/革靴','フラットシューズ/バレエシューズ','長靴/レインシューズ','その他'], ['すべて','パジャマ','ルームウェア'], ['すべて','ソックス','スパッツ/レギンス','ストッキング/タイツ','レッグウォーマー','その他'], ['すべて','ニットキャップ/ビーニー','ハット','ハンチング/ベレー帽','キャップ','キャスケット','麦わら帽子','その他'], ['すべて','ハンドバッグ','トートバッグ','エコバッグ','リュック/バックパック','ボストンバッグ','スポーツバッグ','ショルダーバッグ','クラッチバッグ','ポーチ/バニティ','ボディバッグ/ウェストバッグ','マザーズバッグ','メッセンジャーバッグ','ビジネスバッグ','旅行用バッグ/キャリーバッグ','ショップ袋','和装用バッグ','かごバッグ','その他'], ['すべて','ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','イヤリング','アンクレット','ブローチ/コサージュ','チャーム','その他'], ['すべて','ヘアゴム/シュシュ','ヘアバンド/カチューシャ','ヘアピン','その他'], ['すべて','長財布','折り財布','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','手袋/アームカバー','ハンカチ','ベルト','マフラー/ショール','ストール/スヌード','バンダナ/スカーフ','ネックウォーマー','サスペンダー','サングラス/メガネ','モバイルケース/カバー','手帳','イヤマフラー','傘','レインコート/ポンチョ','ミラー','タバコグッズ','その他'], ['すべて','腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他'], ['すべて','前髪ウィッグ','ロングストレート','ロングカール','ショートストレート','ショートカール','その他'], ['すべて','浴衣','着物','振袖','長襦袢/半襦袢','水着セパレート','水着ワンピース','水着スポーツ用','その他'], ['すべて','スカートスーツ上下','パンツスーツ上下','ドレス','パーティーバッグ','シューズ','ウェディング','その他'], ['すべて','トップス','アウター','インナー','ワンピース','パンツ/スパッツ','スカート','パジャマ','授乳服','その他'], ['すべて','コスプレ','下着','その他']]

# parent = Category.create(name: 'レディース')
# lady_child_array.each_with_index do |child, i|
#  child = parent.children.create(name: child)
#  lady_grandchild_array[i].each do |grandchild|
#    child.children.create(name: grandchild)
#  end
# end

# #メンズブロック

# #メンズの子カテゴリー配列
# mens_child_array = ['トップス','ジャケット/アウター','パンツ','靴','バッグ','スーツ','帽子','アクセサリー','小物','時計','水着','レッグウェア','アンダーウェア','その他',]
# #メンズの孫カテゴリー配列
# mens_grandchild_array = [['すべて','Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ','ポロシャツ','タンクトップ','ニット/セーター','パーカー','カーディガン','スウェット','ジャージ','ベスト','その他'], ['すべて','テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ナイロンジャケット','フライトジャケット','ダッフルコート','ピーコート','ステンカラーコート','トレンチコート','モッズコート','チェスターコート','スタジャン','スカジャン','ブルゾン','マウンテンパーカー','ダウンベスト','ポンチョ','カバーオール','その他'], ['すべて','デニム/ジーンズ','ワークパンツ/カーゴパンツ','スラックス','チノパン','ショートパンツ','ペインターパンツ','サルエルパンツ','オーバーオール','その他'], ['すべて','スニーカー','サンダル','ブーツ','モカシン','ドレス/ビジネス','長靴/レインシューズ','デッキシューズ','その他'], ['すべて','ショルダーバッグ','トートバッグ','ボストンバッグ','リュック/バックパック','ウエストポーチ','ボディーバッグ','ドラムバッグ','ビジネスバッグ','トラベルバッグ','メッセンジャーバッグ','エコバッグ','その他'], ['すべて','スーツジャケット','スーツベスト','スラックス','セットアップ','その他'], ['すべて','キャップ','ハット','ニットキャップ/ビーニー','ハンチング/ベレー帽','キャスケット','サンバイザー','その他'], ['すべて','ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','アンクレット','その他'], ['すべて','長財布','折り財布','マネークリップ','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','ネクタイ','手袋','ハンカチ','ベルト','マフラー','ストール','バンダナ','ネックウォーマー','サスペンダー','ウォレットチェーン','サングラス/メガネ','モバイルケース/カバー','手帳','ストラップ','ネクタイピン','カフリンクス','イヤマフラー','傘','レインコート','ミラー','タバコグッズ','その他'], ['すべて','腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他'], ['すべて','一般水着','スポーツ用','アクセサリー','その他'], ['すべて','ソックス','レギンス/スパッツ','レッグウォーマー','その他'], ['すべて','トランクス','ボクサーパンツ','その他'], ['すべて']]

# parent = Category.create(name: 'メンズ')
# mens_child_array.each.each_with_index do |child, i|
#  child = parent.children.create(name: child)
#  mens_grandchild_array[i].each do |grandchild|
#    child.children.create(name: grandchild)
#  end
# end

# #ベビー・キッズブロック

# #ベビー・キッズの子カテゴリー配列
# kids_child_array = ['ベビー服（女の子用）〜９５cm','ベビー服（男の子用）〜９５cm','ベビー服（男女兼用）〜９５cm','キッズ服（女の子用）１００cm〜','キッズ服（男の子用）１００cm〜','キッズ服（男女兼用）１００cm〜','キッズ靴','子ども用ファッション小物','おむつ/トイレ/バス','外出/移動用品','授乳/食事','ベビー家具/寝具/室内用品','おもちゃ','行事/記念品',]
# # ベビー・キッズの孫カテゴリー配列
# kids_grandchild_array = [['すべて','トップス','アウター','パンツ','スカート','ワンピース','ベビードレス','おくるみ','下着/肌着','パジャマ','ロンパース','その他'], ['すべて','トップス','アウター','パンツ','おくるみ','下着/肌着','パジャマ','ロンパース','その他'], ['すべて','トップス','アウター','パンツ','おくるみ','下着/肌着','パジャマ','ロンパース','その他'], ['すべて','コート','ジャケット/上着','トップス（Tシャツ/カットソー）','トップス（トレーナー）','トップス（チュニック）','トップス（タンクトップ）','トップス（その他）','スカート','パンツ','ワンピース','セットアップ','パジャマ','フォーマル/ドレス','和服'], ['すべて','コート','ジャケット/上着','トップス（Tシャツ/カットソー）','トップス（トレーナー）','トップス（その他）','パンツ','セットアップ','パジャマ','フォーマル/ドレス','和服','浴衣','甚平','水着','その他'], ['すべて','コート','ジャケット/上着','トップス（Tシャツ/カットソー）','トップス（トレーナー）','トップス（その他）','ボトムズ','パジャマ','その他'], ['すべて','スニーカー','サンダル','ブーツ','長靴','その他'], ['すべて','靴下/スパッツ','帽子','エプロン','サスペンダー','タイツ','ハンカチ','バンダナ','ベルト','マフラー','傘','手袋','スタイ','バック','その他'], ['すべて','おむつ用品','おまる/補助便座','トレーニングパンツ','お風呂用品','その他'], ['すべて','ベビーカー','抱っこひも/スリング','チャイルドシート','その他'], ['すべて','ミルク','ベビーフード','ベビー用食器','その他'], ['すべて','ベット','布団/毛布','イス','たんす','その他'], ['すべて','おふろのおもちゃ','がらがら','オルゴール','ベビーシム','手押し車/カタカタ','智育玩具','その他'], ['すべて','お宮参り用品','お食い始め用品','アルバム','手形/足形','その他']]

# parent = Category.create(name: 'ベビー・キッズ')
# kids_child_array.each.each_with_index do |child, i|
#   child = parent.children.create(name: child)
#   kids_grandchild_array[i].each do |grandchild|
#     child.children.create(name: grandchild)
#   end
# end

# #インテリア・住まい・小物ブロック

# #インテリア・住まい・小物の子カテゴリー配列
# interiors_child_array = ['キッチン/食器']
# #インテリア・住まい・小物の孫カテゴリー配列
# interiors_grandchild_array = ['すべて','食器']

# parent = Category.create(name: 'インテリア・住まい・小物')
# interiors_child_array.each.each_with_index do |child, i|
#   child = parent.children.create(name: child)
#   kids_grandchild_array[i].each do |grandchild|
#     child.children.create(name: grandchild)
#   end
# end

# #本・音楽・ゲームブロック

# #本・音楽・ゲームの子カテゴリー配列
# books_child_array = ['本']
# #本・音楽・ゲームの孫カテゴリー配列
# books_grandchild_array = ['すべて','文学/小説']

# parent = Category.create(name: '本・音楽・ゲーム')
# books_child_array.each.each_with_index do |child, i|
#   child = parent.children.create(name: child)
#   kids_grandchild_array[i].each do |grandchild|
#     child.children.create(name: grandchild)
#   end
# end

# #おもちゃ・ホビー・グッズブロック

# #おもちゃ・ホビー・グッズの子カテゴリー配列
# toys_child_array = ['おもちゃ']
# #おもちゃ・ホビー・グッズの孫カテゴリー配列
# toys_grandchild_array = ['すべて','キャラクターグッズ']

# parent = Category.create(name: 'おもちゃ・ホビー・グッズ')
# toys_child_array.each.each_with_index do |child, i|
#   child = parent.children.create(name: child)
#   kids_grandchild_array[i].each do |grandchild|
#     child.children.create(name: grandchild)
#   end
# end

# #コスメ・香水・美容ブロック

# #コスメ・香水・美容の子カテゴリー配列
# cosmetics_child_array = ['ベースメイク']
# #コスメ・香水・美容の孫カテゴリー配列
# cosmetics_grandchild_array = ['すべて','ファンデーション']

# parent = Category.create(name: 'コスメ・香水・美容')
# cosmetics_child_array.each.each_with_index do |child, i|
#   child = parent.children.create(name: child)
#   kids_grandchild_array[i].each do |grandchild|
#     child.children.create(name: grandchild)
#   end
# end

# #家電・スマホ・カメラブロック

# #家電・スマホ・カメラの子カテゴリー配列
# smartphones_child_array = ['スマートフォン/携帯電話']
# #家電・スマホ・カメラの孫カテゴリー配列
# smartphones_grandchild_array = ['すべて','スマートフォン本体']

# parent = Category.create(name: '家電・スマホ・カメラ')
# smartphones_child_array.each.each_with_index do |child, i|
#   child = parent.children.create(name: child)
#   kids_grandchild_array[i].each do |grandchild|
#     child.children.create(name: grandchild)
#   end
# end

# #スポーツ・レジャーブロック

# #スポーツ・レジャーの子カテゴリー配列
# sports_child_array = ['ゴルフ']
# #スポーツ・レジャーの孫カテゴリー配列
# sports_grandchild_array = ['すべて','クラブ']

# parent = Category.create(name: 'スポーツ・レジャー')
# sports_child_array.each.each_with_index do |child, i|
#   child = parent.children.create(name: child)
#   kids_grandchild_array[i].each do |grandchild|
#     child.children.create(name: grandchild)
#   end
# end

# #ハンドメイドブロック

# #ハンドメイドの子カテゴリー配列
# handmades_child_array = ['アクセサリー（女性用）']
# #ハンドメイドの孫カテゴリー配列
# handmades_grandchild_array = ['すべて','ピアス']

# parent = Category.create(name: 'ハンドメイド')
# handmades_child_array.each.each_with_index do |child, i|
#   child = parent.children.create(name: child)
#   kids_grandchild_array[i].each do |grandchild|
#     child.children.create(name: grandchild)
#   end
# end

# #チケットブロック

# #チケットの子カテゴリー配列
# tickets_child_array = ['音楽']
# #チケットの孫カテゴリー配列
# tickets_grandchild_array = ['すべて','男性アイドル']

# parent = Category.create(name: 'チケット')
# tickets_child_array.each.each_with_index do |child, i|
#   child = parent.children.create(name: child)
#   kids_grandchild_array[i].each do |grandchild|
#     child.children.create(name: grandchild)
#   end
# end

# #自動車・オートバイブロック

# #自動車・オートバイの子カテゴリー配列
# cars_child_array = ['自動車本体']
# #自動車・オートバイの孫カテゴリー配列
# cars_grandchild_array = ['すべて','国内自動車本体']

# parent = Category.create(name: '自動車・オートバイ')
# cars_child_array.each.each_with_index do |child, i|
#   child = parent.children.create(name: child)
#   kids_grandchild_array[i].each do |grandchild|
#     child.children.create(name: grandchild)
#   end
# end

# #その他ブロック

# #その他の子カテゴリー配列
# other_child_array = ['まとめ売り','ペット用品','食品','飲料/酒','日用品/生活雑貨/旅行','アンティーク/コレクション','文房具/事務用品','事務/店舗用品','その他']
# #その他の孫カテゴリー配列
# other_grandchild_array = [['すべて'], ['すべて','ペットフード','犬用品','猫用品','魚用品/水草','小動物用品','爬虫類/両生類用品','かご/おり','鳥用品','虫類用品','その他'], ['すべて','菓子','米','野菜','果物','調味料','魚介類(加工食品)','肉類(加工食品)','その他 加工食品','その他'], ['すべて','コーヒー','ソフトドリンク','ミネラルウォーター','茶','ウイスキー','ワイン','ブランデー','焼酎','日本酒','ビール、発泡酒','その他'], ['すべて','タオル/バス用品','日用品/生活雑貨','洗剤/柔軟剤','旅行用品','防災関連グッズ','その他'], ['すべて','雑貨','工芸品','家具','印刷物','その他'], ['すべて','筆記具','ノート/メモ帳','テープ/マスキングテープ','カレンダー/スケジュール','アルバム/スクラップ','ファイル/バインダー','はさみ/カッター','カードホルダー/名刺管理','のり/ホッチキス','その他'], ['すべて','オフィス用品一般','オフィス家具','店舗用品','OA機器','ラッピング/包装','その他'], ['すべて']]

# parent = Category.create(name: 'その他')
# other_child_array.each.each_with_index do |child, i|
#  child = parent.children.create(name: child)
#  other_grandchild_array[i].each do |grandchild|
#    child.children.create(name: grandchild)
#  end
# end


# サイズを生成
# size_array = []