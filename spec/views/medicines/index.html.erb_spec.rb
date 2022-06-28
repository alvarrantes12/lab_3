require 'rails_helper'

RSpec.describe "medicines/index", type: :view do
  before(:each) do
    assign(:medicines, [
      Medicine.create!(
        name: "Name"
      ),
      Medicine.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of medicines" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
