(define (problem problema_hospital3) (:domain domain_hospital)
(:objects 
    Ambulancia1 - ambulancia
    Paciente1 - paciente
    Paciente2 - paciente
    Paciente3 - paciente
    L1 - localizacion
    L2 - localizacion
    L3 - localizacion
    L4 - localizacion
    L5 - localizacion
    L6 - localizacion
    L7 - localizacion
    Hospital - hospital

)

(:init
    
    (paciente_en_ubicacion Paciente1 L2)
    (paciente_en_ubicacion Paciente2 L3)
    (paciente_en_ubicacion Paciente3 L5)
    (not(paciente_en_hospital Paciente1 Hospital))
    (not(paciente_en_hospital Paciente2 Hospital))
    (not(paciente_en_hospital Paciente3 Hospital))
    (not(paciente_en_abulancia Paciente1 Ambulancia1))
    (not(paciente_en_abulancia Paciente2 Ambulancia1))
    (not(paciente_en_abulancia Paciente3 Ambulancia1))

    (enlace L1 L2) (enlace L2 L4) (enlace L4 L3)(enlace L4 L5)(enlace L2 L6)(enlace L5 L7)(enlace L6 L7)
    (enlace L2 L1) (enlace L4 L2) (enlace L3 L4)(enlace L5 L4)(enlace L6 L2)(enlace L7 L5)(enlace L7 L6)

    (ambulancia_en Ambulancia1 L1)
    (not(ambulancia_lleva_paciente Ambulancia1))
    (hospital_en Hospital L1)
    (hospital_en Hospital L7)
)

(:goal (and
    (paciente_en_hospital Paciente1 Hospital)
    (paciente_en_hospital Paciente2 Hospital)
    (paciente_en_hospital Paciente3 Hospital)
))


)
