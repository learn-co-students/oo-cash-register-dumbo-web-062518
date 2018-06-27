require 'pry'

class CashRegister

attr_accessor :total, :discount, :title, :price, :last_item

def initialize(discount = 1)
  @total = 0
  @discount = discount
  @items = []
end

def total
  @total
end

def discount
  @discount
end

def add_item(title, price, quantity = 1)
  @total = @total + (price * quantity)
  number = 0
  until number == quantity
    @items.push(title)
    number +=1
  end
  @last_item = price
end

def apply_discount
if @discount > 1
  @total *= ((100.0 - @discount)/100.0)
  "After the discount, the total comes to $#{total.to_i}."
else
  "There is no discount to apply."
end
end

def items
  @items
end

def void_last_transaction
  @total -= @last_item
end

end
