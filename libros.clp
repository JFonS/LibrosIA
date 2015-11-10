;;; Declaracion de funciones para preguntar --------------------------

;;; Funcion para hacer una pregunta con respuesta cualquiera
(deffunction pregunta-general (?pregunta)
    (format t "%s " ?pregunta)
	(bind ?respuesta (read))
	(while (not (lexemep ?respuesta)) do
		(format t "%s " ?pregunta)
		(bind ?respuesta (read))
    )
	?respuesta
)

;;; Funcion para hacer una pregunta general con una serie de respuestas admitidas
(deffunction MAIN::pregunta-opciones (?question $?allowed-values)
   (format t "%s "?question)
   (progn$ (?curr-value $?allowed-values)
		(format t "[%s]" ?curr-value)
	)
   (printout t ": ")
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (format t "%s "?question)
	  (progn$ (?curr-value $?allowed-values)
		(format t "[%s]" ?curr-value)
	  )
	  (printout t ": ")
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer
)
   
;;; Funcion para hacer una pregunta de tipo si/no
(deffunction MAIN::pregunta-si-no (?question)
   (bind ?response (pregunta-opciones ?question si no))
   (if (or (eq ?response si) (eq ?response s))
       then TRUE 
       else FALSE)
)

;;; Funcion para hacer una pregunta con respuesta numerica unica
(deffunction MAIN::pregunta-numerica (?pregunta ?rangini ?rangfi)
	(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
	(bind ?respuesta (read))
	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do
		(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
		(bind ?respuesta (read))
	)
	?respuesta
)

;;; Funcion para hacer pregunta con indice de respuestas posibles
(deffunction MAIN::pregunta-indice (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (bind ?respuesta (pregunta-numerica "Escoge una opción:" 1 (length$ ?valores-posibles)))
	?respuesta
)

;;; Funcion para hacer una pregunta multi-respuesta con indices
(deffunction pregunta-multi (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (format t "%s" "Indica los números separados por un espacio: ")
    (bind ?resp (readline))
    (bind ?numeros (str-explode ?resp))
    (bind $?lista (create$ ))
    (progn$ (?var ?numeros) 
        (if (and (integerp ?var) (and (>= ?var 1) (<= ?var (length$ ?valores-posibles))))
            then 
                (if (not (member$ ?var ?lista))
                    then (bind ?lista (insert$ ?lista (+ (length$ ?lista) 1) ?var))
                )
        ) 
    )
    ?lista
)

;;; Declaracion de templates --------------------------

;;;Template para los datos de nuestro lector
(deftemplate MAIN::Lector
	(slot nombre 			       ;;;nombre lector
		(type STRING)
	)                         
	(slot tiempo 			       ;;;minuts per dia
		(type INTEGER)
		(default -1)
	)          
	(slot edad  			        ;;;edad lector
		(type INTEGER)
		(default -1)
	)            
	(slot momento 			      ;;;momento del dia en el que el lector lee
		(type STRING) 
		(allowed-strings "manyana" "tarde" "noche" "desconocido") 
		(default "desconocido")
	)
  (slot frecuencia          ;;;frecuencia con la que el lector lee
    (type STRING) 
    (allowed-strings "a diario" "ocasionalmente" "cuando pueda" "desconocido") 
    (default "desconocido")
  )
	(slot lugar 			        ;;;lugar en el que el lector suele leer
		(type STRING) 
		(allowed-strings "transporte" "cama" "escritorio" "banyo" "desconocido") 
		(default "desconocido")
	)														
)

;;; Template para las preferencias del lector
(deftemplate MAIN::Preferencias
  (multislot generos-favoritos (type INSTANCE))     ;;;conjunto de generos favoritos
  (multislot autores-favoritos (type INSTANCE))     ;;;conjunto de autores favoritos
  (multislot libros-leidos (type INSTANCE))         ;;;conjunto de libros leido
  (slot gustan-libros-populares                     ;;;si le gustan los libros populares
    (type STRING)
    (allowed-strings "si" "no" "desconocido")
    (default "desconocido")
  )
  (slot gustan-autores-extranjeros                   ;;;si le gustan los autores extranjero
    (type STRING)
    (allowed-strings "si" "no" "desconocido")
    (default "desconocido")
  )
)

;;; Declaracion de reglas y hechos ---------------------

(defrule MAIN::initialRule "Regla inicial"
  (declare (salience 10))
  =>
  (printout t "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::" crlf)
  (printout t ":                Sistema de recomendacion de libros                :" crlf)
  (printout t "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::" crlf)
  (printout t crlf)   
  (printout t "Bienvenido al sistema ***" crlf)
  (printout t "A continuacion se le formularan una serie de preguntas para poder recomendarle libros." crlf)
  (printout t crlf)
)