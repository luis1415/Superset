drop table medical_dashboard;
CREATE TABLE medical_dashboard AS
SELECT
genero,
patients.fechaNacimiento,
@edad := TIMESTAMPDIFF(YEAR,
    patients.fechaNacimiento,
    CURDATE()) AS edad,
    Convert(@edad, Char(10)) as str_edad,
patients.id,
patients.estado,
patients.muerto,
patients.codigo_cie_muerte,
patients.descripcion_codigo_cie,
patients.date patient_date,
dashboard_medical_cals.*,
eps.nombre AS nombre_eps,
types.nombre AS nombre_tipo,
case
when diabetico = 1 then 'si'
else 'no'
end as diabetes_count,
groups.nombre AS nombre_grupo,
@edadDiffB :=  dashboard_medical_cals.edad_biologica - @edad  as diffEdadB,
@edadDiffA :=  dashboard_medical_cals.edad_arterial - @edad  as diffEdadA,
case
when @edadDiffB >= 6 then '6-20'
when @edadDiffB < 6 then '0-6'
else ''
end as GrupoEdadDiffB,
case
when @edadDiffA >= 6 then '6-20'
when @edadDiffA < 6 then '0-6'
else ''
end as GrupoEdadDiffA,
case
when @edad >= 0 and @edad < 30 then '0-30'
when @edad >= 30 and @edad < 40 then '30-40'
when @edad >= 40 and @edad < 50 then '40-50'
when @edad >= 50 and @edad < 60 then '50-60'
when @edad >= 60 and @edad < 70 then '60-70'
when @edad >= 70 and @edad < 80 then '70-80'
when @edad >= 80 and @edad < 90 then '80-90'
when @edad >= 90 and @edad < 100 then '90-100'
when @edad >= 100 and @edad < 110 then '100-110'
else ''
end as grupoEdad


FROM
patients
    JOIN
dashboard_medical_cals ON dashboard_medical_cals.patient_id = patients.id
    JOIN
eps ON patients.eps = eps._id
    JOIN
groups on groups._id = patients.grupo
    join
types ON types._id = patients.type;