require 'pry'

class Item
  attr_accessor :name, :price, :last

  def initialize(item_name, item_price, last)
    @name = item_name
    @price = item_price
    @last = last
  end
end

class CashRegister

  attr_accessor :items_array, :discount, :total
  # attr_reader :total

  def initialize(discount=0)
    @total = 0.0
    @discount = discount
    @items_array = []
  end

  def add_item(item_name, price_float, quantity=1)
    self.items_array.each do |item|
      item.last = false
    end
    until quantity == 0
      self.items_array << Item.new(item_name, price_float, true)
      @total = @total + price_float
      quantity -= 1
    end
  end

  def total
    @total
  end

  def apply_discount
    if discount==0
      "There is no discount to apply."
    else
      @total = @total - (@total * (self.discount / 100.0))
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  def items
    @items_array.collect {|item| item.name}
  end

  def void_last_transaction
    items_array.each do |item|
      if item.last == true
        @total -= item.price
      end
    end
    items_array.delete_if {|item| item.last}
  end
end

# pry.start
