(define (problem problema_hospital1) (:domain domain_hospital)
(:objects 
    Ambulancia1 - ambulancia
    Paciente1 - paciente
    Paciente2 - paciente
    L1 - localizacion
    L2 - localizacion
    L3 - localizacion
    L4 - localizacion
    Hospital - hospital

)

(:init
    
    (paciente_en_ubicacion Paciente1 L4)
    (paciente_en_ubicacion Paciente2 L3)
    (not(paciente_en_hospital Paciente1 Hospital))
    (not(paciente_en_hospital Paciente2 Hospital))
    (not(paciente_en_abulancia Paciente1 Ambulancia1))
    (not(paciente_en_abulancia Paciente2 Ambulancia1))

    (enlace L1 L2) (enlace L2 L4) (enlace L4 L3)
    (enlace L2 L1) (enlace L4 L2) (enlace L3 L4)

    (ambulancia_en Ambulancia1 L1)
    (not(ambulancia_lleva_paciente Ambulancia1))
    (hospital_en Hospital L1)
)

(:goal (and
    (paciente_en_hospital Paciente1 Hospital)
    (paciente_en_hospital Paciente2 Hospital)
))


)
