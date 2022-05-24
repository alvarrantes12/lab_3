require 'rails_helper'

RSpec.describe "create_doctors/show", type: :view do
  before(:each) do
    @create_doctor = assign(:create_doctor, CreateDoctor.create!(
      fist_name: "Fist Name",
      last_name: "Last Name",
      code: 2,
      specialty: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fist Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
