Algoritmo Vacunas
	Definir nombres Como Cadena
	Definir edades Como Entero
	Definir dni Como Cadena
	Definir fechasNacimiento Como Cadena
	Definir vacuna Como Cadena
	Definir fechasTurno Como Cadena
	
	Definir totalPacientes Como Entero
	
	Dimension nombres[50]
	Dimension edades[50]
	Dimension dni[50]
	Dimension fechasNacimiento[50]
	Dimension vacuna[50]
	Dimension fechasTurno[50]
	
	Definir diasSemana Como Cadena 
	Definir horarios Como Cadena 
	
	
	Dimension diasSemana[5]
	diasSemana[1] = "Lunes"
	diasSemana[2] = "Martes"
	diasSemana[3] = "Miércoles"
	diasSemana[4] = "Jueves"
	diasSemana[5] = "Viernes"
	
	
	Dimension horarios[8]
	horarios[1] = "8:00"
	horarios[2] = "8:30"
	horarios[3] = "9:00"
	horarios[4] = "9:30"
	horarios[5] = "10:00"
	horarios[6] = "10:30"
	horarios[7] = "11:00"
	horarios[8] = "11:30"
	
	definir vacunasPreCargadas Como Caracter
	Dimension vacunasPreCargadas[6]
	
	//  vacunas precargadas
	vacunasPreCargadas[1] = "Neumococo conjugada"
	vacunasPreCargadas[2] = "Poliomielitis (IPV o Salk)"
	vacunasPreCargadas[3] = "Quíntuple (o pentavalente)"
	vacunasPreCargadas[4] = "Rotavirus"
	vacunasPreCargadas[5] = "Meningococo"
	vacunasPreCargadas[6] = "Triple Viral"
	
	// array bidimensional
	Definir agendaVacunatorio Como Entero
	Dimension agendaVacunatorio[5,8]
	
	totalPacientes = 0
	Definir opciones Como Entero
	
	Repetir
        Escribir "Bienvenido al Sistema de Vacunación"
        Escribir "Menú de Opciones:"
        Escribir "1. Reservar turno"
        Escribir "2. Buscar paciente"
        Escribir "3. Ver agenda del vacunatorio"
        Escribir "4. Ordenar y mostrar lista de pacientes"
        Escribir "  a. Por edad"
        Escribir "  b. Por vacuna a aplicar"
        Escribir "5. Listados"
        Escribir "  a. Cantidad de turnos otorgados por día"
        Escribir "  b. Cantidad de vacunas a aplicar por vacuna"
        Escribir "6. Salir"
        Escribir "Seleccione una opción: "
        Leer opciones
		
		
		Segun opciones Hacer
            Caso 1:
                ReservarTurno(nombres, edades, dni, fechasNacimiento, vacuna, fechasTurno, totalPacientes, vacunasPreCargadas)
            Caso 2:
                BuscarPacientePorDNI(nombres, edades, dni, fechasNacimiento, vacuna, fechasTurno, totalPacientes)
            Caso 3:
                MostrarAgendaVacunatorio(diasSemana, horarios, agendaVacunatorio)
            Caso 4:
                Escribir "Ordenar y mostrar lista de pacientes:"
                Escribir "a. Por edad"
                Escribir "b. Por vacuna a aplicar"
                Escribir "Seleccione una opción (a/b): "
                Leer opcionOrdenamiento
				
				Mientras opcionOrdenamiento <> "a" Y opcionOrdenamiento <> "b" Hacer
					Escribir "Opción no válida. Intente de nuevo."
					Escribir "Seleccione una opción (a/b): "
					Leer opcionOrdenamiento
				FinMientras
                
                Si opcionOrdenamiento = "a" Entonces
                    OrdenarYMostrarPacientesPorEdad(nombres, edades, totalPacientes)
                Sino
                    Si opcionOrdenamiento = "b" Entonces
                        OrdenarYMostrarPacientesPorVacuna(nombres, edades, vacuna, totalPacientes)
                    FinSi
                FinSi
            Caso 5:
                Escribir "Listados:"
                Escribir "a. Cantidad de turnos otorgados por día"
                Escribir "b. Cantidad de vacunas a aplicar por vacuna"
                Escribir "Seleccione una opción (a/b): "
                Leer opcionListados
				
				Mientras opcionListados <> "a" Y opcionListados <> "b" Hacer
					Escribir "Opción no válida. Intente de nuevo."
					Escribir "Seleccione una opción (a/b): "
					Leer opcionListados
				FinMientras
                
                Si opcionListados = "a" Entonces
                    ContarTurnosPorDia(agendaVacunatorio)
                Sino
                    Si opcionListados = "b" Entonces
                        ContarVacunasAplicadasYBuscarIndiceVacuna(nombres, vacuna, totalPacientes, vacunasPreCargadas)
                    FinSi
                FinSi
            Caso 6:
                Escribir "Gracias por utilizar el Sistema de Vacunación. Hasta luego."
            De Otro Modo:
                Escribir "Opción no válida. Intente de nuevo."
        FinSegun
        
    Hasta Que opciones = 6
	
FinAlgoritmo

Subproceso ReservarTurno(nombres, edades, dni, fechasNacimiento, vacuna, fechasTurno, totalPacientes, vacunasPreCargadas)
    Escribir "Reservar turno"
	
    Escribir "Nombre del paciente: "
    Leer nombres[totalPacientes]
	Mientras nombres[totalPacientes] = "" Hacer
		Escribir "Ingrese nombre válido: "
		Leer nombres[totalPacientes]
	FinMientras
	
    Escribir "Edad del paciente: "
    Leer edades[totalPacientes]
	Mientras edades[totalPacientes]<=0 o edades[totalPacientes]>120 Hacer
		Escribir "ingrese una edad válida"
		leer edades[totalPacientes]
	FinMientras
	
    Escribir "DNI del paciente: "
    Leer dni[totalPacientes]
	Mientras dni[totalPacientes]="" Hacer
		Escribir "Ingrese un DNI válido"
		leer dni[totalPacientes]
	FinMientras
	
    Escribir "Fecha de nacimiento del paciente: "
    Leer fechasNacimiento[totalPacientes]
	Mientras fechasNacimiento[totalPacientes] = "" Hacer
		Escribir "Ingrese una fecha válida formato DD/MM/AAAA"
		Leer fechasNacimiento[totalPacientes]
	FinMientras
    
    // vacunas precargadas
    Escribir "Vacunas disponibles:"
    Para i = 1 Hasta 6 Hacer
        Escribir i, ". ", vacunasPreCargadas[i]
    FinPara
    
	definir opcionVacuna Como Entero
    Escribir "Seleccione una vacuna (1-6): "
    Leer opcionVacuna
	Mientras opcionVacuna <1 o opcionVacuna>6 Hacer
		Escribir "Ingrese una opción válida"
		leer opcionVacuna
	FinMientras
    
    Si opcionVacuna >= 1 Y opcionVacuna <= 6 Entonces
        vacuna[totalPacientes] = vacunasPreCargadas[opcionVacuna]
        Escribir "Fecha del turno: "
        Leer fechasTurno[totalPacientes]
        totalPacientes = totalPacientes + 1
        Escribir "¡Turno reservado exitosamente!"
    Sino
        Escribir "Opción de vacuna no válida."
    FinSi
FinSubproceso

Subproceso BuscarPacientePorDNI(nombres, edades, dni, fechasNacimiento, vacuna, fechasTurno, totalPacientes)
    Definir dniBuscado Como Cadena
    Definir encontrado Como Logico
    encontrado = Falso
	
    Escribir "Ingrese el DNI del paciente que desea buscar: "
    Leer dniBuscado
	
    Para i = 1 Hasta 50 Hacer
        Si dni[i] = dniBuscado Entonces
            encontrado <- Verdadero
            Escribir "Nombre: ", nombres[i]
            Escribir "Edad: ", edades[i]
            Escribir "DNI: ", dni[i]
            Escribir "Fecha de Nacimiento: ", fechasNacimiento[i]
            Escribir "Vacuna: ", vacuna[i]
            Escribir "Fecha de Turno: ", fechasTurno[i]
        FinSi
    FinPara
	
    Si encontrado = Falso Entonces
        Escribir "El paciente con DNI ", dniBuscado, " no se encontró en la base de datos."
    FinSi
FinSubproceso

Subproceso OrdenarYMostrarPacientesPorEdad(nombres, edades, totalPacientes)
    Para i = 1 Hasta totalPacientes - 1 Hacer
        Para j = 1 Hasta totalPacientes - i Hacer
            Si edades[j] > edades[j + 1] Entonces
                // Intercambiar edades
                Definir aux1 Como Entero
                aux1 = edades[j]
                edades[j] = edades[j + 1]
                edades[j + 1] = aux1
                
                
                Definir aux2 Como Cadena
                aux2 = nombres[j]
                nombres[j] = nombres[j + 1]
                nombres[j + 1] = aux2
            FinSi
        FinPara
    FinPara
	
    // pacientes ordenada por edad
    Para i = 1 Hasta totalPacientes Hacer
        Escribir "Nombre: ", nombres[i]
        Escribir "Edad: ", edades[i]
    FinPara
FinSubproceso

Subproceso MostrarAgendaVacunatorio(diasSemana, horarios, agendaVacunatorio)
    Escribir "Agenda del Vacunatorio:"
    definir i Como Entero
    Para i = 1 Hasta 5 Con Paso 1 Hacer
        Escribir "Turnos disponibles para el día ", diasSemana[i], ":"
        
        Para j = 1 Hasta 8 Hacer
            Si agendaVacunatorio[i, j] = 0 Entonces
                Escribir i, ".", j, ". ", horarios[j]
            FinSi
        FinPara
    FinPara
FinSubproceso

Subproceso OrdenarYMostrarPacientesPorVacuna(nombres, edades, vacuna, totalPacientes)
    // pacientes por vacuna
    Para i = 1 Hasta totalPacientes - 1 Hacer
        Para j = 1 Hasta totalPacientes - i Hacer
            Si vacuna[j] > vacuna[j + 1] Entonces
                
                Definir auxVacuna Como Cadena
                auxVacuna = vacuna[j]
                vacuna[j] = vacuna[j + 1]
                vacuna[j + 1] = auxVacuna
                
                
                Definir auxNombre Como Cadena
                auxNombre = nombres[j]
                nombres[j] = nombres[j + 1]
                nombres[j + 1] = auxNombre
                
                
                Definir auxEdad Como Entero
                auxEdad = edades[j]
                edades[j] = edades[j + 1]
                edades[j + 1] = auxEdad
            FinSi
        FinPara
    FinPara
	
	// pacientes ordenados por vacuna
    Para i = 1 Hasta totalPacientes Hacer
        Escribir "Nombre: ", nombres[i]
        Escribir "Edad: ", edades[i]
        Escribir "Vacuna: ", vacuna[i]
        
    FinPara
FinSubproceso

Subproceso ContarTurnosPorDia(agenda)
    // turnos otorgados por día
    Definir turnosPorDia Como Entero
	dimension turnosPorDia[5]// Suponiendo 5 días de la semana
	
    // turnos por día a cero
    Para i = 1 Hasta 5 Hacer
        turnosPorDia[i] = 0
    FinPara
	
    // cuenta los turnos por día
    Para i = 1 Hasta 5 Hacer
        Para j = 1 Hasta 8 Hacer
            turnosPorDia[i] = turnosPorDia[i] + agenda[i, j]
			Escribir "Día ", i, ", Hora ", j, ": "
        FinPara
    FinPara
FinSubproceso

Subproceso ContarVacunasAplicadasYBuscarIndiceVacuna(nombres, vacuna, totalPacientes, vacunasPreCargadas)
    // contar las vacunas
    Definir cantidadVacunas Como Entero
    Dimension cantidadVacunas[6]
    
    
    Para i = 1 Hasta 6 Hacer
        cantidadVacunas[i] = 0
    FinPara
    
    Para i = 1 Hasta totalPacientes Hacer
        Definir tipoVacuna Como Cadena
        tipoVacuna = vacuna[i]
        
        // Encontrar el índice de la vacuna
        Definir indiceVacuna Como Entero
        indiceVacuna = 0 
        
        Para j = 1 Hasta 6 Hacer
            Si tipoVacuna = vacunasPreCargadas[j] Entonces
                indiceVacuna = j
            FinSi
        FinPara
        
        Si indiceVacuna > 0 Entonces
            // actualiza la cantidad de vacunas
            cantidadVacunas[indiceVacuna] = cantidadVacunas[indiceVacuna] + 1
        Sino
            Escribir "La vacuna ", tipoVacuna, " no se encontró en el arreglo de vacunasPrecargadas."
        FinSi
    FinPara
    
    // Mostrar la cantidad de vacunas aplicadas por tipo
    Para i = 1 Hasta 6 Hacer
        Escribir "Vacuna: ", vacunasPreCargadas[i]
        Escribir "Cantidad de vacunas aplicadas: ", cantidadVacunas[i]
    FinPara
FinSubproceso