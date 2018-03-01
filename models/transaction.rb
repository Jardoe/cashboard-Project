require_relative("../db/sql_runner.rb")

class Transaction

  attr_reader(:id, :merchant_id, :category_id, :amount, :dt)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @category_id = options['category_id'].to_i
    @amount = options['amount'].to_f
    @dt = Date.parse(options['dt'])
  end

  def save()
    sql = "INSERT INTO transactions
    (merchant_id, category_id, amount, dt)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id;"
    values = [@merchant_id, @category_id, @amount, @dt]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE transactions SET
    (merchant_id, category_id, amount, dt) =
    ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@merchant_id, @category_id, @amount, @dt, @id]
    result = SqlRunner.run(sql, values)
  end

  def category()
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [@category_id]
    results = SqlRunner.run(sql, values)
    return Category.new(results.first())
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    results = SqlRunner.run(sql, values)
    return Merchant.new(results.first())
  end

  def date()
    @dt.strftime("%d-%m-%Y")
  end

  def month()
    @dt.strftime("%m")
  end


  def Transaction.total()
    sql = "SELECT SUM(amount) FROM transactions"
    result = SqlRunner.run(sql)[0]['sum']
    return result
  end

  def Transaction.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Transaction.new(results.first())
  end

  def Transaction.all()
    sql = "SELECT * FROM transactions ORDER BY dt DESC"
    results = SqlRunner.run (sql)
    return results.map { |transaction| Transaction.new(transaction) }
  end

  def Transaction.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def Transaction.delete(id)
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
