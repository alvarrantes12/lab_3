require 'rails_helper'

RSpec.describe "doctors/index", type: :view do
  before(:each) do
    assign(:doctors, [
      Doctor.create!(
        fist_name: "Fist Name",
        last_name: "Last Name",
        code: 2,
        specialty: 3
      ),
      Doctor.create!(
        fist_name: "Fist Name",
        last_name: "Last Name",
        code: 2,
        specialty: 3
      )
    ])
  end

  it "renders a list of doctors" do
    render
    assert_select "tr>td", text: "Fist Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
