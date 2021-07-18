# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@admin.com',
   password: 'adminadmin'
)

Customer.create!(
   last_name: '田中',
   first_name: '太郎',
   last_name_kana: 'タナカ',
   first_name_kana: 'タロウ',
   email: 'tanakadmmwc202106@tanaka.com',
   postcode: '1066108',
   address: '東京都港区六本木６丁目１０−１',
   phone_number: '1234567890',
   password: '3edc6yhn'
)