Algoritmo sin_titulo
	Definir rutas_aereas Como Cadena
	Definir capacidad_pasajeros Como Entero
	Definir costos_base Como Real
	Definir asientos_disponibles Como Entero
	Definir opciones Como Entero
	Definir datos_pasajeros Como Entero
	Definir dato Como Caracter
	
	Dimension datos_pasajeros[4, 120, 2]
	
	Dimension rutas_aereas[4, 120]
    rutas_aereas[1,1] = "Buenos Aires - Bariloche"
    rutas_aereas[2,1] = "Buenos Aires - Salta"
    rutas_aereas[3,1] = "Rosario - Buenos Aires"
    rutas_aereas[4,1] = "Mar Del Plata - Mendoza"
    
    Dimension capacidad_pasajeros[4]
    capacidad_pasajeros[1] = 120
    capacidad_pasajeros[2] = 120
    capacidad_pasajeros[3] = 80
    capacidad_pasajeros[4] = 80
    
    Dimension costos_base[4]
    costos_base[1] = 150000
    costos_base[2] = 120000
    costos_base[3] = 70000
    costos_base[4] = 95000
    
    Dimension asientos_disponibles[4]
    asientos_disponibles[1] = capacidad_pasajeros[1]
    asientos_disponibles[2] = capacidad_pasajeros[2]
    asientos_disponibles[3] = capacidad_pasajeros[3]
    asientos_disponibles[4] = capacidad_pasajeros[4]
	
	
    
    Mientras Verdadero
        Escribir "Bienvenido al Sistema de Venta de Pasajes"
        Escribir "Menú de Opciones:"
        Escribir "1. Venta pasaje"
        Escribir "2. Buscar pasaje vendido"
        Escribir "3. Buscar pasajero"
        Escribir "4. Ordenar y mostrar lista pasajeros"
        Escribir "5. Listado/s"
        Escribir "6. SALIR"
        Leer opciones
        
        Segun opciones Hacer
			Caso 1:
                VentaPasaje(rutas_aereas, capacidad_pasajeros, costos_base, asientos_disponibles, datos_pasajeros)
			Caso 2:
                BuscarPasajePorAsiento(datos_pasajeros, rutas_aereas)
			Caso 3:
                BuscarPasajePorNombreApellido(datos_pasajeros, rutas_aereas)
			Caso 4:
				Escribir "1. Por número de asiento ascendente"
				Escribir "2. Por número de asiento descendente"
				Leer opciones
				Segun opciones Hacer
					Caso 1:
						
					Caso 2:
						
				FinSegun
				
			Caso 5:
				Escribir "1. Cantidad de pasajes vendidos por ruta aérea"
				Escribir "2. Porcentaje de ventas por ruta aérea"
				Leer opciones
				Segun opciones Hacer
					Caso 1: 
						
					Caso 2:
						
				FinSegun
			Caso 6: S, s, salir, SALIR:
					Escribir "Gracias por utilizar el Sistema de Venta de Pasajes"
				De Otro Modo:
					Escribir "Opción no válida. Intente de nuevo."
			Fin Segun
		Fin Mientras
FinAlgoritmo

Funcion return= calcularCostoPasaje(ruta,capacidad_pasajeros, asientos_disponibles, respuesta)
    Definir costo_base, costo_total, costo_final Como Real
    Definir recargo Como Logico
	
    recargo = Falso
	Si respuesta = "S" o respuesta = "s" Entonces
		costo_total = costo_total + (costo_total * 0.05)
		recargo = Verdadero
	FinSi
	
    Segun ruta
		Caso 1:
            costo_base = 150000
            Si cantidad_vendidos <= 20 Entonces
                costo_total = costo_base
            Sino 
				Si cantidad_vendidos > 20 y cantidad_vendidos <= 60 Entonces
					costo_total = costo_base + (costo_base * 0.10)
				Sino
					costo_total = 180000
				FinSi
			FinSi
		Caso 2:
			costo_base = 120000
			Si cantidad_vendidos <= 20 Entonces
				costo_total = costo_base
			Sino 
				Si cantidad_vendidos > 20 y cantidad_vendidos <= 60 Entonces
					costo_total = costo_base + (costo_base * 0.10)
				Sino
					costo_total = 150000
				FinSi
			FinSi
		Caso 3:
			costo_base = 70000
			Si cantidad_vendidos <= 10 Entonces
				costo_total = costo_base
			Sino
				Si cantidad_vendidos > 10 y cantidad_vendidos <= 40 Entonces
					costo_total = costo_base + (costo_base * 0.15)
				Sino
					costo_total = 95000
				FinSi
			FinSi
		Caso 4:
			costo_base = 95000
			Si cantidad_vendidos <= 10 Entonces
				costo_total = costo_base
			Sino 
				Si cantidad_vendidos > 10 y cantidad_vendidos <= 40 Entonces
					costo_total = costo_base + (costo_base * 0.15)
				Sino
					costo_total = 125000
				FinSi
			FinSi
	Fin Segun
	
	
	Escribir  costo_total, recargo
	return = costo_total
FinFuncion

Subproceso VentaPasaje(rutas_aereas, capacidad_pasajeros, costos_base, asientos_disponibles, datos_pasajeros)
    Escribir "Venta de pasaje"
    Escribir "Rutas disponibles:"
    Para i = 1 Hasta 4 Hacer
        Escribir i , ". " , rutas_aereas[i,1]
    FinPara
    
    Escribir "Seleccione la ruta aérea (1-4): "
    Definir opcion_ruta Como Entero
    Leer opcion_ruta
    Si opcion_ruta < 1 o opcion_ruta > 4 Entonces
        Escribir "Opción no válida."
    FinSi
    
    Definir ruta_elegida Como Cadena
    ruta_elegida = rutas_aereas[opcion_ruta,1]
	
    
    Escribir "Asientos disponibles en " , ruta_elegida , ": "  asientos_disponibles[opcion_ruta]
    
    Si asientos_disponibles[opcion_ruta] = 0 Entonces
        Escribir "Lo sentimos, no hay asientos disponibles en esta ruta."
    FinSi
	
    asientos_disponibles[opcion_ruta] = asientos_disponibles[opcion_ruta] - 1
    
    Escribir "Ingrese el nombre y apellido del pasajero: "
    Definir nombre_apellido Como Cadena
    Leer nombre_apellido
	rutas_aereas[opcion_ruta, 2] = nombre_apellido
    
    Escribir "Ingrese el DNI del pasajero: "
    Definir dni Como Cadena
    Leer dni
    
    Escribir "Ingrese el teléfono del pasajero: "
    Definir telefono Como Cadena
    Leer telefono
    
    Escribir "¿Desea despachar equipaje en bodega? (S/N): "
    Definir respuesta Como Caracter
    Leer respuesta
	
	Definir asiento_asignado Como Entero
	Si asiento_asignado <> 0
        
        datos_pasajeros[ruta_elegida , asiento_asignado, dato] = nombre_apellido
        datos_pasajeros[ruta_elegida, asiento_asignado, dato] = dni
		
        // Otros campos de datos del pasajero
		
        // Actualizar la disponibilidad de asientos
        asientos_disponibles[opcion_ruta] = asientos_disponibles[opcion_ruta] - 1
		
    FinSi
	
    Definir costo_pasaje Como Real
    costo_pasaje= calcularCostoPasaje(opcion_ruta, capacidad_pasajeros[opcion_ruta], asientos_disponibles[opcion_ruta], respuesta)
    
    Escribir "Resumen de la venta:"
    Escribir "Ruta: " , ruta_elegida
    Escribir "Nombre y Apellido: " , nombre_apellido
    Escribir "DNI: " , dni
    Escribir "Teléfono: " , telefono
    Si recargo = Verdadero  Entonces
		Escribir "Equipaje en bodega: Sí"
    Sino
        Escribir "Equipaje en bodega: No"
    FinSi
    Escribir "Número pasajero frecuente: 5665"  // Agrega la lógica para obtener el número de pasajero frecuente
    Escribir "Asiento: " , (capacidad_pasajeros[opcion_ruta] - asientos_disponibles[opcion_ruta])
    Escribir "Costo pasaje: $" , costo_pasaje
FinSubproceso


Subproceso BuscarPasajePorAsiento(datos_pasajeros, rutas_aereas)
    // Recorre las rutas aéreas y asientos para buscar el número de asiento
	Escribir "Ingrese el número de asiento que desea buscar: "
	Leer numero_asiento_buscar
	encontrado = Falso
    Para ruta = 1 Hasta 4
        Para asiento = 1 Hasta 120
			
            Si asiento = numero_asiento_buscar Entonces
                // Se encontró un pasajero con el número de asiento buscado
                Escribir "Pasajero encontrado:"
                Escribir "Ruta: " , rutas_aereas[ruta, 1]
                Escribir "Nombre y Apellido: " , rutas_aereas[ruta, 2]
                Escribir "DNI: " , datos_pasajeros[ruta, asiento, 2]
				encontrado = Verdadero
                // Otros campos del pasajero
				// Termina la búsqueda
            FinSi
        FinPara
    FinPara
    
    // Si no se encontró el número de asiento
	
FinSubproceso



Subproceso BuscarPasajePorNombreApellido(datos_pasajeros, rutas_aereas) 
    // Recorre las rutas aéreas y asientos para buscar por nombre y apellido
    Para ruta = 1 Hasta 4
        Para asiento = 1 Hasta 120
            Si datos_pasajeros[ruta, asiento, 1] = nombre_apellido_buscar Entonces
                // Se encontró un pasajero con el nombre y apellido buscados
                Escribir "Pasajero encontrado:"
                Escribir "Ruta: " , rutas_aereas[ruta]
                Escribir "Nombre y Apellido: " , datos_pasajeros[ruta, asiento, dato]
                Escribir "DNI: " , datos_pasajeros[ruta, asiento, dato]
                // Otros campos del pasajero
            FinSi
        FinPara
    FinPara
    
    // Si no se encontró el nombre y apellido
    Escribir "No se encontró ningún pasajero con el nombre y apellido " , nombre_apellido_buscar
FinSubproceso


