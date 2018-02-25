require_relative("../db/sql_runner.rb")
require("pry-byebug")

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

  def merchants()
    sql = "
      SELECT merchants.* FROM merchants
      INNER JOIN transactions t ON t.merchant_id = merchants.id
      WHERE t.tag_id = $1;"
      values = [@id]
      results = SqlRunner.run(sql, values)
      return results.map { |merchant| Merchant.new(merchant) }
  end

  def total()
    sql = "
      SELECT SUM (amount) FROM transactions
      INNER JOIN tags ON tags.id = transactions.tag_id
      WHERE tags.id = $1"
      values = [@id]
      result = SqlRunner.run(sql, values)[0]["sum"].to_f
      return result
  end

  def transactions()
    sql = "SELECT amount FROM transactions WHERE transactions.tag_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |transaction| Transaction.new(transaction)  }
  end

  def Tag.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Tag.new(results.first())
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
