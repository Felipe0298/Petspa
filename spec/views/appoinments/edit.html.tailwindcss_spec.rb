require 'rails_helper'

RSpec.describe "appoinments/edit", type: :view do
  let(:appoinment) {
    Appoinment.create!(
      status: 1,
      user: nil,
      appointment_type: nil
    )
  }

  before(:each) do
    assign(:appoinment, appoinment)
  end

  it "renders the edit appoinment form" do
    render

    assert_select "form[action=?][method=?]", appoinment_path(appoinment), "post" do

      assert_select "input[name=?]", "appoinment[status]"

      assert_select "input[name=?]", "appoinment[user_id]"

      assert_select "input[name=?]", "appoinment[appointment_type_id]"
    end
  end
end
