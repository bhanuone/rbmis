# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
hospital_categories = ['Private', 'Government', 'Super-speciality', 'Multi-speciality', 'Womens hospitals', 'Childrens']
hospital_categories.each {|q| HospitalCategory.create(name:q)}

doctor_qualifications = ['MBBS', 'MD', 'MS', 'DNB', 'FCPS', 'DM', 'Mch']
doctor_qualifications.each {|q| Qualification.create(name:q)}

treatment_categories = ['Ayurveda', 'Homeopathy', 'Allopathy']
treatment_categories.each {|t| TreatmentCategory.create(name: t)}

specialities = ['Allergy & Immunology', 'Anesthesia', 'Bariatric Surgery', 'Bone Marrow Transplant', 'Breast Surgery', 'Cardiac Anesthesia', 'Cardiology', 'Cardiothoracic Surgery', 'Clinical Biochemistry', 'Clinical Psychology', 'Colorectal Surgery', 'Cosmetic Surgery', 'Critical Care', 'Dentistry', 'Dermatology', 'Cosmetology', 'Diabetology', 'Emergency Medicine', 'Endocrinology', 'Diabetes', 'ENT', 'ENT and Head & Neck Surgery', 'Family Medicine', 'Fetal Medicine', 'General Medicine', 'General Surgery', 'Geriatrics', 'Hematology', 'Hematopathology', 'Hepatobiliary Surgery', 'Pancreatic Surgery', 'Histopathology', 'Infectious Disease', 'Interventional Cardiology', 'Interventional Radiology', 'Liver Transplant & Hepatobiliary Surgery', 'Medical Gastroenterology', 'Medical Oncology', 'Microbiology', 'Neonatology', 'Paediatrics', 'Nephrology', 'Neuro & Spine Surgery', 'Neuro Radiology', 'Neurology', 'Neurophysiology', 'Neurosurgery', 'Nuclear Medicine', 'Obstetrics & Gynecology', 'Oncology', 'Ophthalmology', 'Oral & Maxillo-Facial Surgery', 'Orthodontics', 'Orthopedics', 'Pathology', 'Pediatric Anesthesia', 'Pediatric Cardiology', 'Pediatric Cardiothoracic Surgery', 'Pediatric Critical Care', 'Pediatric Diabetes', 'Pediatric Emergency', 'Pediatric Endocrinology', 'Pediatric ENT', 'Pediatric Gastroenterology', 'Pediatric Hematology & Oncology', 'Pediatric Laproscopic surgery', 'Pediatric Nephrology', 'Pediatric Neurology', 'Pediatric Orthopedics', 'Pediatric Pulmonology', 'Pediatric Surgery', 'Pediatric Urology', 'Pediatrics', 'Physical Medicine', 'Plastic & Reconstructive Surgery', 'Plastic Surgery', 'Podiatric Surgery', 'Psychiatry', 'Pulmonology', 'Radiation Oncology', 'Radiodiagnosis', 'Radiology', 'Radiotherapy', 'Reproductive Medicine', 'Respiratory Medicine', 'Rheumatology', 'Robotic Surgery', 'Sexual Medicine', 'Sleep Medicine', 'Speech Therapy', 'Spine Surgery', 'Surgical Gastroenterology', 'Surgical Oncology', 'Transfusion Medicine', 'Transplant Surgery', 'Urology', 'Vascular Surgery']
specialities.each {|s| Speciality.create(name: s, description: 'Some description will be added here in future', treatment_category_id: 3)}


doctor_specializations = ['Dentist','General Physician','Homeopath','Pediatrician','Physiotherapist','Gynecologist/obstetrician','Orthopedist','Gynecologist','Ayurveda','Cardiologist','General Surgeon','Dermatologist/cosmetologist','Ophthalmologist/ Eye Surgeon','Ophthalmologist','Dermatologist','Diabetologist','Urologist','Ear-nose-throat (ent) Specialist','Ent/ Otolaryngologist','Radiologist','Cosmetic/plastic Surgeon','Gastroenterologist','Psychiatrist','Anesthesiologist','Pulmonologist','Orthodontist','Implantologist','Neurologist','Cosmetic/aesthetic Dentist','Dental Surgeon','Oral And Maxillofacial Surgeon','Neurosurgeon','Clinical Physiotherapist','Endodontist','Prosthodontist','Periodontist','Orthopedic Surgeon','Oncologist','Pediatric Dentist','Spa Therapist','Cosmetologist','Obstetrician','Pediatric Surgeon','Dietitian/nutritionist','Sexologist','Hair Transplant Surgeon','Internal Medicine','Nephrologist/renal Specialist','Nephrologist','Audiologist','Spine And Pain Specialist','Rheumatologist','Psychologist','Laparoscopy','Acupuncturist','Yoga And Naturopathy','Pathologist','Orthopedic Physiotherapist','General Pathologist','Unani','Infertility Specialist','Endocrinologist','Alternative Medicine','Oncologist/cancer Specialist','Consultant Physician','Speech Therapist','Optometrist','General Endocrinologist','Clinical Psychologist','Neuro Physiotherapist','Family Physician','Bariatric Surgeon','Andrologist','Veterinarian','Obesity Specialist','Veterinary Physician','Surgical Oncologist','Rehab & Physical Medicine Specialist','Radiation Oncologist','Trichologist','Dentofacial Orthopedist','Spine Surgeon','Addiction Psychiatrist','Pediatric Physiotherapist','Cardiothoracic Surgeon','Allergist/immunologist','Cardiac Surgeon','Surgeon','Aesthetic Dermatology','Total Joint Surgeon','Pediatric Dermatologist','Occupational Therapist','Gastrointestinal Surgery','Interventional Cardiologist','Venereologist','Vascular Surgeon','Adolescent And Child Psychiatrist','Paediatric Intensivist','Sports And Musculoskeletal Physiotherapist','Pediatric Orthopedic Surgeon','Counselling Psychologist','Sports Medicine Specialist','Gastroentrology Surgeon','Psychotherapist','Preventive Dentistry','Podiatrist','Hematologist','Dermatosurgeon','Urological Surgeon','Head And Neck Surgeon','Oral Medicine And Radiology','Neonatalogist','Neuropsychiatrist','Joint Replacement Surgeon','Asthma Specialist','Sports Medicine Surgeon','Pediatric Urologist','Cardiovascular And Pulmonary Physiotherapist','Pediatric Otolaryngologist','Geriatric Psychiatrist','Emergency Medicine','Diabetes','Somnologist (sleep Specialist)','Pediatric Cardiologist','Otologist/ Neurotologist','Nuclear Medicine Physician','In vitro fertilisation / Ivf Specialist (infertilty)','Sports Medicine Physician','Intestine Surgeon','Chronic Liver Specialist','Reproductive Endocrinologist (infertilty)','Proctologist','Pediatric Gastroenterologist','Hepatology','Oral Pathologist','Immunodermatologist','Phlebologist','Pediatric Neurologist','Neuropsychologist','Gynecologic Oncologist','Geneticist','Electro Homoeopathy','Colorectal Surgeon','Cardiothoracic And Vascular Surgeon','Aesthetic Surgeon','Urogynecologist','Neonatal Surgeon','Geriatric Physiotherapist','Siddha','Rhinologist','Integrated Medicine','Hepato-biliary-pancreatic','Sports Nutritionist','Sonologist','Hiv Specialist','Veterinary Surgeon','Pediatric Pulmonologist','Hematologic Oncologist','Geriatrician','Chiropractor','Aesthetic Medicine','Ultrasonologist','Thoracic (chest) Surgeon','Pediatric Endocrinologist','Optician','Educational Psychologist','Preventive Medicine','Podiatric Surgeon','Pediatric Oncologist','Neuro Rehablitation','Headache Specialist','Hand Surgeon','Occupational Psychologist','Manual Therapist','Low Vision Specialist','Health Psychologist','Dermatopathologist','Toxicologist','Neuro-oncologist','Hypnotherapist','Forensic Psychologist','Endocrine Surgeon','Neurointensive Care','Neuroendocrinologist','Interventional Radiologist','Geriatric Neurologist','Environmental Toxicologist','Embroyologist','Clinical/biomedical Toxicologist']
doctor_specializations.each {|s| Specialization.create(name: s)}

diagnostic_facilities = ['X-Ray', 'CT-Scan', 'MRI Scan', 'PET/CT Scan', 'PET/MRI Scan', 'Ultrasound scanning', 'Elastography', 'Tactile Imaging', 'Photoacoustic Imaging', 'Thermography (MTI)', 'Echocardiography', 'Radiography', 'ECG', 'Mammography', 'Surgical Imaging', 'Radiopharmacy', 'Fluroscopy', 'Endoscopy', 'Dental OPG']
diagnostic_facilities.each {|d| DiagnosticFacility.create(name: d)}

medical_equipment = ['Dialysis chair','IV Pumps','Child Incubators','Pumps & Regulators','Pulse Oximeter','ICU']
medical_equipment.each {|e| MedicalEquipment.create(name: e)}

other_facilities = ['Ambulance Service','General Ward','Special Nurse','Generator','Private Rooms','Pharmacy']
other_facilities.each {|o| OtherFacility.create(name: o)}

Country.create(name: 'india', iso_code: 'in')
State.create(name: 'Andhra Pradesh', country_id: 1)
City.create(name: 'Visakhapatnam', state_id: 1)
City.create(name: 'Vizianagaram', state_id: 1)
City.create(name: 'Srikakulam', state_id: 1)
Area.create(name: 'Gajuwaka', city_id: 1)
Area.create(name: 'Rajam', city_id: 3)
Admin.create(name: 'Bhanu', email: 'bhanu.dev0@gmail.com', password: 'bhanuprakash', password_confirmation: 'bhanuprakash')
