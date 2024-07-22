require 'rails_helper'

RSpec.describe "appoinment_types/index", type: :view do
  before(:each) do
    assign(:appoinment_types, [
      AppoinmentType.create!(
        payment_required: false,
        name: "Name",
        user: nil,
        price: 2,
        description: nil
      ),
      AppoinmentType.create!(
        payment_required: false,
        name: "Name",
        user: nil,
        price: 2,
        description: nil
      )
    ])
  end

  it "renders a list of appoinment_types" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
