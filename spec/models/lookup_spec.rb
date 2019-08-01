require 'rails_helper'


RSpec.describe Lookup, type: :model do
  let!(:lookups) { create_list(:lookup, 5) }

  it 'can do a simple lookup with a key' do 
    Lookup.create(key: "mykey", value: "myvalue")
    value = Lookup.for("mykey")
    expect(value).to be_eql("myvalue")
  end
end