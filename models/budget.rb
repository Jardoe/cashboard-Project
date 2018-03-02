require_relative("../db/sql_runner.rb")

class Budget

  attr_reader(:id, :amount, :month, :dt)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount']
    @month = options['month']
    @dt = Date.parse(options['dt'])
  end

  def save()
    sql = "INSERT INTO budgets
    (amount, month, dt)
    VALUES
    ($1, $2, $3)
    RETURNING id;"
    values = [@amount, @month, @dt]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE budgets SET amount = $1
    WHERE id = $2"
    values = [@amount, @id]
    SqlRunner.run(sql, values)
  end

  def total()
    sql = "
      SELECT SUM (transactions.amount) FROM transactions
      INNER JOIN budgets ON budgets.id = transactions.budget_id
      WHERE budgets.id = $1"
      values = [@id]
      result = SqlRunner.run(sql, values)[0]["sum"].to_f
      return result
  end

  def transactions()
    sql = "SELECT * FROM transactions WHERE transactions.budget_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |transaction| Transaction.new(transaction)  }
  end

  def Budget.all()
    sql = "SELECT * FROM budgets ORDER BY dt"
    results = SqlRunner.run (sql)
    return results.map { |budget| Budget.new(budget) }
  end

  def Budget.find(id)
    sql = "SELECT * FROM budgets WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Budget.new(results.first())
  end

  def Budget.delete_all()
    sql = "DELETE FROM budgets"
    SqlRunner.run(sql)
  end

end
