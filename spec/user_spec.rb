require_relative 'spec_helper'

describe User do
	it { should validate_uniqueness_of(:email).
		with_message('Email has already been used') }
	it { should have_many(:transactions) }
	it { should have_many(:transfers) }
	it { should respond_to(:average_buy_price) }
end