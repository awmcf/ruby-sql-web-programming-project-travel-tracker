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

end
