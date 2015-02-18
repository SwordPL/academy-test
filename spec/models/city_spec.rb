require 'rails_helper'

describe City, :type => :model do
  before(:each) { @city = City.new(name: 'London', short_name: 'Ld') }

  subject { @city }

  it { should respond_to :name, :short_name }

end
