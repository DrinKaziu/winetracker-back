# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


page = 1

1763.times do
  winesHash = RestClient.get("https://lcboapi.com/products?access_key=MDoyMjUwNGE5NC04ODdkLTExZTgtOTBkZS1mYjA4MTFjODQwMmI6QVNxSmVLSXE3U1lWTU8zYXd2bTVJNkw2Q05EWEdsdXdBUnly&q=wine&per_page=5&page=#{page}")

  page += 1

  wine = JSON.parse(winesHash)

  Wine.create(
    :name => wine['result'][0]['name'],
    :primary_category => wine['result'][0]['primary_category'],
    :secondary_category => wine['result'][0]['secondary_category'],
    :origin => wine['result'][0]['origin'],
    :sugar_content => wine['result'][0]['sugar_content'],
    :producer_name => wine['result'][0]['producer_name'],
    :description => wine['result'][0]['description'],
    :serving_suggestions => wine['result'][0]['serving_suggestions'],
    :tasting_note => wine['result'][0]['tasting_note'],
    :image_thumb_url => wine['result'][0]['image_thumb_url'],
    :image_url => wine['result'][0]['image_url'],
    :varietal => wine['result'][0]['varietal'],
    :style => wine['result'][0]['style']
  )
end
