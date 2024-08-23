# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

ActiveRecord::Base.transaction do
  # データ削除
  Evaluation.destroy_all
  Category.destroy_all
  User.destroy_all
  Organization.destroy_all

  # 組織の作成
  organization1 = Organization.create!(name: "zk360")
  organization2 = Organization.create!(name: "zk361")

  # ユーザーの作成
  User.create!([
    { name: "Alice", email: "alice@example.com", password: "password", organization: organization1 },
    { name: "Bob", email: "bob@example.com", password: "password", organization: organization1, role: 1 },
    { name: "Charlie", email: "charlie@example.com", password: "password", organization: organization2 }
  ])

  # カテゴリの作成
  Category.create!([
    { name: "Category A", description: "Description for Category A", organization: organization1 },
    { name: "Category B", description: "Description for Category B", organization: organization1 },
    { name: "Category C", description: "Description for Category C", organization: organization2 }
  ])
end

puts "Seed data created successfully!"
