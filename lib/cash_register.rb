class CashRegister
  attr_accessor :total, :discount

  def initialize(discount=0)
    @total=0
    @discount=discount
    @bagged=[]
    @last_price = 0
  end

  def add_item(item, price, quantity=1)
    i = 0
    while i < quantity do
      self.total += price
      @bagged << item
      i += 1
    end
    @last_price = (price * quantity)
  end

  def apply_discount
    if @discount > 0
      self.total = self.total - (self.total * @discount/100)
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @bagged
  end

  def void_last_transaction
    self.total -= @last_price
  end

end
