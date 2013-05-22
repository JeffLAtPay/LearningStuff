require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "Transaction Model" do
  it 'can construct a new instance' do
    @transaction = Transaction.new
    refute_nil @transaction
  end
end
