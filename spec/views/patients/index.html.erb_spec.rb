require 'rails_helper'

RSpec.describe "patients/index", type: :view do
  before(:each) do
    assign(:patients, [
      Patient.create!(
        fist_name: "Fist Name",
        last_name: "Last Name",
        id_number: 2
      ),
      Patient.create!(
        fist_name: "Fist Name",
        last_name: "Last Name",
        id_number: 2
      )
    ])
  end

  it "renders a list of patients" do
    render
    assert_select "tr>td", text: "Fist Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
