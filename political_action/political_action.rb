class PACGroup
	
	attr_reader :name :amount_raised :amount_disbursed
	
	def initialize(name, amount_raised, amount_disbursed)
		@name = name
		@amount_raised = amount_raised
		@amount_disbursed = amount_disbursed
	end

	def undisbursed_amount
		self.amount_raised - self.amount_disbursed
	end

	def raise_ratio

	if amount_disbursed == 0
		0
	else
		self.amount_raised.to_f / self.amount_disbursed.to_f
	end

end