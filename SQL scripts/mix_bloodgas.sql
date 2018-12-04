with g_m AS
      (
      SELECT
      gcs.*
      FROM `physionet-data.mimiciii_derived.bloodgasfirstdayarterial` gcs
      )
select subject_id, hadm_id, icustay_id,

min(SO2) as mix_min_SO2,
max(SO2) as mix_max_SO2,
avg(SO2) as mix_avg_SO2,

min(spo2) as mix_min_spo2,
max(spo2) as mix_max_spo2,
avg(spo2) as mix_avg_spo2,

min(PO2) as mix_min_PO2,
max(PO2) as mix_max_PO2,
avg(PO2) as mix_avg_PO2,

min(PCO2) as mix_min_PCO2,
max(PCO2) as mix_max_PCO2,
avg(PCO2) as mix_avg_PCO2,

min(fio2_chartevents) as mix_min_fio2_chartevents,
max(fio2_chartevents) as mix_max_fio2_chartevents,
avg(fio2_chartevents) as mix_avg_fio2_chartevents,

min(FIO2) as mix_min_FIO2,
max(FIO2) as mix_max_FIO2,
avg(FIO2) as mix_avg_FIO2,

min(AADO2) as mix_min_AADO2,
max(AADO2) as mix_max_AADO2,
avg(AADO2) as mix_avg_AADO2,

min(AADO2_calc) as mix_min_AADO2_calc,
max(AADO2_calc) as mix_max_AADO2_calc,
avg(AADO2_calc) as mix_avg_AADO2_calc,

min(PaO2FiO2) as mix_min_PaO2FiO2,
max(PaO2FiO2) as mix_max_PaO2FiO2,
avg(PaO2FiO2) as mix_avg_PaO2FiO2,

min(BASEEXCESS) as mix_min_BASEEXCESS,
max(BASEEXCESS) as mix_max_BASEEXCESS,
avg(BASEEXCESS) as mix_avg_BASEEXCESS,

min(BICARBONATE) as mix_min_BICARBONATE,
max(BICARBONATE) as mix_max_BICARBONATE,
avg(BICARBONATE) as mix_avg_BICARBONATE,

min(TOTALCO2) as mix_min_TOTALCO2,
max(TOTALCO2) as mix_max_TOTALCO2,
avg(TOTALCO2) as mix_avg_TOTALCO2,

min(HEMATOCRIT) as mix_min_HEMATOCRIT,
max(HEMATOCRIT) as mix_max_HEMATOCRIT,
avg(HEMATOCRIT) as mix_avg_HEMATOCRIT,

min(HEMOGLOBIN) as mix_min_HEMOGLOBIN,
max(HEMOGLOBIN) as mix_max_HEMOGLOBIN,
avg(HEMOGLOBIN) as mix_avg_HEMOGLOBIN,

min(CARBOXYHEMOGLOBIN) as mix_min_CARBOXYHEMOGLOBIN,
max(CARBOXYHEMOGLOBIN) as mix_max_CARBOXYHEMOGLOBIN,
avg(CARBOXYHEMOGLOBIN) as mix_avg_CARBOXYHEMOGLOBIN,

min(METHEMOGLOBIN) as mix_min_METHEMOGLOBIN,
max(METHEMOGLOBIN) as mix_max_METHEMOGLOBIN,
avg(METHEMOGLOBIN) as mix_avg_METHEMOGLOBIN,

min(CHLORIDE) as mix_min_CHLORIDE,
max(CHLORIDE) as mix_max_CHLORIDE,
avg(CHLORIDE) as mix_avg_CHLORIDE,

min(CALCIUM) as mix_min_CALCIUM,
max(CALCIUM) as mix_max_CALCIUM,
avg(CALCIUM) as mix_avg_CALCIUM,

min(TEMPERATURE) as mix_min_TEMPERATURE,
max(TEMPERATURE) as mix_max_TEMPERATURE,
avg(TEMPERATURE) as mix_avg_TEMPERATURE,

min(POTASSIUM) as mix_min_POTASSIUM,
max(POTASSIUM) as mix_max_POTASSIUM,
avg(POTASSIUM) as mix_avg_POTASSIUM,

min(SODIUM) as mix_min_SODIUM,
max(SODIUM) as mix_max_SODIUM,
avg(SODIUM) as mix_avg_SODIUM,

min(LACTATE) as mix_min_LACTATE,
max(LACTATE) as mix_max_LACTATE,
avg(LACTATE) as mix_avg_LACTATE,

min(GLUCOSE) as mix_min_GLUCOSE,
max(GLUCOSE) as mix_max_GLUCOSE,
avg(GLUCOSE) as mix_avg_GLUCOSE,

min(TIDALVOLUME) as mix_min_TIDALVOLUME,
max(TIDALVOLUME) as mix_max_TIDALVOLUME,
avg(TIDALVOLUME) as mix_avg_TIDALVOLUME,

min(PEEP) as mix_min_PEEP,
max(PEEP) as mix_max_PEEP,
avg(PEEP) as mix_avg_PEEP,

min(O2Flow) as mix_min_O2Flow,
max(O2Flow) as mix_max_O2Flow,
avg(O2Flow) as mix_avg_O2Flow,

min(REQUIREDO2) as mix_min_REQUIREDO2,
max(REQUIREDO2) as mix_max_REQUIREDO2,
avg(REQUIREDO2) as mix_avg_REQUIREDO2 from g_m
where SPECIMEN='MIX'
group by subject_id, hadm_id, icustay_id