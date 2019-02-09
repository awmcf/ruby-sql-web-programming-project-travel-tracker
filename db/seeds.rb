require_relative('../models/city')
require_relative('../models/country')

country_1 = Country.new({'name' => 'england'})
country_2 = Country.new({'name' => 'france'})
country_3 = Country.new({'name' => 'germany'})
country_4 = Country.new({'name' => 'south korea'})


country_1.save()
country_2.save()
country_3.save()
country_4.save()

city_1 = City.new({
  'name' => 'london',
  'visited' => true,
  'country_id' => country_1.id })
city_2 = City.new({
  'name' => 'paris',
  'visited' => true,
  'country_id' => country_2.id })
city_3 = City.new({
  'name' => 'germany',
  'visited' => true,
  'country_id' => country_3.id })
city_4 = City.new({
  'name' => 'seoul',
  'visited' => false,
  'country_id' => country_4.id })


city_1.save
city_2.save
city_3.save
city_4.save
