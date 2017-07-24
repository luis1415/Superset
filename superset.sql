show tables;

SELECT  * FROM diabetes_dashboard_float;

SELECT * FROM diabetes;

SELECT * FROM edades;

SELECT *
FROM dashboard_cals;

SELECT * FROM medical_dashboard;

DESCRIBE diabetes_dashboard;
DESCRIBE medical_dashboard;

create table diabetes_dashboard
(
	patient_diabetes_id varchar(250) null,
	pieDiabetico varchar(100) null,
	date_diab varchar(100) null,
	diabetes_control varchar(30) null,
	metabolico varchar(10) null,
	vascularPeriferico varchar(10) null,
	cerebroVascular varchar(10) null,
	corazon varchar(10) null,
	neuropatia varchar(10) null,
	rinon varchar(10) null,
	ojos varchar(10) null,
	claseFuncional varchar(100) null,
	clasificacionFase varchar(100) null,
	riesgoHospitalizacionRango varchar(6) null,
	riesgoPromedioRango varchar(6) null,
	tfgRango varchar(6) null,
	feviRango varchar(6) null,
	hba1cRango varchar(7) null,
	riesgoAcvRango varchar(7) null,
	riesgoIccRango varchar(7) null,
	riesgoIAMRango varchar(7) null,
	riesgoAnginaRango varchar(7) null,
	riesgoReeventoAcvRango varchar(7) null,
	riesgoReeventoAnginaRango varchar(7) null,
	riesgoReeventoImRango varchar(7) null,
	riesgoReeventoIccRango varchar(7) null,
	PuntajeComplejidadRango varchar(5) null,
	genero varchar(5) null,
	fechaNacimiento datetime null,
	edad bigint(21) null,
	str_edad varchar(10) null,
	id varchar(250) null,
	patient_date datetime null,
	nombre_eps varchar(500) null,
	nombre_tipo varchar(500) null,
	diabetico varchar(2) default '' not null,
	nombre_grupo varchar(500) null,
	grupoedades varchar(5) default '' not null,
	supervivenciaAlAno varchar(6) not null
)
;

