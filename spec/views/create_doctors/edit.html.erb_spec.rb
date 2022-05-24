require 'rails_helper'

RSpec.describe "create_doctors/edit", type: :view do
  before(:each) do
    @create_doctor = assign(:create_doctor, CreateDoctor.create!(
      fist_name: "MyString",
      last_name: "MyString",
      code: 1,
      specialty: 1
    ))
  end

  it "renders the edit create_doctor form" do
    render

    assert_select "form[action=?][method=?]", create_doctor_path(@create_doctor), "post" do

      assert_select "input[name=?]", "create_doctor[fist_name]"

      assert_select "input[name=?]", "create_doctor[last_name]"

      assert_select "input[name=?]", "create_doctor[code]"

      assert_select "input[name=?]", "create_doctor[specialty]"
    end
  end
end
