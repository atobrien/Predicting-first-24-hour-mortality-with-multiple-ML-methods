WITH labs AS 
      (
      SELECT 
      l.*
      FROM `physionet-data.mimiciii_derived.labsfirstday` l
      ),
      
      oasis AS 
      (
      SELECT 
      o.*
      FROM `physionet-data.mimiciii_derived.oasis` o
      ),
      
      a AS 
      (
      SELECT 
      a.subject_id,
      a.hadm_id,
      a.icustay_id,
      MIN(PO2) as PO2_min,
      MAX(PO2) as PO2_max,
      AVG(PO2) as PO2_avg,
      MIN(spo2) as SPO2_min,
      MAX(spo2) as SPO2_max,
      AVG(spo2) as SPO2_avg,
      MIN(PCO2) as PCO2_min,
      MAX(PCO2) as PCO2_max,
      AVG(PCO2) as PCO2_avg,
      MIN(PH) as PH_min,
      MAX(PH) as PH_max,
      AVG(PH) as PH_avg,
      MIN(TOTALCO2) as TOTALCO2_min,
      MAX(TOTALCO2) as TOTALCO2_max,
      AVG(TOTALCO2) as TOTALCO2_avg,
      AVG(HEMATOCRIT) as HEMATOCRIT_avg,
      AVG(HEMATOCRIT) as HEMOGLOBIN_avg,
      MIN(CARBOXYHEMOGLOBIN) as CARBOXYHEMOGLOBIN_min,
      MAX(CARBOXYHEMOGLOBIN) as CARBOXYHEMOGLOBIN_max,
      AVG(CARBOXYHEMOGLOBIN) as CARBOXYHEMOGLOBIN_avg,
      MIN(METHEMOGLOBIN) as METHEMOGLOBIN_min,
      MAX(METHEMOGLOBIN) as METHEMOGLOBIN_max,
      AVG(METHEMOGLOBIN) as METHEMOGLOBIN_avg,
      AVG(CHLORIDE) as CHLORIDE_avg,
      MIN(CALCIUM) as CALCIUM_min,
      MAX(CALCIUM) as CALCIUM_max,
      AVG(CALCIUM) as CALCIUM_avg,
      MIN(TEMPERATURE) as TEMPERATURE_min,
      MAX(TEMPERATURE) as TEMPERATURE_max,
      AVG(POTASSIUM) as POTASSIUM_avg,
      AVG(SODIUM) as SODIUM_avg,
      AVG(LACTATE) as LACTATE_avg,
      AVG(GLUCOSE) as GLUCOSE_avg,
      AVG(INTUBATED) as INTUBATION,
      MIN(BASEEXCESS) as BASEEXCESS_min,
      MAX(BASEEXCESS) as BASEEXCESS_max,
      AVG(BASEEXCESS) as BASEEXCESS_avg,
      MIN(PaO2FiO2) as PaO2FiO2_min,
      MAX(PaO2FiO2) as PaO2FiO2_max,
      AVG(PaO2FiO2) as PaO2FiO2_avg
      FROM `physionet-data.mimiciii_derived.bloodgasfirstdayarterial` a
      GROUP BY icustay_id, hadm_id,subject_id
      ),      
         
      v AS
      (
      SELECT 
      v.subject_id,
      v.hadm_id,
      v.icustay_id,      
      v.HeartRate_Min AS HeartRate_Min,
      v.HeartRate_Max AS HeartRate_Max,
      v.HeartRate_Mean AS HeartRate_Mean,
      v.SysBP_Min AS SysBP_Min,
      v.SysBP_Max AS SysBP_Max,
      v.SysBP_Mean AS SysBP_Mean,
      v.DiasBP_Min AS DiasBP_Min,
      v.DiasBP_Max AS DiasBP_Max,
      v.DiasBP_Mean AS DiasBP_Mean,
      v.RespRate_Min AS RespRate_Min,
      v.RespRate_Max AS RespRate_Max,
      v.RespRate_Mean AS RespRate_Mean
      FROM `physionet-data.mimiciii_derived.vitalsfirstday` v
      ),
      
      g AS
      (
      SELECT
      gcs.*
      FROM `physionet-data.mimiciii_derived.bloodgasfirstdayarterial` gcs
      ),
	  
	  g_1 AS
	  (
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
	  ),
	  
	  g_2 as 
	  (
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
	  ),
      
	  g_3 as
	  (
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
	  ),
	  
	  g_4 as
	  (
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
	  ),
	  
	  g_5 as
	  (
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
	  ),
	  
      detail AS
      (
      SELECT
      id.subject_id,
      id.hadm_id,
      id.icustay_id,
      id.gender,
      id.los_hospital,
      id.admission_age,
      id.admission_type,
      id.intime,
      id.outtime,
      id.los_icu,
      id.first_icu_stay
      FROM
      `physionet-data.mimiciii_derived.icustay_detail` id
      ),
      admissions as 
      (
      SELECT *
      FROM `physionet-data.mimiciii_clinical.admissions`             
      )
      
      
--aggregated pull of data
SELECT *
FROM labs,

LEFT JOIN admissions 
USING (subject_id, hadm_id)

LEFT JOIN oasis 
USING (subject_id, hadm_id, icustay_id)

LEFT JOIN a 
USING (subject_id, hadm_id, icustay_id)

LEFT JOIN v
USING (subject_id, hadm_id, icustay_id)

LEFT JOIN g_1
USING (subject_id, hadm_id, icustay_id)
LEFT JOIN g_2
USING (subject_id, hadm_id, icustay_id)
LEFT JOIN g_3
USING (subject_id, hadm_id, icustay_id)
LEFT JOIN g_4
USING (subject_id, hadm_id, icustay_id)
LEFT JOIN g_5
USING (subject_id, hadm_id, icustay_id)

LEFT JOIN detail
USING (subject_id, hadm_id, icustay_id)
