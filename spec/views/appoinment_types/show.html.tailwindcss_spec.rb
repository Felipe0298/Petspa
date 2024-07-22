require 'rails_helper'

RSpec.describe "appoinment_types/show", type: :view do
  before(:each) do
    assign(:appoinment_type, AppoinmentType.create!(
      payment_required: false,
      name: "Name",
      user: nil,
      price: 2,
      description: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
