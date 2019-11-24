
# 親カテゴリー
ladies = Category.create(name: "レディース")
mens = Category.create(name: "メンズ")

# 子カテゴリー
ladies_child1 = ladies.children.create(name: "トップス")
ladies_child2 = ladies.children.create(name: "ジャケット/アウター")
ladies_child3 = ladies.children.create(name: "パンツ")

mens_child1 = mens.children.create(name: "トップス")
mens_child2 = mens.children.create(name: "ジャケット/アウター")
mens_child3 = mens.children.create(name: "パンツ")

# 孫カテゴリー
ladies_grandchild1 = ladies_child1.children.create(name: "Tシャツ/カットソー(半袖/袖なし)")
ladies_grandchild2 = ladies_child1.children.create(name: "Tシャツ/カットソー(七分/長袖)")
ladies_grandchild3 = ladies_child1.children.create(name: "シャツ/ブラウス(半袖/袖なし)")

ladies_grandchild4 = ladies_child2.children.create(name: "テーラードジャケット")
ladies_grandchild5 = ladies_child2.children.create(name: "ノーカラージャケット")
ladies_grandchild6 = ladies_child2.children.create(name: "Gジャン/デニムジャケット")

ladies_grandchild7 = ladies_child3.children.create(name: "デニム/ジーンズ")
ladies_grandchild8 = ladies_child3.children.create(name: "ショートパンツ")
ladies_grandchild9 = ladies_child3.children.create(name: "カジュアルパンツ")


mens_grandchild1 = mens_child1.children.create(name: "Tシャツ/カットソー(半袖/袖なし)")
mens_grandchild2 = mens_child1.children.create(name: "Tシャツ/カットソー(七分/長袖)")
mens_grandchild3 = mens_child1.children.create(name: "シャツ")

mens_grandchild4 = mens_child2.children.create(name: "テーラードジャケット")
mens_grandchild5 = mens_child2.children.create(name: "ノーカラージャケット")
mens_grandchild6 = mens_child2.children.create(name: "Gジャン/デニムジャケット")

mens_grandchild7 = mens_child3.children.create(name: "デニム/ジーンズ")
mens_grandchild8 = mens_child3.children.create(name: "ワークパンツ/カーゴパンツ")
mens_grandchild9 = mens_child3.children.create(name: "スラックス")