require 'rails_helper'

RSpec.describe "appointments/show", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      date: "Date"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Date/)
  end
end
