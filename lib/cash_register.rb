
class CashRegister
  attr_accessor :total, :discount, :price, :items

  # Swap the initialized arguments
  def initialize(discount = 0, total = 0)
    @total = total
    @discount = discount
    @items = []

  end

  def add_item(title, price, quantity = 1)
    @price = price
    @total += @price * quantity
    if quantity > 1
      counter = 0
      while counter < quantity
        @items << title
        counter += 1
      end
    else
      @items << title
    end
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total -= @total * @discount / 100
      return "After the discount, the total comes to $#{@total}."
    end
    # if discount == 20
    #   @total -= @total * @discount / 100
    #   return "After the discount, the total comes to $#{@total}."
    # else
    #   return "There is no discount to apply."
    # end
  end

  def void_last_transaction
    @total -= @price
  end
end
