require_relative("../db/sql_runner.rb")

class Tag
  attr_reader(:id, :type)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO tags
    (type)
    VALUES
    ($1)
    RETURNING id;"
    values = [@type]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

end #full end
