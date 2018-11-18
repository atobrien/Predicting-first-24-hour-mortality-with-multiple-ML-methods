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
      
      fl AS 
      (
      SELECT 
      a.subject_id,
      a.hadm_id,
      a.icustay_id,
      FIRST_VALUE(PO2) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_PO2,
      LAST_VALUE(PO2) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_PO2,
      FIRST_VALUE(spo2) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_SPO2,
      LAST_VALUE(spo2) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_SPO2,
      FIRST_VALUE(PCO2) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_PCO2,
      LAST_VALUE(PCO2) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_PCO2,
      FIRST_VALUE(PH) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_PH,
      LAST_VALUE(PH) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_PH,
      FIRST_VALUE(TOTALCO2) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_TOTALCO2,
      LAST_VALUE(TOTALCO2) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_TOTALCO2,
      FIRST_VALUE(HEMATOCRIT) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_HEMATOCRIT,
      LAST_VALUE(HEMATOCRIT) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_HEMATOCRIT,
      FIRST_VALUE(CARBOXYHEMOGLOBIN) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_CARBOXYHEMOGLOBIN,
      LAST_VALUE(CARBOXYHEMOGLOBIN) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_CARBOXYHEMOGLOBIN,
      FIRST_VALUE(METHEMOGLOBIN) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_METHEMOGLOBIN,
      LAST_VALUE(METHEMOGLOBIN) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_METHEMOGLOBIN,
      FIRST_VALUE(CHLORIDE) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_CHLORIDE,
      LAST_VALUE(CHLORIDE) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_CHLORIDE,
      FIRST_VALUE(CALCIUM) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_CALCIUM,
      LAST_VALUE(CALCIUM) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_CALCIUM,
      FIRST_VALUE(TEMPERATURE) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_TEMP,
      LAST_VALUE(TEMPERATURE) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_TEMP,
      FIRST_VALUE(POTASSIUM) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_POTASSIUM,
      LAST_VALUE(POTASSIUM) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_POTASSIUM,
      FIRST_VALUE(SODIUM) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_SODIUM,
      LAST_VALUE(SODIUM) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_SODIUM, 
      FIRST_VALUE(LACTATE) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_LACTATE,
      LAST_VALUE(LACTATE) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_LACTATE,   
      FIRST_VALUE(GLUCOSE) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_GLUCOSE,
      LAST_VALUE(GLUCOSE) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_GLUCOSE,      
      FIRST_VALUE(BASEEXCESS) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_BASEEXCESS,
      LAST_VALUE(BASEEXCESS) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_BASEEXCESS,
      FIRST_VALUE(PaO2FiO2) OVER (PARTITION BY icustay_id ORDER BY charttime) AS FIRST_PaO2FiO2,
      LAST_VALUE(PaO2FiO2) OVER (PARTITION BY icustay_id ORDER BY charttime) AS LAST_PaO2FiO2
      FROM `physionet-data.mimiciii_derived.bloodgasfirstdayarterial` a
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
      id.los_icu,
      id.first_icu_stay
      FROM
      `physionet-data.mimiciii_derived.icustay_detail` id
      )
      

SELECT *
FROM labs

JOIN oasis 
USING (subject_id, hadm_id, icustay_id)
JOIN a 
USING (subject_id, hadm_id, icustay_id)
JOIN v
USING (subject_id, hadm_id, icustay_id)
JOIN g
USING (subject_id, hadm_id, icustay_id)
JOIN fl
USING (subject_id, hadm_id, icustay_id)
JOIN detail
USING (subject_id, hadm_id, icustay_id)
