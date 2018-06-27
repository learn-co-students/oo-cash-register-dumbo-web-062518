
class CashRegister
	attr_accessor :discount, :total
	def initialize(discount = 0)
		@total = 0
		@discount = discount
		@last_transaction = 0
		@items = []
		# discount is in percent
	end

# not necessary because we have attr_accessor for this
	# def total
	# 	@total
	# end

	def add_item(title, price, quantity = 1)
		quantity.times do 
			@items << title
		end
		
		@last_transaction = price * quantity

		@total += @last_transaction
		@total
	end

	def apply_discount
		@total = @total * ((100 - @discount.to_f)/100)
		@discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{@total.to_i}."

	end

	def items
		@items
	end

	def void_last_transaction
		@total -= @last_transaction
	end
end
