require_relative("../db/sql_runner.rb")

class Merchant
  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants
    (name)
    VALUES
    ($1)
    RETURNING id;"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def total()
    sql = "
      SELECT SUM (amount) FROM transactions
      INNER JOIN merchants ON merchants.id = transactions.merchant_id
      WHERE merchants.id = $1"
      values = [@id]
      result = SqlRunner.run(sql, values)[0]["sum"].to_f
      return result
  end

  def update()
    sql = "UPDATE merchants SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def transactions()
    sql = "SELECT * FROM transactions WHERE transactions.merchant_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |transaction| Transaction.new(transaction)  }
  end

  def Merchant.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Merchant.new(results.first())
  end

  def Merchant.all()
    sql = "SELECT * FROM merchants"
    results = SqlRunner.run (sql)
    return results.map { |merchant| Merchant.new(merchant) }
  end


  def Merchant.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end
end
