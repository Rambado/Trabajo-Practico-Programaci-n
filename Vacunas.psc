Algoritmo Vacunas
	
	Definir totalPacientes Como Entero
	
	Definir nombres Como Cadena
	Definir edades Como Entero
	Definir dni Como Cadena
	Definir fechasNacimiento Como Cadena
	Definir vacuna Como Cadena
	Definir fechasTurno Como Cadena
	
	Dimension nombres[50]
	Dimension edades[50]
	Dimension dni[50]
	Dimension fechasNacimiento[50]
	Dimension vacuna[50]
	Dimension fechasTurno[50]
	
	Definir diasSemana Como Cadena 
	Definir horarios Como Cadena 
	
	Dimension diasSemana[5]
	diasSemana[0] = "Lunes"
	diasSemana[1] = "Martes"
	diasSemana[2] = "Miércoles"
	diasSemana[3] = "Jueves"
	diasSemana[4] = "Viernes"
	
	Dimension horarios[8]
	horarios[0] = "8:00"
	horarios[1] = "8:30"
	horarios[2] = "9:00"
	horarios[3] = "9:30"
	horarios[4] = "10:00"
	horarios[5] = "10:30"
	horarios[6] = "11:00"
	horarios[7] = "11:30"
	
	// array bidimensional
	Definir agendaVacunatorio Como Entero
	Dimension agendaVacunatorio[5,8]
	
	definir vacunasPreCargadas Como Caracter
	Dimension vacunasPreCargadas[6]
	
	//  vacunas precargadas
	vacunasPreCargadas[0] = "Neumococo conjugada"
	vacunasPreCargadas[1] = "Poliomielitis (IPV o Salk)"
	vacunasPreCargadas[2] = "Quíntuple (o pentavalente)"
	vacunasPreCargadas[3] = "Rotavirus"
	vacunasPreCargadas[4] = "Meningococo"
	vacunasPreCargadas[5] = "Triple Viral"
	
	// stock de vacunas
	Definir stockVacunas Como Entero
	Dimension stockVacunas[6]
	
	// 10 unidades de cada vacuna
	Para i = 0 Hasta 5 Hacer
		stockVacunas[i] = 10
	FinPara
	
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
		Mientras opciones < 1 o opciones > 6 Hacer
			Escribir "Opción inválida, por favor ingrese una opción de 1 al 6: "
			Leer opciones
		FinMientras
		Segun opciones Hacer
            Caso 1:
                ReservarTurno(nombres, edades, dni, fechasNacimiento, vacuna, fechasTurno,totalPacientes, vacunasPreCargadas, stockVacunas)
				totalPacientes = totalPacientes + 1
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
                    ContarTurnosPorDia(agendaVacunatorio, horarios)
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

Subproceso ReservarTurno(nombres, edades, dni, fechasNacimiento, vacuna, fechasTurno, totalPacientes, vacunasPreCargadas, stockVacunas)
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
    
    //vacunas disponibles
    Escribir "Vacunas disponibles:"
    Para i = 0 Hasta 5 Hacer
        Escribir i+1, ". ", vacunasPreCargadas[i], " - Stock: ", stockVacunas[i]
    FinPara
    
    Definir opcionVacuna Como Entero
    Escribir "Seleccione una vacuna (1-6): "
    Leer opcionVacuna
    Mientras opcionVacuna < 1 o opcionVacuna > 6 Hacer
        Escribir "Ingrese una opción válida"
        Leer opcionVacuna
    FinMientras
    
    // Verificar si hay stock disponible para la vacuna seleccionada
    Si stockVacunas[opcionVacuna] > 0 Entonces
        // Restar una vacuna
        stockVacunas[opcionVacuna] = stockVacunas[opcionVacuna] - 1
        
        vacuna[totalPacientes] = vacunasPreCargadas[opcionVacuna] 
        Escribir "Fecha del turno: "
        Leer fechasTurno[totalPacientes]
        totalPacientes = totalPacientes + 1
		Escribir "total pacientes ",totalPacientes
        Escribir "¡Turno reservado exitosamente!"
    Sino
        Escribir "No hay stock disponible para la vacuna seleccionada."
    FinSi
FinSubproceso

Subproceso BuscarPacientePorDNI(nombres, edades, dni, fechasNacimiento, vacuna, fechasTurno, totalPacientes)
    Definir dniBuscado Como Cadena
    Definir encontrado Como Logico
    encontrado = Falso
	Escribir "total pacientes ",totalPacientes
    Escribir "Ingrese el DNI del paciente que desea buscar: "
    Leer dniBuscado
	
    Definir i Como Entero
    i = 0
    Mientras i < totalPacientes Y encontrado = Falso Hacer
        Si dni[i] = dniBuscado Entonces
            encontrado <- Verdadero
            Escribir "Nombre: ", nombres[i]
            Escribir "Edad: ", edades[i]
            Escribir "DNI: ", dni[i]
            Escribir "Fecha de Nacimiento: ", fechasNacimiento[i]
            Escribir "Vacuna: ", vacuna[i]
            Escribir "Fecha de Turno: ", fechasTurno[i]
        Sino
            i = i + 1
        FinSi
    FinMientras
	
    Si encontrado = Falso Entonces
        Escribir "No hay registros del paciente con DNI ", dniBuscado
    FinSi
FinSubproceso

Subproceso OrdenarYMostrarPacientesPorEdad(nombres, edades, totalPacientes)
    Para i = 0 Hasta totalPacientes - 2 Hacer 
		pos_menor = i
        Para j = i + 1 Hasta totalPacientes - 1 Hacer
            Si edades[j] < edades[pos_menor] Entonces
				pos_menor = j
			FinSi
		FinPara
		
		// Intercambiar edades
		aux1 = edades[i]
		edades[i] = edades[pos_menor]
		edades[pos_menor] = aux1
		
		aux2 = nombres[i]
		nombres[i] = nombres[pos_menor]
		nombres[pos_menor] = aux2
	FinPara
	
		
    // pacientes ordenada por edad
    Para i = 0 Hasta totalPacientes -1 Hacer
        Escribir "Nombre: ", nombres[i]
        Escribir "Edad: ", edades[i]
    FinPara
FinSubproceso

Subproceso MostrarAgendaVacunatorio(diasSemana, horarios, agendaVacunatorio)
    Escribir "Agenda del Vacunatorio:"
    definir i Como Entero
    Para i = 0 Hasta 4 Con Paso 1 Hacer
        Escribir "Turnos disponibles para el día ", diasSemana[i], ":"
        
        Para j = 0 Hasta 7 Hacer
            Si agendaVacunatorio[i, j] = 0 Entonces
                Escribir j + 1, ". ", horarios[j]
            FinSi
        FinPara
    FinPara
FinSubproceso

Subproceso OrdenarYMostrarPacientesPorVacuna(nombres, edades, vacuna, totalPacientes)
    // pacientes por vacuna
    Para i = 0 Hasta totalPacientes - 2 Hacer
		pos_menor = i
        Para j = i+1 Hasta totalPacientes - 1 Hacer
            Si vacuna[j] < vacuna[pos_menor] Entonces
				pos_menor = j
			FinSi
		FinPara
		

		auxVacuna = vacuna[i]
		vacuna[i] = vacuna[pos_menor]
		vacuna[pos_menor] = auxVacuna
		
		
		auxNombre = nombres[i]
		nombres[i] = nombres[pos_menor]
		nombres[pos_menor] = auxNombre
		
		
		auxEdad = edades[i]
		edades[i] = edades[pos_menor]
		edades[pos_menor] = auxEdad
    FinPara
	
	// pacientes ordenados por vacuna
    Para i = 0 Hasta totalPacientes -1 Hacer
        Escribir "Nombre: ", nombres[i]
        Escribir "Edad: ", edades[i]
        Escribir "Vacuna: ", vacuna[i]
        
    FinPara
FinSubproceso

Subproceso ContarTurnosPorDia(agenda, horarios)
    // turnos otorgados por día
    Definir turnosPorDia Como Entero
	dimension turnosPorDia[5]// Suponiendo 5 días de la semana
	
    // turnos por día a cero
    Para i = 0 Hasta 4 Hacer
        turnosPorDia[i] = 0
    FinPara
	
    // cuenta los turnos por día
    Para i = 0 Hasta 4 Hacer
        Para j = 0 Hasta 7 Hacer
           // turnosPorDia[i] = turnosPorDia[i] + agenda[i, j]
			Escribir "Día ", i + 1, ", Hora ", horarios[j], ": "
        FinPara
    FinPara
FinSubproceso

Subproceso ContarVacunasAplicadasYBuscarIndiceVacuna(nombres, vacuna, totalPacientes, vacunasPreCargadas)
    // contar las vacunas
    Definir cantidadVacunas Como Entero
    Dimension cantidadVacunas[6]
    
    
    Para i = 0 Hasta 5 Hacer
        cantidadVacunas[i] = 0
    FinPara
    
    Para i = 1 Hasta totalPacientes Hacer
        tipoVacuna = vacuna[i]
        
        // Encontrar el índice de la vacuna
        indiceVacuna = 0 
        
        Para j = 0 Hasta 5 Hacer
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
    Para i = 0 Hasta 5 Hacer
        Escribir "Vacuna: ", vacunasPreCargadas[i]
        Escribir "Cantidad de vacunas aplicadas: ", cantidadVacunas[i]
    FinPara
FinSubproceso