require 'rails_helper'

RSpec.describe "medicines/show", type: :view do
  before(:each) do
    @medicine = assign(:medicine, Medicine.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
