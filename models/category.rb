require_relative("../db/sql_runner.rb")
require("pry-byebug")

class Category
  attr_reader(:id, :type)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO categories
    (type)
    VALUES
    ($1)
    RETURNING id;"
    values = [@type]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE categories SET type = $1
    WHERE id = $2"
    values = [@type, @id]
    SqlRunner.run(sql, values)
  end

  def merchants()
    sql = "
      SELECT merchants.* FROM merchants
      INNER JOIN transactions t ON t.merchant_id = merchants.id
      WHERE t.category_id = $1;"
      values = [@id]
      results = SqlRunner.run(sql, values)
      return results.map { |merchant| Merchant.new(merchant) }
  end

  def total()
    sql = "
      SELECT SUM (amount) FROM transactions
      INNER JOIN categories ON categories.id = transactions.category_id
      WHERE categories.id = $1"
      values = [@id]
      result = SqlRunner.run(sql, values)[0]["sum"].to_f
      return result
  end

  def transactions()
    sql = "SELECT * FROM transactions WHERE transactions.category_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |transaction| Transaction.new(transaction)  }
  end

  def Category.find(id)
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Category.new(results.first())
  end

  def Category.all()
    sql = "SELECT * FROM categories"
    results = SqlRunner.run (sql)
    return results.map { |category| Category.new(category) }
  end

  def Category.delete_all()
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

end #full end
