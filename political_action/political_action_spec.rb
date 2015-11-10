require 'rspec'
require_relative 'political_action.rb'

describe PACGroup do
	let(:group) do
		PACGroup.new(group_name, 1200, 800)
	end

	it 'has a name' do
		group = PACGroup.new('Elect Bobo')
		expect(group_name).to eq('Elect Bobo')
	end

	it 'has a distinct name'
		group = PACGroup.new('Vote for Joe Black', 1200, 800)
	end

	it 'has the amount raised'
		expect(group.amount_raised).to eq(1200)
	end

	it 'has the amount disbursed'
		expect(group.amount_disbursed).to eq(800)
	end

	it 'has a raise ratio' do
		expect(group.raise_ratio).to eq(
			group.amount_raised.to_f /
			group.amount_disbursed.to_f
			)
	end

	it 'has a raise ratio of 0 when there is no amount disbursed' do
		group = PACGroup.new('Vote for Joe Black', 1200, 0)
		 expect(group.raise_ratio).to eq(0)
	end
	
	it 'has cash on hand'
	it 'has the undisbursed amount'

end
