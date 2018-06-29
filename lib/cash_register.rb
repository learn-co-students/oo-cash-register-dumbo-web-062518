class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(discount = 0, total = 0)
    @total = total
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @price = price
    self.total += price * quantity
    counter = 0
    while (counter < quantity)
      @items << title
      counter += 1
    end
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
    @items
  end

  def void_last_transaction
    @total -= @price
  end

end
