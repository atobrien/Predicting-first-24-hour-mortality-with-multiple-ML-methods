with g_n AS
      (
      SELECT
      gcs.*
      FROM `physionet-data.mimiciii_derived.bloodgasfirstdayarterial` gcs
      )
select subject_id, hadm_id, icustay_id,

min(SO2) as null_min_SO2,
max(SO2) as null_max_SO2,
avg(SO2) as null_avg_SO2,

min(spo2) as null_min_spo2,
max(spo2) as null_max_spo2,
avg(spo2) as null_avg_spo2,

min(PO2) as null_min_PO2,
max(PO2) as null_max_PO2,
avg(PO2) as null_avg_PO2,

min(PCO2) as null_min_PCO2,
max(PCO2) as null_max_PCO2,
avg(PCO2) as null_avg_PCO2,

min(fio2_chartevents) as null_min_fio2_chartevents,
max(fio2_chartevents) as null_max_fio2_chartevents,
avg(fio2_chartevents) as null_avg_fio2_chartevents,

min(FIO2) as null_min_FIO2,
max(FIO2) as null_max_FIO2,
avg(FIO2) as null_avg_FIO2,

min(AADO2) as null_min_AADO2,
max(AADO2) as null_max_AADO2,
avg(AADO2) as null_avg_AADO2,

min(AADO2_calc) as null_min_AADO2_calc,
max(AADO2_calc) as null_max_AADO2_calc,
avg(AADO2_calc) as null_avg_AADO2_calc,

min(PaO2FiO2) as null_min_PaO2FiO2,
max(PaO2FiO2) as null_max_PaO2FiO2,
avg(PaO2FiO2) as null_avg_PaO2FiO2,

min(BASEEXCESS) as null_min_BASEEXCESS,
max(BASEEXCESS) as null_max_BASEEXCESS,
avg(BASEEXCESS) as null_avg_BASEEXCESS,

min(BICARBONATE) as null_min_BICARBONATE,
max(BICARBONATE) as null_max_BICARBONATE,
avg(BICARBONATE) as null_avg_BICARBONATE,

min(TOTALCO2) as null_min_TOTALCO2,
max(TOTALCO2) as null_max_TOTALCO2,
avg(TOTALCO2) as null_avg_TOTALCO2,

min(HEMATOCRIT) as null_min_HEMATOCRIT,
max(HEMATOCRIT) as null_max_HEMATOCRIT,
avg(HEMATOCRIT) as null_avg_HEMATOCRIT,

min(HEMOGLOBIN) as null_min_HEMOGLOBIN,
max(HEMOGLOBIN) as null_max_HEMOGLOBIN,
avg(HEMOGLOBIN) as null_avg_HEMOGLOBIN,

min(CARBOXYHEMOGLOBIN) as null_min_CARBOXYHEMOGLOBIN,
max(CARBOXYHEMOGLOBIN) as null_max_CARBOXYHEMOGLOBIN,
avg(CARBOXYHEMOGLOBIN) as null_avg_CARBOXYHEMOGLOBIN,

min(METHEMOGLOBIN) as null_min_METHEMOGLOBIN,
max(METHEMOGLOBIN) as null_max_METHEMOGLOBIN,
avg(METHEMOGLOBIN) as null_avg_METHEMOGLOBIN,

min(CHLORIDE) as null_min_CHLORIDE,
max(CHLORIDE) as null_max_CHLORIDE,
avg(CHLORIDE) as null_avg_CHLORIDE,

min(CALCIUM) as null_min_CALCIUM,
max(CALCIUM) as null_max_CALCIUM,
avg(CALCIUM) as null_avg_CALCIUM,

min(TEMPERATURE) as null_min_TEMPERATURE,
max(TEMPERATURE) as null_max_TEMPERATURE,
avg(TEMPERATURE) as null_avg_TEMPERATURE,

min(POTASSIUM) as null_min_POTASSIUM,
max(POTASSIUM) as null_max_POTASSIUM,
avg(POTASSIUM) as null_avg_POTASSIUM,

min(SODIUM) as null_min_SODIUM,
max(SODIUM) as null_max_SODIUM,
avg(SODIUM) as null_avg_SODIUM,

min(LACTATE) as null_min_LACTATE,
max(LACTATE) as null_max_LACTATE,
avg(LACTATE) as null_avg_LACTATE,

min(GLUCOSE) as null_min_GLUCOSE,
max(GLUCOSE) as null_max_GLUCOSE,
avg(GLUCOSE) as null_avg_GLUCOSE,

min(TIDALVOLUME) as null_min_TIDALVOLUME,
max(TIDALVOLUME) as null_max_TIDALVOLUME,
avg(TIDALVOLUME) as null_avg_TIDALVOLUME,

min(PEEP) as null_min_PEEP,
max(PEEP) as null_max_PEEP,
avg(PEEP) as null_avg_PEEP,

min(O2Flow) as null_min_O2Flow,
max(O2Flow) as null_max_O2Flow,
avg(O2Flow) as null_avg_O2Flow,

min(REQUIREDO2) as null_min_REQUIREDO2,
max(REQUIREDO2) as null_max_REQUIREDO2,
avg(REQUIREDO2) as null_avg_REQUIREDO2 from g_n
where SPECIMEN is null
group by subject_id, hadm_id, icustay_id