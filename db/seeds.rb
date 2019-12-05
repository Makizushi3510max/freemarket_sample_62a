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


CSV.foreach("db/csv/brands.csv") do |row_brand|
  brand = Brand.create(name: row_brand[0])
end
