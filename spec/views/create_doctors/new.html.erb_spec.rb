require 'rails_helper'

RSpec.describe "create_doctors/new", type: :view do
  before(:each) do
    assign(:create_doctor, CreateDoctor.new(
      fist_name: "MyString",
      last_name: "MyString",
      code: 1,
      specialty: 1
    ))
  end

  it "renders new create_doctor form" do
    render

    assert_select "form[action=?][method=?]", create_doctors_path, "post" do

      assert_select "input[name=?]", "create_doctor[fist_name]"

      assert_select "input[name=?]", "create_doctor[last_name]"

      assert_select "input[name=?]", "create_doctor[code]"

      assert_select "input[name=?]", "create_doctor[specialty]"
    end
  end
end
