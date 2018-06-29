require 'pry'

class CashRegister
  attr_accessor :total, :discount, :last
  attr_reader :items

  def initialize (discount=0)
    @total = 0
    @discount = discount
    @items= []
    @last = 0
  end

  def add_item(title, price, quantity=1)
    @total += price*quantity
    i = quantity
    while i > 0
      @items << title
      self.last = price
      i -= 1
    end
  end

  def apply_discount
    if @discount != 0
          @total -= @total * @discount / 100
          "After the discount, the total comes to $#{@total}."
    else "There is no discount to apply."
    end
  end

# def items
#   @items
# end

def void_last_transaction
  # binding.pry
# @total = @total - @last
@total -= @last
end

end
