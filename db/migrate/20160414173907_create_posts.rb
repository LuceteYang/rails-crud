class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      # t.저장할 내용의 형태 "저장할 내용의 변수이름"
      
      t.string "title"
      t.string "content"
      
      # t.integer "view_count"
      # t.datetime "5월 5일"
      # t.float "height"
      
      t.timestamps null: false
    end
  end
end
