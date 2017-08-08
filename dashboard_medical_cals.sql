drop table dashboard_medical_cals;
create table dashboard_medical_cals as
SELECT
    medicals.control, medicals.date, medicals._id, medicals.id as patient_id,
    medicals.presionParadoAlta,
    medicals.presionParadoBaja,
    medicals.presionSentadoAlta,
    medicals.presionSentadoBaja,
    medicals.frecuencia,
    medicals.temperatura,
    medicals.perimetroAbdominal,
    medicals.vop,
    medicals.itbIzquierdo,
    medicals.itbDerecho,
    medicals.peso,
    medicals.altura,
    medicals.balanceNeuroMuscularT,
    medicals.balanceNeuroMuscular,
    medicals.balanceNeuroMuscularD,
    medicals.tiempoCincoM,
    medicals.fuma,
    medicals.satisfaccion,
    medicals.feliz,
    medicals.preocupacion,
    medicals.depresion,
    medicals.decaido,
    medicals.mets,
    medicals.movilidad,
    medicals.cuidadoPersonal,
    medicals.actividadesCotidianas,
    medicals.dolor,
    medicals.ansiedad,
    medicals.health,
    medicals.colesterolTotal,
    medicals.colesterolLDL,
    medicals.colesterolHDL,
    medicals.trigliceridos,
    medicals.creatinina,
    medicals.glicemia,
    AVG(colesterolTotal) as media_cl_total,
    STDDEV_POP(colesterolTotal)as des_cl_total,
    AVG(trigliceridos) as media_trigliceridos,
    STDDEV_POP(trigliceridos)as des_trigliceridos,
    AVG(colesterolLDL) as media_cl_ldl,
    STDDEV_POP(colesterolLDL)as des_cl_ldl,
    AVG(colesterolHDL) as media_cl_hdl,
    STDDEV_POP(colesterolHDL)as des_cl_hdl,
    AVG(creatinina) as media_creatininal,
    STDDEV_POP(creatinina)as des_creatinina,
	AVG(glicemia) as media_glicemia,
    STDDEV_POP(glicemia)as des_glicemia,
    medicalCal.capFunc AS  capcidad_funcional,
    case
  when medicalCal.emotional_welfare >= 0 and medicalCal.emotional_welfare < 1 then '0-1'
  when medicalCal.emotional_welfare >= 1 and medicalCal.emotional_welfare < 2 then '1-2'
  when medicalCal.emotional_welfare >= 2 and medicalCal.emotional_welfare < 3 then '2-3'
  when medicalCal.emotional_welfare >= 3 and medicalCal.emotional_welfare < 4 then '3-4'
  when medicalCal.emotional_welfare >= 4 and medicalCal.emotional_welfare < 5 then '4-5'
  when medicalCal.emotional_welfare >= 5 and medicalCal.emotional_welfare < 6 then '5-6'
  when medicalCal.emotional_welfare >= 6 and medicalCal.emotional_welfare < 7 then '6-7'
  when medicalCal.emotional_welfare >= 7 and medicalCal.emotional_welfare < 8 then '7-8'
  when medicalCal.emotional_welfare >= 8 and medicalCal.emotional_welfare < 9 then '8-9'
  when medicalCal.emotional_welfare >= 9 and medicalCal.emotional_welfare < 10 then '9-10'
      else 'null'
      end as bienestar,
      case
    when medicalCal.emotional_welfare >= 0 and medicalCal.emotional_welfare < 7 then '0-70'
    when medicalCal.emotional_welfare >= 6 and medicalCal.emotional_welfare < 110 then '70-100'
        else 'null'
        end as bienestarRangos,
      case
    when medicals.tiempoCincoM >= 0 and medicals.tiempoCincoM < 6 then '0-6'
    when medicals.tiempoCincoM >= 6 and medicals.tiempoCincoM < 110 then '6-60'
        else 'null'
        end as fragilidad,
    case
  when (medicals.presionParadoAlta+medicals.presionSentadoAlta)/2 < 140 then 'si'
  when (medicals.presionParadoAlta+medicals.presionSentadoAlta)/2 >= 140 then 'no'
    else ''
    end as presionAlta,
case
  when (medicals.colesterolLDL)/2 < 100 then 'si'
  when (medicals.colesterolLDL)/2 >= 100 then 'no'
    else ''
    end as LdlControlado,
    case
    when (medicals.presionParadoBaja+medicals.presionSentadoBaja)/2 < 90 then 'si'
    when (medicals.presionParadoBaja+medicals.presionSentadoBaja)/2 >= 90 then 'no'
    else ''
    end as presionBaja,
    case
  when frecuencia >= 0 and frecuencia < 40 then '0-40'
  when frecuencia >= 40 and frecuencia < 50 then '40-50'
  when frecuencia >= 50 and frecuencia < 60 then '50-60'
  when frecuencia >= 60 and frecuencia < 70 then '60-70'
  when frecuencia >= 70 and frecuencia < 80 then '70-80'
  when frecuencia >= 80 and frecuencia < 90 then '80-90'
  when frecuencia >= 90 and frecuencia < 100 then '90-100'
  when frecuencia >= 100 and frecuencia < 110 then '100-110'

      else 'null'
      end as frecuenciaRango,
    case
  when fx_reserve >= 0 and fx_reserve <= 10 then '0-10'
  when fx_reserve > 10 and fx_reserve <= 20 then '10-20'
  when fx_reserve > 20 and fx_reserve <= 30 then '20-30'
  when fx_reserve > 30 and fx_reserve <= 40 then '30-40'
  when fx_reserve > 40 and fx_reserve <= 50 then '40-50'
  when fx_reserve > 50 and fx_reserve <= 60 then '50-60'
  when fx_reserve > 60 and fx_reserve <= 70 then '60-70'
  when fx_reserve > 70 and fx_reserve <= 80 then '70-80'
  when fx_reserve > 80 and fx_reserve <= 90 then '80-90'
  when fx_reserve > 90 and fx_reserve <= 100 then '90-100'
      else 'null'
      end as reserva_funcional,
      case
  when medicals.itbIzquierdo >= 0 and medicals.itbIzquierdo <= 0.9 then '< 0.9'
  when medicals.itbIzquierdo > 0.9 and medicals.itbIzquierdo <= 1.2 then '0.9 - 1.2'
      else '> 1.2'
      end as indiceTobilloBrazo,
    fx_reserve as number_reserva_funcional,
    biological_age as edad_biologica,
    arterial_age as edad_arterial,
    medicalCal.vitality_index AS  vitalidad,
    medicalCal.fx_reserve AS  reserva,
    medicalCal.percent_lost_capacity AS  capacidad_perdida,
    medicalCal.vigor_neuromuscular AS  vigor_neuromuscular,
    medicalCal.arterial_function AS  funcion_arterial,
    medicalCal.satisfaction AS  satisfaction,
    medicalCal.emotional_balance AS balance_emocional,
    medicalCal.mets AS  total_mets,
    medicalCal.fisical_vigor AS vigor ,
    medicalCal.subclinic_risk AS riesgo_clinico,
    medicalCal.control as controlCal,
    @bmi := medicals.peso / POW((medicals.altura / 100), 2) as bmi,

    CASE
  WHEN medicals.colesterolTotal >= 0 AND medicals.colesterolTotal < 50 THEN '0-50'
  WHEN medicals.colesterolTotal >= 50 AND medicals.colesterolTotal < 100 THEN '50-100'
  WHEN medicals.colesterolTotal >= 100 AND medicals.colesterolTotal < 150 THEN '100-150'
  WHEN medicals.colesterolTotal >= 150 AND medicals.colesterolTotal < 200 THEN '150-200'
  WHEN medicals.colesterolTotal >= 200 AND medicals.colesterolTotal < 250 THEN '200-250'
  WHEN medicals.colesterolTotal >= 250 AND medicals.colesterolTotal < 300 THEN '250-300'
  WHEN medicals.colesterolTotal >= 300 AND medicals.colesterolTotal < 350 THEN '300-350'
  WHEN medicals.colesterolTotal >= 350 AND medicals.colesterolTotal < 500 THEN '350-500'
  END AS GrupoColesterolTotal,

  CASE
  WHEN medicals.colesterolHDL >= 0 AND medicals.colesterolHDL  < 20 THEN '0-20'
  WHEN medicals.colesterolHDL >= 20 AND medicals.colesterolHDL  < 30 THEN '20-30'
  WHEN medicals.colesterolHDL >= 30 AND medicals.colesterolHDL  < 40 THEN '30-40'
  WHEN medicals.colesterolHDL >= 40 AND medicals.colesterolHDL  < 50 THEN '40-50'
  WHEN medicals.colesterolHDL >= 50 AND medicals.colesterolHDL  < 60 THEN '50-60'
  WHEN medicals.colesterolHDL >= 60 AND medicals.colesterolHDL  < 70 THEN '60-70'
  WHEN medicals.colesterolHDL >= 70 AND medicals.colesterolHDL  < 80 THEN '70-80'
  WHEN medicals.colesterolHDL >= 80 AND medicals.colesterolHDL  < 120 THEN '80-120'
  END AS GrupoColesterolHDL,

  CASE
  WHEN medicals.colesterolLDL >= 0 AND medicals.colesterolLDL < 50 THEN '0-50'
  WHEN medicals.colesterolLDL >= 50 AND medicals.colesterolLDL < 70 THEN '50-70'
  WHEN medicals.colesterolLDL >= 70 AND medicals.colesterolLDL < 90 THEN '70-90'
  WHEN medicals.colesterolLDL >= 90 AND medicals.colesterolLDL < 110 THEN '90-110'
  WHEN medicals.colesterolLDL >= 110 AND medicals.colesterolLDL < 130 THEN '110-130'
  WHEN medicals.colesterolLDL >= 130 AND medicals.colesterolLDL < 150 THEN '130-150'
  WHEN medicals.colesterolLDL >= 150 AND medicals.colesterolLDL < 170 THEN '150-170'
  WHEN medicals.colesterolLDL >= 170 AND medicals.colesterolLDL < 190 THEN '170-190'
  WHEN medicals.colesterolLDL >= 190 AND medicals.colesterolLDL < 300 THEN '190-300'
  END AS GrupoColesterolLDL,

  CASE
  WHEN medicals.trigliceridos >= 0 AND medicals.trigliceridos < 100 THEN '0-100'
  WHEN medicals.trigliceridos >= 100 AND medicals.trigliceridos < 200 THEN '100-200'
  WHEN medicals.trigliceridos >= 200 AND medicals.trigliceridos < 300 THEN '200-300'
  WHEN medicals.trigliceridos >= 300 AND medicals.trigliceridos < 400 THEN '300-400'
  WHEN medicals.trigliceridos >= 400 AND medicals.trigliceridos < 500 THEN '400-500'
  WHEN medicals.trigliceridos >= 500 AND medicals.trigliceridos < 2000 THEN '500-2000'
  END AS GrupoTrigliceridos,

  CASE
  WHEN medicals.creatinina >= 0 AND medicals.creatinina < 0.5 THEN '0-0.5'
  WHEN medicals.creatinina >= 0.5 AND medicals.creatinina < 0.7 THEN '0.5-0.7'
  WHEN medicals.creatinina >= 0.7 AND medicals.creatinina < 0.9 THEN '0.7-0.9'
  WHEN medicals.creatinina >= 0.9 AND medicals.creatinina < 1.1 THEN '0.9-1.1'
  WHEN medicals.creatinina >= 1.1 AND medicals.creatinina < 1.3 THEN '1.1-1.3'
  WHEN medicals.creatinina >= 1.3 AND medicals.creatinina < 1.5 THEN '1.3-1.5'
  WHEN medicals.creatinina >= 1.5 AND medicals.creatinina < 1.7 THEN '1.5-1.7'
  WHEN medicals.creatinina >= 1.7 AND medicals.creatinina < 1.9 THEN '1.7-1.9'
  WHEN medicals.creatinina >= 2 AND medicals.creatinina < 10 THEN '2-10'
  END AS GrupoCreatinina,

  CASE
  WHEN medicals.glicemia >= 0 AND medicals.glicemia < 50 THEN '0-50'
  WHEN medicals.glicemia >= 50 AND medicals.glicemia < 100 THEN '50-100'
  WHEN medicals.glicemia >= 100 AND medicals.glicemia < 150 THEN '100-150'
  WHEN medicals.glicemia >= 150 AND medicals.glicemia < 200 THEN '150-200'
  WHEN medicals.glicemia >= 200 AND medicals.glicemia < 800 THEN '200-800'
  END AS GrupoGlicemia,

    case
  when @bmi >= 0 and @bmi <= 18.5 then '0-18.5'
  when @bmi > 18.5 and @bmi <= 25 then '18.5-25'
  when @bmi > 25 and @bmi <= 35 then '25-35'
  when @bmi > 35 and @bmi <= 40 then '35-40'
  when @bmi > 40 and @bmi <= 100 then '40-100'
      else ''
      end as grupoIMCs
FROM
    medicals
    join medicalCal
    on medicalCal.id = medicals.id
    and medicalCal.control = medicals.control
GROUP BY medicals.id , medicals.control DESC;