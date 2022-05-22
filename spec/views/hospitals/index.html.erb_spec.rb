require 'rails_helper'

RSpec.describe "hospitals/index", type: :view do
  before(:each) do
    assign(:hospitals, [
      Hospital.create!(
        nombre: "Nombre"
      ),
      Hospital.create!(
        nombre: "Nombre"
      )
    ])
  end

  it "renders a list of hospitals" do
    render
    assert_select "tr>td", text: "Nombre".to_s, count: 2
  end
end
