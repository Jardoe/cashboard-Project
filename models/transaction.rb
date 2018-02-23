require_relative("../db/sql_runner.rb")

class Transaction

  attr_reader(:id, :merchant_id, :tag_id, :amount)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id']
    @tag_id = options['tag_id']
    @amount = options['amount']
  end

  def save()
    sql = "INSERT INTO transactions
    (merchant_id, tag_id, amount)
    VALUES
    ($1, $2, $3)
    RETURNING id;"
    values = [@merchant_id, @tag_id, @amount]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE transactions SET
    (merchant_id, tag_id, amount) =
    ($1, $2, $3)
    WHERE id = $4"
    values = [@merchant_id, @tag_id, @amount, @id]
    SqlRunner.run(sql, values)
  end

  def Transaction.all()
    sql = "SELECT * FROM transactions"
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
