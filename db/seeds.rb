# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
watch = Watch.new(model: 'SUPER CHRONOMAT B01 44', price: 100)
watch.photo.attach(io: File.open("v1621333373/161940-9001_1_h1klcc.jpg"), filename: '161940-9001_1_h1klcc.jpg', content_type: 'image/jpg')
watch.save

# Watch.create(model: 'CHRONOMAT B01 42', price: 100)
# Watch.create(model: 'MOONWATCH', price: 100)
puts 'finish'
# Watch.create(model: 'PHASES DE LUNE', price: 100, photos: [''])
# Watch.create(model: 'SPEEDMASTER', price: 100, photos: [''])
# Watch.create(model: 'SEAMASTER', price: 100, photos: [''])
# Watch.create(model: 'TRÉSOR 40 MM', price: 100, photos: [''])
# Watch.create(model: 'DATEJUST 36', price: 100, photos: [''])
# Watch.create(model: 'Cosmograph Daytona', price: 100, photos: [''])
# Watch.create(model: 'Cosmograph Daytona2', price: 100, photos: [''])
