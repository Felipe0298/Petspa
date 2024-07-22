require 'rails_helper'

RSpec.describe "appoinment_types/new", type: :view do
  before(:each) do
    assign(:appoinment_type, AppoinmentType.new(
      payment_required: false,
      name: "MyString",
      user: nil,
      price: 1,
      description: nil
    ))
  end

  it "renders new appoinment_type form" do
    render

    assert_select "form[action=?][method=?]", appoinment_types_path, "post" do

      assert_select "input[name=?]", "appoinment_type[payment_required]"

      assert_select "input[name=?]", "appoinment_type[name]"

      assert_select "input[name=?]", "appoinment_type[user_id]"

      assert_select "input[name=?]", "appoinment_type[price]"

      assert_select "input[name=?]", "appoinment_type[description]"
    end
  end
end
