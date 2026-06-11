Algoritmo TorneoDerobots
    // 1. Declaración correcta de TODAS las variables
    Definir modeloR1, modeloR2, categoriaR1, categoriaR2 Como Caracter
    Definir mensajeDefensa Como Caracter
    Definir energiaR1, energiaR2, fuerzaR1, fuerzaR2 Como Real
    Definir velocidadR1, velocidadR2, iniciativaR1, iniciativaR2 Como Real
    Definir danoR1, danoR2, danoFinal Como Real
    Definir ronda Como Entero
	
    // 2. Ficha del Robot 1
    modeloR1 <- "IRONCLAD"
    categoriaR1 <- "Pesado"
    energiaR1 <- 120
    fuerzaR1 <- 85
    velocidadR1 <- 4.2
	
    // 3. Ficha del Robot 2
    modeloR2 <- "SWIFTBOT"
    categoriaR2 <- "Ligero"
    energiaR2 <- 90
    fuerzaR2 <- 60
    velocidadR2 <- 7.8
	
    Escribir "---------------"
    Escribir "--- Robot 1 ---"
    Escribir "---------------"
    Escribir "Modelo: ", modeloR1
    Escribir "Categoriga: ", categoriaR1
    Escribir "Energia: ", energiaR1
    Escribir "Fuerza: ", fuerzaR1
    Escribir "Velocidad: ", velocidadR1 
	
    Escribir "---------------"
    Escribir "--- Robot 2 ---"
    Escribir "---------------"
    Escribir "Modelo: ", modeloR2
    Escribir "Categoriga: ", categoriaR2
    Escribir "Energia: ", energiaR2
    Escribir "Fuerza: ", fuerzaR2
    Escribir "Velocidad: ", velocidadR2 
	
    // 4. Cálculos base pre-combate
    iniciativaR1 <- (fuerzaR1 * velocidadR1) / 10
    iniciativaR2 <- (fuerzaR2 * velocidadR2) / 10
	
    danoR1 <- fuerzaR1 * 0.75
    danoR2 <- fuerzaR2 * 0.75
	
    ronda <- 1
	
    Escribir ""
    Escribir "=========================================="
    Escribir "      ¡COMIENZA EL TORNEO DE ROBOTS!      "
    Escribir "=========================================="
    Escribir ""
	
    // 5. Bucle Principal de Combate
    Mientras energiaR1 > 0 Y energiaR2 > 0 Hacer
        Escribir "--- RONDA ", ronda, " ---"
		
        // Evaluamos quién tiene la iniciativa en esta ronda
        Si iniciativaR1 >= iniciativaR2 Entonces
            // IRONCLAD ATACA PRIMERO
            Escribir modeloR1, " toma la iniciativa y ataca!"
			
            // Cálculo dinámico de evasión para el Robot 2
            Si velocidadR2 > velocidadR1 + 2 Entonces 
                danoFinal <- danoR1 * 0.80
                mensajeDefensa <- "Gran velocidad de reacción. Daño reducido en un 20%"
            SiNo
                Si velocidadR2 > velocidadR1 + 1 Entonces
                    danoFinal <- danoR1 * 0.90
                    mensajeDefensa <- "Cobertura asegurada. Daño reducido en un 10%"
                SiNo
                    Si velocidadR2 > velocidadR1 Entonces
                        danoFinal <- danoR1 * 0.97
                        mensajeDefensa <- "Ataque recibido con cobertura. Daño reducido en un 3%"
                    SiNo 
                        danoFinal <- danoR1 * 1.5
                        mensajeDefensa <- "¡Sin cobertura! Ataque recibido completamente. Daño CRÍTICO"
                    FinSi
                FinSi
            FinSi
			
            // Aplicar daño a Robot 2
            energiaR2 <- energiaR2 - danoFinal
            Escribir modeloR2, " intenta esquivar: ", mensajeDefensa
            Escribir "-> ", modeloR1, " inflige ", danoFinal, " de daño."
			
            // Si el Robot 2 sigue vivo, contraataca
            Si energiaR2 > 0 Entonces
                Escribir ""
                Escribir modeloR2, " resiste el golpe y contraataca!"
				
                // Cálculo dinámico de evasión para el Robot 1
                Si velocidadR1 > velocidadR2 + 2 Entonces 
                    danoFinal <- danoR2 * 0.80
                    mensajeDefensa <- "Gran velocidad de reacción. Daño reducido en un 20%"
                SiNo
                    Si velocidadR1 > velocidadR2 + 1 Entonces
                        danoFinal <- danoR2 * 0.90
                        mensajeDefensa <- "Cobertura asegurada. Daño reducido en un 10%"
                    SiNo
                        Si velocidadR1 > velocidadR2 Entonces
                            danoFinal <- danoR2 * 0.97
                            mensajeDefensa <- "Ataque recibido con cobertura. Daño reducido en un 3%"
                        SiNo 
                            danoFinal <- danoR2 * 1.5
                            mensajeDefensa <- "¡Sin cobertura! Ataque recibido completamente. Daño CRÍTICO"
                        FinSi
                    FinSi
                FinSi
				
                // Aplicar daño a Robot 1
                energiaR1 <- energiaR1 - danoFinal
                Escribir modeloR1, " intenta esquivar: ", mensajeDefensa
                Escribir "-> ", modeloR2, " inflige ", danoFinal, " de daño."
            FinSi
			
        SiNo
            // SWIFTBOT ATACA PRIMERO (Misma lógica invertida)
            Escribir modeloR2, " toma la iniciativa y ataca!"
			
            Si velocidadR1 > velocidadR2 + 2 Entonces 
                danoFinal <- danoR2 * 0.80
                mensajeDefensa <- "Gran velocidad de reacción. Daño reducido en un 20%"
            SiNo
                Si velocidadR1 > velocidadR2 + 1 Entonces
                    danoFinal <- danoR2 * 0.90
                    mensajeDefensa <- "Cobertura asegurada. Daño reducido en un 10%"
                SiNo
                    Si velocidadR1 > velocidadR2 Entonces
                        danoFinal <- danoR2 * 0.97
                        mensajeDefensa <- "Ataque recibido con cobertura. Daño reducido en un 3%"
                    SiNo 
                        danoFinal <- danoR2 * 1.5
                        mensajeDefensa <- "¡Sin cobertura! Ataque recibido completamente. Daño CRÍTICO"
                    FinSi
                FinSi
            FinSi
			
            energiaR1 <- energiaR1 - danoFinal
            Escribir modeloR1, " intenta esquivar: ", mensajeDefensa
            Escribir "-> ", modeloR2, " inflige ", danoFinal, " de daño."
			
            Si energiaR1 > 0 Entonces
                Escribir ""
                Escribir modeloR1, " resiste el golpe y contraataca!"
				
                Si velocidadR2 > velocidadR1 + 2 Entonces 
                    danoFinal <- danoR1 * 0.80
                    mensajeDefensa <- "Gran velocidad de reacción. Daño reducido en un 20%"
                SiNo
                    Si velocidadR2 > velocidadR1 + 1 Entonces
                        danoFinal <- danoR1 * 0.90
                        mensajeDefensa <- "Cobertura asegurada. Daño reducido en un 10%"
					SiNo
						Si velocidadR2 > velocidadR1 Entonces
                            danoFinal <- danoR1 * 0.97
                            mensajeDefensa <- "Ataque recibido con cobertura. Daño reducido en un 3%"
                        SiNo 
                            danoFinal <- danoR1 * 1.5
                            mensajeDefensa <- "¡Sin cobertura! Ataque recibido completamente. Daño CRÍTICO"
                        FinSi
                    FinSi
                FinSi
				
                energiaR2 <- energiaR2 - danoFinal
                Escribir modeloR2, " intenta esquivar: ", mensajeDefensa
                Escribir "-> ", modeloR1, " inflige ", danoFinal, " de daño."
            FinSi
        FinSi
		
        Escribir "------------------------------------------"
        Escribir "ESTADO FINAL DE LA RONDA:"
        Escribir modeloR1, ": ", energiaR1, " de energía."
        Escribir modeloR2, ": ", energiaR2, " de energía."
        Escribir "------------------------------------------"
        Escribir ""
		
        ronda <- ronda + 1
    FinMientras
	
    // 6. Resultado Final
    Escribir "=========================================="
    Escribir "             ¡COMBATE TERMINADO!          "
    Escribir "=========================================="
    Si energiaR1 <= 0 Entonces
        Escribir "¡", modeloR1, " ha sido destruido!"
        Escribir "¡EL GANADOR ES ", modeloR2, "!"
    SiNo
        Escribir "¡", modeloR2, " ha sido destruido!"
        Escribir "¡EL GANADOR ES ", modeloR1, "!"
    FinSi
	
FinAlgoritmo