crumb :root do
  link "Home", root_path
end

### country crumbs
crumb :countries do
  link "Countries", countries_path
end

crumb :country do |country|
  link country.name, country_path(country)
  parent :countries
end

crumb :edit_country do |country|
  link 'Edit', edit_country_path(country)
  parent :country, country
end

crumb :new_country do
  link 'New', new_country_path
  parent :countries
end

### state crumbs

crumb :country_states do |country|
  link country.name, country_states_path(country)
end

crumb :new_country_state do |country|
  link 'New state', new_country_state_path(country)
  parent :country_states, country
end

crumb :country_state do |country, state|
  link state.name, country_state_path(country, state)
  parent :country_states, country
end

crumb :edit_country_state do |country, state|
  link 'Edit', edit_country_state_path(country, state)
  parent :country_state, country, state
end

###city crumbs

crumb :state_cities do |state|
  link state.name, state_cities_path(state)
end

crumb :new_state_city do |state|
  link 'New city', new_state_city_path(state)
  parent :state_cities, state
end

crumb :state_city do |state, city|
  link city.name, state_city_path(state, city)
  parent :state_cities, state
end

crumb :edit_state_city do |state, city|
  link 'Edit', edit_state_city_path(state, city)
  parent :state_city, state, city
end

###area crumbs
crumb :city_areas do |city|
  link city.name, city_areas_path(city)
end

crumb :new_city_area do |city|
  link 'New area', new_city_area_path(city)
  parent :city_areas, city
end

crumb :city_area do |city, area|
  link area.name, city_area_path(city, area)
  parent :city_areas, city
end

crumb :edit_city_area do |city, area|
  link 'Edit', edit_city_area_path(city, area)
  parent :city_area, city, area
end

### specializations breadcrummbs
crumb :specializations do
  link 'Specializations', specializations_path
end

crumb :specialization do |specialization|
  link specialization.name, specialization_path(specialization)
  parent :specializations
end

crumb :edit_specialization do |specialization|
  link 'Edit', edit_specialization_path(specialization)
  parent :specialization, specialization
end

crumb :new_specialization do
  link 'New', new_specialization_path
  parent :specializations
end

#### other facilities
crumb :other_facilities do
  link 'other_facilities', other_facilities_path
end

crumb :other_facility do |other_facility|
  link other_facility.name, other_facility_path(other_facility)
  parent :other_facilities
end

crumb :edit_other_facility do |other_facility|
  link 'Edit', edit_other_facility_path(other_facility)
  parent :other_facility, other_facility
end

crumb :new_other_facility do
  link 'New', new_other_facility_path
  parent :other_facilities
end

### qualifications
crumb :qualifications do
  link 'qualifications', qualifications_path
end

crumb :qualification do |qualification|
  link qualification.name, qualification_path(qualification)
  parent :qualifications
end

crumb :edit_qualification do |qualification|
  link 'Edit', edit_qualification_path(qualification)
  parent :qualification, qualification
end

crumb :new_qualification do
  link 'New', new_qualification_path
  parent :qualifications
end

## specialities
crumb :specialities do
  link 'specialities', specialities_path
end

crumb :speciality do |speciality|
  link speciality.name, speciality_path(speciality)
  parent :specialities
end

crumb :edit_speciality do |speciality|
  link 'Edit', edit_speciality_path(speciality)
  parent :speciality, speciality
end

crumb :new_speciality do
  link 'New', new_speciality_path
  parent :specialities
end

#medical_equipments
crumb :medical_equipments do
  link 'medical_equipments', medical_equipments_path
end

crumb :medical_equipment do |medical_equipment|
  link medical_equipment.name, medical_equipment_path(medical_equipment)
  parent :medical_equipments
end

crumb :edit_medical_equipment do |medical_equipment|
  link 'Edit', edit_medical_equipment_path(medical_equipment)
  parent :medical_equipment, medical_equipment
end

crumb :new_medical_equipment do
  link 'New', new_medical_equipment_path
  parent :medical_equipments
end

#diagnostic_facilities
crumb :diagnostic_facilities do
  link 'diagnostic_facilities', diagnostic_facilities_path
end

crumb :diagnostic_facility do |diagnostic_facility|
  link diagnostic_facility.name, diagnostic_facility_path(diagnostic_facility)
  parent :diagnostic_facilities
end

crumb :edit_diagnostic_facility do |diagnostic_facility|
  link 'Edit', edit_diagnostic_facility_path(diagnostic_facility)
  parent :diagnostic_facility, diagnostic_facility
end

crumb :new_diagnostic_facility do
  link 'New', new_diagnostic_facility_path
  parent :diagnostic_facilities
end

#selection crumbs

crumb :country_selector do
  link 'Select country', country_selection_path
end

crumb :state_selector do
  link 'Select state', state_selection_path
end

crumb :city_selector do
  link 'Select city', city_selection_path
end

crumb :area_selector do
  link 'Select area', area_selection_path
end
#### hospital crumbs
crumb :area_hospitals do |area|
  link area.name, area_hospitals_path(area)
end

crumb :new_area_hospital do |area|
  link 'New hospital', new_area_hospital_path(area)
  parent :area_hospitals, area
end

crumb :area_hospital do |area, hospital|
  link hospital.name, area_hospital_path(area, hospital)
  parent :area_hospitals, area
end

crumb :edit_area_hospital do |area, hospital|
  link 'Edit', edit_area_hospital_path(area, hospital)
  parent :area_hospital, area, hospital
end

crumb :new_hospital_doctor do |hospital|
  link 'New Doctor', new_hospital_doctor_path
  parent :area_hospital, hospital.area, hospital
end

crumb :add_doctor_to_hospital do |hospital|
  link 'Add Doctor', new_hospital_schedule_path(hospital)
  parent :area_hospital, hospital.area, hospital
end

crumb :edit_hospital_doctor do |hospital, doctor|
  link "Edit Doctor:", edit_hospital_doctor_path(hospital, doctor)
  parent :area_hospital, hospital.area, hospital
end


# doctors crumbs
crumb :doctors do
  link 'Doctors', doctors_path
end

crumb :doctor do |doctor|
  link doctor.full_name, doctor_path(doctor)
  parent :doctors
end

crumb :edit_doctor do |doctor|
  link 'Edit', edit_doctor_path(doctor)
  parent :doctor, doctor
end

crumb :new_doctor do
  link 'New', new_doctor_path
  parent :doctors
end

crumb :edit_doctor_schedule do |schedule|
  link "#{schedule.hospital.name}", edit_doctor_schedule_path
  parent schedule.doctor
end

crumb :new_doctor_schedule do |doctor|
  link 'Add hospital', new_doctor_schedule_path(doctor)
  parent doctor
end

### hospital category crumbs
crumb :hospital_categories do
  link "hospital categories", hospital_categories_path
end

crumb :hospital_category do |hospital_category|
  link hospital_category.name, hospital_category_path(hospital_category)
  parent :hospital_categories
end

crumb :edit_hospital_category do |hospital_category|
  link 'Edit', edit_hospital_category_path(hospital_category)
  parent :hospital_category, hospital_category
end

crumb :new_hospital_category do
  link 'New', new_hospital_category_path
  parent :hospital_categories
end

### doctor category crumbs
crumb :doctor_categories do
  link "doctor categories", doctor_categories_path
end

crumb :doctor_category do |doctor_category|
  link doctor_category.name, doctor_category_path(doctor_category)
  parent :doctor_categories
end

crumb :edit_doctor_category do |doctor_category|
  link 'Edit', edit_doctor_category_path(doctor_category)
  parent :doctor_category, doctor_category
end

crumb :new_doctor_category do
  link 'New', new_doctor_category_path
  parent :doctor_categories
end

### treatment category crumbs
crumb :treatment_categories do
  link "Treatment categories", treatment_categories_path
end

crumb :treatment_category do |treatment_category|
  link treatment_category.name, treatment_category_path(treatment_category)
  parent :treatment_categories
end

crumb :edit_treatment_category do |treatment_category|
  link 'Edit', edit_treatment_category_path(treatment_category)
  parent :treatment_category, treatment_category
end

crumb :new_treatment_category do
  link 'New', new_treatment_category_path
  parent :treatment_categories
end