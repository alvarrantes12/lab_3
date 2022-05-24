module DoctorsHelper
  def specialties
    Doctor.specialties.keys.map do |specialty|
      [t("activerecord.attributes.doctor.specialties.#{specialty}"), specialty]
    end
  end
end
