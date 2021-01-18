# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Image.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

image_01 = Image.create!(url: 'www.image1.com', name: 'Image 1', description: 'Dog running', category: 'Animals')
image_02 = Image.create!(url: 'www.image2.com', name: 'Image 2', description: 'Sleeping dog', category: 'Animals')
image_03 = Image.create!(url: 'www.image3.com', name: 'Image 3', description: 'Cat knocking things over', category: 'Animals')


print 'Seeding Successful!'