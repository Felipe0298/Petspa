require 'rails_helper'

RSpec.describe "appoinments/new", type: :view do
  before(:each) do
    assign(:appoinment, Appoinment.new(
      status: 1,
      user: nil,
      appointment_type: nil
    ))
  end

  it "renders new appoinment form" do
    render

    assert_select "form[action=?][method=?]", appoinments_path, "post" do

      assert_select "input[name=?]", "appoinment[status]"

      assert_select "input[name=?]", "appoinment[user_id]"

      assert_select "input[name=?]", "appoinment[appointment_type_id]"
    end
  end
end
