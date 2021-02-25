;Header and description

(define (domain domain_hospital)

;remove requirements that are not needed
(:requirements :strips :typing :negative-preconditions)

(:types localizacion - object
        hospital - localizacion
        paciente - object
        ambulancia - object
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
	(enlace ?l1 - localizacion ?l2 - localizacion)
	(paciente_en_ubicacion ?p - paciente ?l - localizacion)
	(paciente_en_abulancia ?p - paciente ?a - ambulancia)
	(paciente_en_hospital ?p - paciente ?h - hospital)
	(hospital_en ?h - hospital ?l - localizacion)
	(ambulancia_en ?a - ambulancia ?l - localizacion)
	(ambulancia_lleva_paciente ?a - ambulancia)
)

(:action conducir
	:parameters (?a - ambulancia ?origen - localizacion ?destino - localizacion)
	:precondition (and
		(ambulancia_en ?a ?origen)
		(enlace ?origen ?destino)
	 )
	:effect (and
		(ambulancia_en ?a ?destino)
		(not(ambulancia_en ?a ?origen))
	 )
)

(:action recoger_paciente
	:parameters (?a - ambulancia ?p - paciente ?l - localizacion)
	:precondition (and
		(ambulancia_en ?a ?l)
		(paciente_en_ubicacion ?p ?l)
		(not(paciente_en_abulancia ?p ?a))
		(not(ambulancia_lleva_paciente ?a))
	 )
	:effect (and
		(not(paciente_en_ubicacion ?p ?l))
		(paciente_en_abulancia ?p ?a)
		(ambulancia_lleva_paciente ?a)
	 )
)

(:action dejar_paciente
	:parameters (?a - ambulancia ?p - paciente ?l - localizacion ?h - hospital)
	:precondition (and
		(ambulancia_en ?a ?l)
		(hospital_en ?h ?l)
		(paciente_en_abulancia ?p ?a)
		(ambulancia_lleva_paciente ?a)


	 )
	:effect (and
		(paciente_en_hospital ?p ?h)
		(not(paciente_en_abulancia ?p ?a))
		(not(ambulancia_lleva_paciente ?a))
	 )
)



)