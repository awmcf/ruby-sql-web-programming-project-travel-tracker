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

end
