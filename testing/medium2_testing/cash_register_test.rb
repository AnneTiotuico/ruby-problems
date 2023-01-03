require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @reg = CashRegister.new(0)
    @transaction = Transaction.new(5)
    @transaction.amount_paid = 50
  end

  def test_accept_money
    result = @reg.accept_money(@transaction)
    assert_equal(50, result)
  end

  def test_change
    assert_equal(45, @reg.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $5.\n") {@reg.give_receipt(@transaction)}
  end

  def test_prompt_for_payment
    input = StringIO.new("100\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(100, @transaction.amount_paid)
  end

end