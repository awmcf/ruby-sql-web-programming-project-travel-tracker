require_relative('../db/sql_runner')

class City

  attr_accessor :name, :visited, :country_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @visited = options['visited']
    @country_id = options['country_id'].to_i
  end

  def save()
    sql = "INSERT INTO cities (
    name,
    visited,
    country_id )
    VALUES
    ( $1, $2, $3 )
    RETURNING id"
    values = [@name, @visited, @country_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE cities SET (name, visited, country_id) = ($1, $2, $3) WHERE id = ($4)"
    values = [@name, @visited, @country_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM cities WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(city_data)
    return city_data.map { |city| City.new(city) }
  end

  def self.all()
    sql = "SELECT * FROM cities"
    city_data = SqlRunner.run(sql)
    cities = map_items(city_data)
    return cities
  end

  def self.find(id)
    sql = "SELECT * FROM cities
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    city = City.new(result)
    return city
  end

  def country()
    country = Country.find(@country_id)
    return country
  end

  def format_name
    return "#{@name.capitalize}"
  end

end
