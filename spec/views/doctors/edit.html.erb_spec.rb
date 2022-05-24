require 'rails_helper'

RSpec.describe "doctors/edit", type: :view do
  before(:each) do
    @doctor = assign(:doctor, Doctor.create!(
      fist_name: "MyString",
      last_name: "MyString",
      code: 1,
      specialty: 1
    ))
  end

  it "renders the edit doctor form" do
    render

    assert_select "form[action=?][method=?]", doctor_path(@doctor), "post" do

      assert_select "input[name=?]", "doctor[fist_name]"

      assert_select "input[name=?]", "doctor[last_name]"

      assert_select "input[name=?]", "doctor[code]"

      assert_select "input[name=?]", "doctor[specialty]"
    end
  end
end
