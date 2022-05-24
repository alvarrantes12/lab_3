require 'rails_helper'

RSpec.describe "doctors/new", type: :view do
  before(:each) do
    assign(:doctor, Doctor.new(
      fist_name: "MyString",
      last_name: "MyString",
      code: 1,
      specialty: 1
    ))
  end

  it "renders new doctor form" do
    render

    assert_select "form[action=?][method=?]", doctors_path, "post" do

      assert_select "input[name=?]", "doctor[fist_name]"

      assert_select "input[name=?]", "doctor[last_name]"

      assert_select "input[name=?]", "doctor[code]"

      assert_select "input[name=?]", "doctor[specialty]"
    end
  end
end
