ladies = Category.create(name: "レディース")
ladies_child = ladies.children.create(name: "トップス")
ladies_grandchild = ladies_child.children.create(name: "Tシャツ/カットソー(半袖/袖なし)")