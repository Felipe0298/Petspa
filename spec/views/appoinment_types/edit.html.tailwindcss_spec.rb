require 'rails_helper'

RSpec.describe "appoinment_types/edit", type: :view do
  let(:appoinment_type) {
    AppoinmentType.create!(
      payment_required: false,
      name: "MyString",
      user: nil,
      price: 1,
      description: nil
    )
  }

  before(:each) do
    assign(:appoinment_type, appoinment_type)
  end

  it "renders the edit appoinment_type form" do
    render

    assert_select "form[action=?][method=?]", appoinment_type_path(appoinment_type), "post" do

      assert_select "input[name=?]", "appoinment_type[payment_required]"

      assert_select "input[name=?]", "appoinment_type[name]"

      assert_select "input[name=?]", "appoinment_type[user_id]"

      assert_select "input[name=?]", "appoinment_type[price]"

      assert_select "input[name=?]", "appoinment_type[description]"
    end
  end
end
