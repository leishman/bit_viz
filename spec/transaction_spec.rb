require_relative 'spec_helper'

describe Transaction do
	it { should validate_uniqueness_of(:coinbase_id).
		with_message('Tx already exists in database') }
	it { should belong_to(:user) }
end