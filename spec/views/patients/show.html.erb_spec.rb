require 'rails_helper'

RSpec.describe "patients/show", type: :view do
  before(:each) do
    @patient = assign(:patient, Patient.create!(
      fist_name: "Fist Name",
      last_name: "Last Name",
      id_number: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fist Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/2/)
  end
end
