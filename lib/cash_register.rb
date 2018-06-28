class CashRegister

  attr_accessor :total, :discount
  @@arr = []

  def initialize(discount = 0, total = 0)
    @total = total
    @discount = discount
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    @@arr << title
  end

  def apply_discount
    if @discount != 0
      @total -= @total * @discount / 100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @@arr
  end

  def void_last_transaction
    self.total -= @arr[-1].total
  end

end
