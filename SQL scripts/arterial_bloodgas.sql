with g_a AS
      (
      SELECT
      gcs.*
      FROM `physionet-data.mimiciii_derived.bloodgasfirstdayarterial` gcs
      )
select subject_id, hadm_id, icustay_id,

min(SO2) as art_min_SO2,
max(SO2) as art_max_SO2,
avg(SO2) as art_avg_SO2,

min(spo2) as art_min_spo2,
max(spo2) as art_max_spo2,
avg(spo2) as art_avg_spo2,

min(PO2) as art_min_PO2,
max(PO2) as art_max_PO2,
avg(PO2) as art_avg_PO2,

min(PCO2) as art_min_PCO2,
max(PCO2) as art_max_PCO2,
avg(PCO2) as art_avg_PCO2,

min(fio2_chartevents) as art_min_fio2_chartevents,
max(fio2_chartevents) as art_max_fio2_chartevents,
avg(fio2_chartevents) as art_avg_fio2_chartevents,

min(FIO2) as art_min_FIO2,
max(FIO2) as art_max_FIO2,
avg(FIO2) as art_avg_FIO2,

min(AADO2) as art_min_AADO2,
max(AADO2) as art_max_AADO2,
avg(AADO2) as art_avg_AADO2,

min(AADO2_calc) as art_min_AADO2_calc,
max(AADO2_calc) as art_max_AADO2_calc,
avg(AADO2_calc) as art_avg_AADO2_calc,

min(PaO2FiO2) as art_min_PaO2FiO2,
max(PaO2FiO2) as art_max_PaO2FiO2,
avg(PaO2FiO2) as art_avg_PaO2FiO2,

min(BASEEXCESS) as art_min_BASEEXCESS,
max(BASEEXCESS) as art_max_BASEEXCESS,
avg(BASEEXCESS) as art_avg_BASEEXCESS,

min(BICARBONATE) as art_min_BICARBONATE,
max(BICARBONATE) as art_max_BICARBONATE,
avg(BICARBONATE) as art_avg_BICARBONATE,

min(TOTALCO2) as art_min_TOTALCO2,
max(TOTALCO2) as art_max_TOTALCO2,
avg(TOTALCO2) as art_avg_TOTALCO2,

min(HEMATOCRIT) as art_min_HEMATOCRIT,
max(HEMATOCRIT) as art_max_HEMATOCRIT,
avg(HEMATOCRIT) as art_avg_HEMATOCRIT,

min(HEMOGLOBIN) as art_min_HEMOGLOBIN,
max(HEMOGLOBIN) as art_max_HEMOGLOBIN,
avg(HEMOGLOBIN) as art_avg_HEMOGLOBIN,

min(CARBOXYHEMOGLOBIN) as art_min_CARBOXYHEMOGLOBIN,
max(CARBOXYHEMOGLOBIN) as art_max_CARBOXYHEMOGLOBIN,
avg(CARBOXYHEMOGLOBIN) as art_avg_CARBOXYHEMOGLOBIN,

min(METHEMOGLOBIN) as art_min_METHEMOGLOBIN,
max(METHEMOGLOBIN) as art_max_METHEMOGLOBIN,
avg(METHEMOGLOBIN) as art_avg_METHEMOGLOBIN,

min(CHLORIDE) as art_min_CHLORIDE,
max(CHLORIDE) as art_max_CHLORIDE,
avg(CHLORIDE) as art_avg_CHLORIDE,

min(CALCIUM) as art_min_CALCIUM,
max(CALCIUM) as art_max_CALCIUM,
avg(CALCIUM) as art_avg_CALCIUM,

min(TEMPERATURE) as art_min_TEMPERATURE,
max(TEMPERATURE) as art_max_TEMPERATURE,
avg(TEMPERATURE) as art_avg_TEMPERATURE,

min(POTASSIUM) as art_min_POTASSIUM,
max(POTASSIUM) as art_max_POTASSIUM,
avg(POTASSIUM) as art_avg_POTASSIUM,

min(SODIUM) as art_min_SODIUM,
max(SODIUM) as art_max_SODIUM,
avg(SODIUM) as art_avg_SODIUM,

min(LACTATE) as art_min_LACTATE,
max(LACTATE) as art_max_LACTATE,
avg(LACTATE) as art_avg_LACTATE,

min(GLUCOSE) as art_min_GLUCOSE,
max(GLUCOSE) as art_max_GLUCOSE,
avg(GLUCOSE) as art_avg_GLUCOSE,

min(TIDALVOLUME) as art_min_TIDALVOLUME,
max(TIDALVOLUME) as art_max_TIDALVOLUME,
avg(TIDALVOLUME) as art_avg_TIDALVOLUME,

min(PEEP) as art_min_PEEP,
max(PEEP) as art_max_PEEP,
avg(PEEP) as art_avg_PEEP,

min(O2Flow) as art_min_O2Flow,
max(O2Flow) as art_max_O2Flow,
avg(O2Flow) as art_avg_O2Flow,

min(REQUIREDO2) as art_min_REQUIREDO2,
max(REQUIREDO2) as art_max_REQUIREDO2,
avg(REQUIREDO2) as art_avg_REQUIREDO2 from g_a
where SPECIMEN='ART'
group by subject_id, hadm_id, icustay_id