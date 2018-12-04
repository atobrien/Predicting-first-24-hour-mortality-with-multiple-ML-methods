with g_v AS
      (
      SELECT
      gcs.*
      FROM `physionet-data.mimiciii_derived.bloodgasfirstdayarterial` gcs
      )
select subject_id, hadm_id, icustay_id,

min(SO2) as ven_min_SO2,
max(SO2) as ven_max_SO2,
avg(SO2) as ven_avg_SO2,

min(spo2) as ven_min_spo2,
max(spo2) as ven_max_spo2,
avg(spo2) as ven_avg_spo2,

min(PO2) as ven_min_PO2,
max(PO2) as ven_max_PO2,
avg(PO2) as ven_avg_PO2,

min(PCO2) as ven_min_PCO2,
max(PCO2) as ven_max_PCO2,
avg(PCO2) as ven_avg_PCO2,

min(fio2_chartevents) as ven_min_fio2_chartevents,
max(fio2_chartevents) as ven_max_fio2_chartevents,
avg(fio2_chartevents) as ven_avg_fio2_chartevents,

min(FIO2) as ven_min_FIO2,
max(FIO2) as ven_max_FIO2,
avg(FIO2) as ven_avg_FIO2,

min(AADO2) as ven_min_AADO2,
max(AADO2) as ven_max_AADO2,
avg(AADO2) as ven_avg_AADO2,

min(AADO2_calc) as ven_min_AADO2_calc,
max(AADO2_calc) as ven_max_AADO2_calc,
avg(AADO2_calc) as ven_avg_AADO2_calc,

min(PaO2FiO2) as ven_min_PaO2FiO2,
max(PaO2FiO2) as ven_max_PaO2FiO2,
avg(PaO2FiO2) as ven_avg_PaO2FiO2,

min(BASEEXCESS) as ven_min_BASEEXCESS,
max(BASEEXCESS) as ven_max_BASEEXCESS,
avg(BASEEXCESS) as ven_avg_BASEEXCESS,

min(BICARBONATE) as ven_min_BICARBONATE,
max(BICARBONATE) as ven_max_BICARBONATE,
avg(BICARBONATE) as ven_avg_BICARBONATE,

min(TOTALCO2) as ven_min_TOTALCO2,
max(TOTALCO2) as ven_max_TOTALCO2,
avg(TOTALCO2) as ven_avg_TOTALCO2,

min(HEMATOCRIT) as ven_min_HEMATOCRIT,
max(HEMATOCRIT) as ven_max_HEMATOCRIT,
avg(HEMATOCRIT) as ven_avg_HEMATOCRIT,

min(HEMOGLOBIN) as ven_min_HEMOGLOBIN,
max(HEMOGLOBIN) as ven_max_HEMOGLOBIN,
avg(HEMOGLOBIN) as ven_avg_HEMOGLOBIN,

min(CARBOXYHEMOGLOBIN) as ven_min_CARBOXYHEMOGLOBIN,
max(CARBOXYHEMOGLOBIN) as ven_max_CARBOXYHEMOGLOBIN,
avg(CARBOXYHEMOGLOBIN) as ven_avg_CARBOXYHEMOGLOBIN,

min(METHEMOGLOBIN) as ven_min_METHEMOGLOBIN,
max(METHEMOGLOBIN) as ven_max_METHEMOGLOBIN,
avg(METHEMOGLOBIN) as ven_avg_METHEMOGLOBIN,

min(CHLORIDE) as ven_min_CHLORIDE,
max(CHLORIDE) as ven_max_CHLORIDE,
avg(CHLORIDE) as ven_avg_CHLORIDE,

min(CALCIUM) as ven_min_CALCIUM,
max(CALCIUM) as ven_max_CALCIUM,
avg(CALCIUM) as ven_avg_CALCIUM,

min(TEMPERATURE) as ven_min_TEMPERATURE,
max(TEMPERATURE) as ven_max_TEMPERATURE,
avg(TEMPERATURE) as ven_avg_TEMPERATURE,

min(POTASSIUM) as ven_min_POTASSIUM,
max(POTASSIUM) as ven_max_POTASSIUM,
avg(POTASSIUM) as ven_avg_POTASSIUM,

min(SODIUM) as ven_min_SODIUM,
max(SODIUM) as ven_max_SODIUM,
avg(SODIUM) as ven_avg_SODIUM,

min(LACTATE) as ven_min_LACTATE,
max(LACTATE) as ven_max_LACTATE,
avg(LACTATE) as ven_avg_LACTATE,

min(GLUCOSE) as ven_min_GLUCOSE,
max(GLUCOSE) as ven_max_GLUCOSE,
avg(GLUCOSE) as ven_avg_GLUCOSE,

min(TIDALVOLUME) as ven_min_TIDALVOLUME,
max(TIDALVOLUME) as ven_max_TIDALVOLUME,
avg(TIDALVOLUME) as ven_avg_TIDALVOLUME,

min(PEEP) as ven_min_PEEP,
max(PEEP) as ven_max_PEEP,
avg(PEEP) as ven_avg_PEEP,

min(O2Flow) as ven_min_O2Flow,
max(O2Flow) as ven_max_O2Flow,
avg(O2Flow) as ven_avg_O2Flow,

min(REQUIREDO2) as ven_min_REQUIREDO2,
max(REQUIREDO2) as ven_max_REQUIREDO2,
avg(REQUIREDO2) as ven_avg_REQUIREDO2 from g_v
where SPECIMEN='VEN'
group by subject_id, hadm_id, icustay_id