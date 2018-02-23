require_relative("../db/sql_runner.rb")

class Tag
  attr_reader(:id, :type)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
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

  def update()
    sql = "UPDATE tags SET type = $1
    WHERE id = $2"
    values = [@type, @id]
    SqlRunner.run(sql, values)
  end

  def Tag.all()
    sql = "SELECT * FROM tags"
    results = SqlRunner.run (sql)
    return results.map { |tag| Tag.new(tag) }
  end

  def Tag.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

end #full end
