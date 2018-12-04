with g_c AS
      (
      SELECT
      gcs.*
      FROM `physionet-data.mimiciii_derived.bloodgasfirstdayarterial` gcs
      )
select subject_id, hadm_id, icustay_id,

min(SO2) as central_min_SO2,
max(SO2) as central_max_SO2,
avg(SO2) as central_avg_SO2,

min(spo2) as central_min_spo2,
max(spo2) as central_max_spo2,
avg(spo2) as central_avg_spo2,

min(PO2) as central_min_PO2,
max(PO2) as central_max_PO2,
avg(PO2) as central_avg_PO2,

min(PCO2) as central_min_PCO2,
max(PCO2) as central_max_PCO2,
avg(PCO2) as central_avg_PCO2,

min(fio2_chartevents) as central_min_fio2_chartevents,
max(fio2_chartevents) as central_max_fio2_chartevents,
avg(fio2_chartevents) as central_avg_fio2_chartevents,

min(FIO2) as central_min_FIO2,
max(FIO2) as central_max_FIO2,
avg(FIO2) as central_avg_FIO2,

min(AADO2) as central_min_AADO2,
max(AADO2) as central_max_AADO2,
avg(AADO2) as central_avg_AADO2,

min(AADO2_calc) as central_min_AADO2_calc,
max(AADO2_calc) as central_max_AADO2_calc,
avg(AADO2_calc) as central_avg_AADO2_calc,

min(PaO2FiO2) as central_min_PaO2FiO2,
max(PaO2FiO2) as central_max_PaO2FiO2,
avg(PaO2FiO2) as central_avg_PaO2FiO2,

min(BASEEXCESS) as central_min_BASEEXCESS,
max(BASEEXCESS) as central_max_BASEEXCESS,
avg(BASEEXCESS) as central_avg_BASEEXCESS,

min(BICARBONATE) as central_min_BICARBONATE,
max(BICARBONATE) as central_max_BICARBONATE,
avg(BICARBONATE) as central_avg_BICARBONATE,

min(TOTALCO2) as central_min_TOTALCO2,
max(TOTALCO2) as central_max_TOTALCO2,
avg(TOTALCO2) as central_avg_TOTALCO2,

min(HEMATOCRIT) as central_min_HEMATOCRIT,
max(HEMATOCRIT) as central_max_HEMATOCRIT,
avg(HEMATOCRIT) as central_avg_HEMATOCRIT,

min(HEMOGLOBIN) as central_min_HEMOGLOBIN,
max(HEMOGLOBIN) as central_max_HEMOGLOBIN,
avg(HEMOGLOBIN) as central_avg_HEMOGLOBIN,

min(CARBOXYHEMOGLOBIN) as central_min_CARBOXYHEMOGLOBIN,
max(CARBOXYHEMOGLOBIN) as central_max_CARBOXYHEMOGLOBIN,
avg(CARBOXYHEMOGLOBIN) as central_avg_CARBOXYHEMOGLOBIN,

min(METHEMOGLOBIN) as central_min_METHEMOGLOBIN,
max(METHEMOGLOBIN) as central_max_METHEMOGLOBIN,
avg(METHEMOGLOBIN) as central_avg_METHEMOGLOBIN,

min(CHLORIDE) as central_min_CHLORIDE,
max(CHLORIDE) as central_max_CHLORIDE,
avg(CHLORIDE) as central_avg_CHLORIDE,

min(CALCIUM) as central_min_CALCIUM,
max(CALCIUM) as central_max_CALCIUM,
avg(CALCIUM) as central_avg_CALCIUM,

min(TEMPERATURE) as central_min_TEMPERATURE,
max(TEMPERATURE) as central_max_TEMPERATURE,
avg(TEMPERATURE) as central_avg_TEMPERATURE,

min(POTASSIUM) as central_min_POTASSIUM,
max(POTASSIUM) as central_max_POTASSIUM,
avg(POTASSIUM) as central_avg_POTASSIUM,

min(SODIUM) as central_min_SODIUM,
max(SODIUM) as central_max_SODIUM,
avg(SODIUM) as central_avg_SODIUM,

min(LACTATE) as central_min_LACTATE,
max(LACTATE) as central_max_LACTATE,
avg(LACTATE) as central_avg_LACTATE,

min(GLUCOSE) as central_min_GLUCOSE,
max(GLUCOSE) as central_max_GLUCOSE,
avg(GLUCOSE) as central_avg_GLUCOSE,

min(TIDALVOLUME) as central_min_TIDALVOLUME,
max(TIDALVOLUME) as central_max_TIDALVOLUME,
avg(TIDALVOLUME) as central_avg_TIDALVOLUME,

min(PEEP) as central_min_PEEP,
max(PEEP) as central_max_PEEP,
avg(PEEP) as central_avg_PEEP,

min(O2Flow) as central_min_O2Flow,
max(O2Flow) as central_max_O2Flow,
avg(O2Flow) as central_avg_O2Flow,

min(REQUIREDO2) as central_min_REQUIREDO2,
max(REQUIREDO2) as central_max_REQUIREDO2,
avg(REQUIREDO2) as central_avg_REQUIREDO2 from g_c
where SPECIMEN='CENTRAL VENOUS'
group by subject_id, hadm_id, icustay_id