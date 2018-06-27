
class CashRegister
  attr_accessor :total, :discount, :quantity

  def initialize(discount = 0, total = 0)
    @total = total
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @title = title
    @quantity = quantity
    @total += price * quantity

    for i in 1..quantity do
      @items << {title: title, price: price}
    end
  end

  def apply_discount
    if @discount > 0
      discount = @discount.to_f / 100
      @total -= (@total * discount)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items.map do |item|
      item[:title]
    end
  end

  def void_last_transaction
    last_transaction = @items.pop
    @total -= last_transaction[:price]
  end
end
