module DoctorsHelper

    def specialities
        Doctor.specialities.keys.map do |speciality|
            [t("activerecord.attributes.doctor.specialities.#{speciality}"), speciality]
        end
    end
end
