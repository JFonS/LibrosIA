;;-------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------
;;
;;                PRACTICA 2 IA: SBC
;;
;; Alumnos: Joan Fons
;;          Victor Anton
;;          Oscar Mañas 
;; Cuatrimestre: 2015-16 Q1
;;
;;-------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------

;;-------------------------------------------------------------------------------------------------------------
;;                    ONTOLOGIA
;;-------------------------------------------------------------------------------------------------------------

(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
  (is-a USER)
  (role abstract)
  (single-slot lugar
    (type SYMBOL)
    (allowed-values Transporte Casa Cama)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot tiempo_disponible
    (type INTEGER)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot gustan_populares
    (type SYMBOL)
    (allowed-values FALSE TRUE)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot titulo
    (type STRING)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot valoracion
;+    (comment "Nota del 0 al 10")
    (type FLOAT)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot frecuencia
    (type SYMBOL)
    (allowed-values Diariamente Ocasionalmente Esporadicamente)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot lectura_facil
    (type SYMBOL)
    (allowed-values FALSE TRUE)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot longitud
    (type INTEGER)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot momento
    (type SYMBOL)
    (allowed-values Manana Tarde Noche)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (multislot autor
    (type INSTANCE)
;+    (allowed-classes Autor)
    (create-accessor read-write))
  (multislot genero
    (type INSTANCE)
;+    (allowed-classes Genero)
    (create-accessor read-write))
  (multislot estilo
    (type INSTANCE)
;+    (allowed-classes Genero)
    (create-accessor read-write))
  (multislot autores_preferidos
    (type INSTANCE)
;+    (allowed-classes Autor)
    (create-accessor read-write))
  (single-slot nombre
    (type STRING)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot autores_extranjeros
    (type SYMBOL)
    (allowed-values FALSE TRUE)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot confia_criticas
    (type SYMBOL)
    (allowed-values FALSE TRUE)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (multislot generos_preferidos
    (type INSTANCE)
;+    (allowed-classes Genero)
    (create-accessor read-write))
  (single-slot edad
    (type INTEGER)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot dificultad
    (type SYMBOL)
    (allowed-values facil asequible denso)
;+    (cardinality 0 1)
    (create-accessor read-write)))

(defclass Libro
  (is-a USER)
  (role concrete)
  (single-slot longitud
    (type INTEGER)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot valoracion
;+    (comment "Nota del 0 al 10")
    (type FLOAT)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot dificultad
    (type SYMBOL)
    (allowed-values facil asequible denso)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot autor
    (type INSTANCE)
;+    (allowed-classes Autor)
    (create-accessor read-write))
  (single-slot titulo
    (type STRING)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (multislot genero
    (type INSTANCE)
;+    (allowed-classes Genero)
    (create-accessor read-write)))

(defclass Persona
  (is-a USER)
  (role abstract)
  (single-slot nombre
    (type STRING)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot edad
    (type INTEGER)
;+    (cardinality 0 1)
    (create-accessor read-write)))

(defclass Lector
  (is-a Persona)
  (role concrete)
  (single-slot gustan_populares
    (type SYMBOL)
    (allowed-values FALSE TRUE)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (multislot autores_preferidos
    (type INSTANCE)
;+    (allowed-classes Autor)
    (create-accessor read-write))
  (single-slot lugar
    (type SYMBOL)
    (allowed-values Transporte Casa Cama)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot momento
    (type SYMBOL)
    (allowed-values Manana Tarde Noche)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot confia_criticas
    (type SYMBOL)
    (allowed-values FALSE TRUE)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot tiempo_disponible
    (type INTEGER)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (multislot generos_preferidos
    (type INSTANCE)
;+    (allowed-classes Genero)
    (create-accessor read-write))
  (single-slot frecuencia
    (type SYMBOL)
    (allowed-values Diariamente Ocasionalmente Esporadicamente)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (single-slot autores_extranjeros
    (type SYMBOL)
    (allowed-values FALSE TRUE)
;+    (cardinality 0 1)
    (create-accessor read-write)))

(defclass Autor
  (is-a Persona)
  (role concrete)
  (single-slot lectura_facil
    (type SYMBOL)
    (allowed-values FALSE TRUE)
;+    (cardinality 0 1)
    (create-accessor read-write))
  (multislot estilo
    (type INSTANCE)
;+    (allowed-classes Genero)
    (create-accessor read-write)))

(defclass Genero
  (is-a USER)
  (role concrete)
  (single-slot nombre
    (type STRING)
;+    (cardinality 0 1)
    (create-accessor read-write)))


;;-------------------------------------------------------------------------------------------------------------
;;                    INSTANCIAS
;;-------------------------------------------------------------------------------------------------------------

(definstances instances
([libros_Class10] of  Genero

  (nombre "romantico"))

([libros_Class11] of  Genero

  (nombre "terror"))

([libros_Class12] of  Genero

  (nombre "aventura"))

([libros_Class13] of  Genero

  (nombre "comic"))

([libros_Class14] of  Genero

  (nombre "ficcion"))

([libros_Class15] of  Genero

  (nombre "salud"))

([libros_Class16] of  Libro

  (autor [libros_Class17])
  (dificultad facil)
  (genero [libros_Class3])
  (longitud 464)
  (titulo "Ready Player One")
  (valoracion 9.5))

([libros_Class17] of  Autor

  (edad 43)
  (estilo [libros_Class3])
  (lectura_facil TRUE)
  (nombre "Ernest Cline"))

([libros_Class3] of  Genero

  (nombre "ciencia_ficcion"))

([libros_Class4] of  Genero

  (nombre "fantasia"))

([libros_Class5] of  Genero

  (nombre "historia"))

([libros_Class6] of  Genero

  (nombre "narrativa"))

([libros_Class7] of  Genero

  (nombre "oeste"))

([libros_Class9] of  Genero

  (nombre "policiaco"))
)

;;; Fin del codigo generado con Protege ---------------   
;;; ---------------------------------------------------


;;; Declaracion de funciones para preguntar --------------------------

;;; Funcion para hacer una pregunta con respuesta cualquiera
(deffunction pregunta-general (?pregunta)
  (printout t crlf)
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
   (printout t crlf)
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
  (printout t crlf)
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
    (printout t crlf)
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (bind ?indice (pregunta-numerica "Escoja una opcion:" 1 (length$ ?valores-posibles)))
  	(bind ?respuesta (nth$ ?indice $?valores-posibles))
    ?respuesta
)

;;; Funcion para hacer una pregunta multi-respuesta con indices
(deffunction pregunta-multi (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t crlf)
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (format t "%s" "Indique los numeros separados por un espacio: ")
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


;;; Declaracion de modulos ----------------------------

;;; Modulo principal de utilidades, indicamos que exportamos todo
(defmodule MAIN (export ?ALL))

;;; Modulo de recopilacion de los datos del lector
(defmodule preguntas-lector 
  (import MAIN ?ALL) 
  (export ?ALL)
)

;;; Modulo de recopilacion de las preferencias del lector
(defmodule preguntas-prefs 
  (import MAIN ?ALL)
  (import preguntas-lector deftemplate ?ALL) 
  (export ?ALL)
)

;;; Modulo de abstraccion del problema
(defmodule abstraccion-problema 
  (import MAIN ?ALL) 
  (export ?ALL)
)

;;; Modulo de salida de las 3 recomendaciones de libros
(defmodule salida-recomendaciones 
  (import abstraccion-problema ?ALL) 
  (import MAIN ?ALL)
   (export ?ALL)
)


;;; Declaracion de templates --------------------------

;;;Template para los datos de nuestro lector
(deftemplate MAIN::Lector
	(slot nombre 			       ;;;nombre lector
		(type STRING)
	)
  (slot edad               ;;;edad lector
    (type INTEGER)
    (default -1)
  )                               
	(slot tiempo_disp	       ;;;minutos por dia
		(type INTEGER)
		(default -1)
	)  
  (slot frecuencia          ;;;frecuencia con la que el lector lee
    (type STRING) 
    (allowed-strings "a diario" "ocasionalmente" "cuando pueda" "desconocido") 
    (default "desconocido")
  )              
	(slot momento 	         ;;;momento del dia en el que el lector lee
		(type STRING) 
		(allowed-strings "manyana" "tarde" "noche" "desconocido") 
		(default "desconocido")
	)
	(slot lugar 			        ;;;lugar en el que el lector suele leer
		(type STRING) 
		(allowed-strings "transporte" "cama" "escritorio" "banyo" "desconocido") 
		(default "desconocido")
	)														
)

;;; Template para las preferencias del lector
(deftemplate MAIN::preferencias
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


;;; Declaracion de reglas y hechos --------------------

(defrule MAIN::initialRule "Regla inicial"
  (declare (salience 10))
  =>
  (printout t "====================================================================" crlf)
  (printout t "=                Sistema de recomendacion de libros                =" crlf)
  (printout t "====================================================================" crlf)
  (printout t crlf)   
  (printout t "Bienvenido al sistema asteriscoasteriscoasterisco" crlf)
  (printout t "A continuacion se le formularan una serie de preguntas para poder recomendarle libros." crlf)
  (printout t crlf)
  (focus preguntas-lector)
)

(defrule preguntas-lector::establecer-nombre "Establece el nombre del lector, es la primera pregunta"
  (not (Lector))
  =>
  (bind ?nombre (pregunta-general "Como se llama? "))
  (assert (Lector (nombre ?nombre)))
)

;;;Edad: Ninyo, Adolescente, AdultoMenor, AdultoMayor, Anciano
(defrule preguntas-lector::establecer-edad "Establece la edad del lector"
  ?u <- (Lector (edad ?edad))
  (Lector (edad -1))
  =>
  (bind ?edad (pregunta-numerica "Que edad tiene? " 3 100))
  (modify ?u (edad ?edad))
)

(defrule preguntas-lector::establecer-tiempo_disp "Establece el tiempo del que dispone el lector para leer"
  ?u <- (Lector (tiempo_disp ?tiempo))
  (not (Lector (edad -1)))
  (Lector (tiempo_disp -1))
  =>
  (bind ?tiempo (pregunta-numerica "Cuanto tiempo disponible tiene para leer (en minutos por dia)? " 1 1440))
  (modify ?u (tiempo_disp ?tiempo))
)

(defrule preguntas-lector::establecer-frecuencia "Establece la frecuencia con la que lee el lector"
  ?u <- (Lector (frecuencia ?frecuencia))
  (not (Lector (tiempo_disp -1)))
  (Lector (frecuencia "desconocido"))
  =>
  (bind ?frecuencia (pregunta-indice "Con que frecuencia suele leer?" "a diario" "ocasionalmente" "cuando pueda"))
  (modify ?u (frecuencia ?frecuencia))
)

(defrule preguntas-lector::establecer-momento "Establece el momento que suele usar el lector para leer"
  ?u <- (Lector (momento ?momento))
  (not (Lector (frecuencia "desconocido")))
  (Lector (momento "desconocido"))
  =>
  (bind ?momento (pregunta-indice "En que momento del dia suele leer?" manyana tarde noche))
  (modify ?u (momento ?momento))
)

(defrule preguntas-lector::establecer-lugar "Establece el lugar donde suele leer el lector"
  ?u <- (Lector (lugar ?lugar))
  (not (Lector (momento "desconocido")))
  (Lector (lugar "desconocido"))
  =>
  (bind ?lugar (pregunta-indice "Donde suele leer?" transporte cama escritorio banyo))
  (modify ?u (lugar ?lugar))
  (focus preguntas-prefs)
)


;;; Modulo preguntas preferencias ---------------------

(deffacts preguntas-prefs::hechos-iniciales "Establece hechos para poder recopilar informacion"
  (generos-favoritos ask)     ;;;conjunto de generos favoritos
  (autores-favoritos ask)     ;;;conjunto de autores favoritos
  (libros-leidos     ask)     ;;;conjunto de libros leido
  (gustan-libros-populares      ask)
  (gustan-autores-extranjeros   ask)
  (preferencias)
)

(defrule preguntas-prefs::establecer-generos-favortitos "Establece los generos favoritos del lector"
  ?h <- (generos-favoritos ask)
  ?pref <- (preferencias)
  =>
  (bind $?obj-generos (find-all-instances ((?inst Genero)) TRUE) )
  (bind $?nom-generos (create$ ))

  (loop-for-count (?i 1 (length$ $?obj-generos)) do
    (bind ?curr-obj (nth$ ?i ?obj-generos))
    (bind ?curr-nom (send ?curr-obj get-nombre))
    (bind $?nom-generos (insert$ $?nom-generos (+ 1 (length$ $?nom-generos)) ?curr-nom))
  )

  (bind $?respuestas (create$ ))
  (while (eq (length$ $?respuestas) 0) do
    (bind $?escogidos (pregunta-multi "Escoja sus generos favoritos: " $?nom-generos))

    (loop-for-count (?i 1 (length$ $?escogidos)) do
      (bind ?escogido (nth$ ?i $?escogidos))
      (if (> ?escogido (length$ $?obj-generos)) then (break)) 
      (bind ?curr-genero (nth$ ?escogido ?obj-generos))
      (bind $?respuestas(insert$ $?respuestas (+ (length$ $?respuestas) 1) ?curr-genero))
    )
  )

  (retract ?h)
  (assert (generos-favoritos TRUE))
  (modify ?pref (generos-favoritos $?respuestas))
)

(defrule preguntas-prefs::establecer-autores-favoritos "Establece los autores favoritos del lector"
  ?h <- (autores-favoritos ask)
  ?pref <- (preferencias)
  (generos-favoritos TRUE)
  =>
  (bind $?obj-autores (find-all-instances ((?inst Autor)) TRUE) )
  (bind $?nom-autores (create$ ))

  (loop-for-count (?i 1 (length$ $?obj-autores)) do
    (bind ?curr-obj (nth$ ?i ?obj-autores))
    (bind ?curr-nom (send ?curr-obj get-nombre))
    (bind $?nom-autores (insert$ $?nom-autores (+ 1 (length$ $?nom-autores)) ?curr-nom))
  )

  (bind $?respuestas (create$ ))
  (while (eq (length$ $?respuestas) 0) do
    (bind $?escogidos (pregunta-multi "Escoja sus autores favoritos: " $?nom-autores))
    (loop-for-count (?i 1 (length$ $?escogidos)) do
      (bind ?escogido (nth$ ?i $?escogidos))
      (if (> ?escogido (length$ $?obj-autores)) then (break)) 
      (bind ?curr-autor (nth$ ?escogido $?obj-autores))
      (bind $?respuestas(insert$ $?respuestas (+ (length$ $?respuestas) 1) ?curr-autor))
    )
  )
    
  (retract ?h)
  (assert (autores-favoritos TRUE))
  (modify ?pref (autores-favoritos $?respuestas))
)

(defrule preguntas-prefs::establecer-libros-leidos "Establece los libros leidos por el lector"
  ?h <- (libros-leidos ask)
  ?pref <- (preferencias)
  (autores-favoritos TRUE)
  =>
  (bind $?obj-libros (find-all-instances ((?inst Libro)) TRUE))
  (bind $?tit-aut-libros (create$))

  (loop-for-count (?i 1 (length$ $?obj-libros)) do
    (bind ?curr-obj (nth$ ?i ?obj-libros))
    (bind ?curr-tit (send ?curr-obj get-titulo))
    (bind ?curr-aut (send ?curr-obj get-autor))
    (bind ?curr-nom (send ?curr-aut get-nombre))
    (bind $?tit-aut-libros (insert$ $?tit-aut-libros (+ 1 (length$ $?tit-aut-libros)) (str-cat ?curr-tit " de " ?curr-nom) ))
  )

  (bind $?respuestas (create$))
  (bind $?leidos (pregunta-multi "Escoja los libros que ha leido (si no ha leido ninguno, escriba '0'): " $?tit-aut-libros))
  (loop-for-count (?i 1 (length$ $?leidos)) do
    (bind ?leido (nth$ ?i $?leidos))
    (if (<= ?leido (length$ $?obj-libros)) then 
      (bind ?curr-obj (nth$ ?leido $?obj-libros))
      (bind $?respuestas(insert$ $?respuestas (+ (length$ $?respuestas) 1) ?curr-obj))
    )
  )

  (retract ?h)
  (assert (libros-leidos TRUE))
  (modify ?pref (libros-leidos $?respuestas))
)

(defrule preguntas-prefs::determinar-gustan-populares "Determina si al lector les gustan los libros populares"
  ?h <- (gustan-libros-populares ask)
  ?pref <- (preferencias)
  (libros-leidos TRUE)
  =>
  (bind ?respuesta (pregunta-si-no "Le gustan los libros populares?"))
  (retract ?h)
  (assert (gustan-libros-populares TRUE))
  (modify ?pref (gustan-libros-populares $?respuesta))
)

(defrule preguntas-prefs::determinar-gustan-extranjeros "Determina si al lector les gustan los autores extranjeros"
  ?h <- (gustan-autores-extranjeros ask)
  ?pref <- (preferencias)
  (gustan-libros-populares TRUE)
  =>
  (bind ?respuesta (pregunta-si-no "Le gustan los autores extranjeros?"))
  (retract ?h)
  (assert (gustan-autores-extranjeros TRUE))
  (modify ?pref (gustan-autores-extranjeros $?respuesta))
  (focus abstraccion-problema)
)


;;; Modulo abstraccion problema -----------------------

;;;Abstraccion edad
(defrule abstraccion-problema::abstraccion-edad "Abstrae la edad"
  (Lector (edad ?edad))
  =>
  (if (< ?edad 10) then (assert (edad ninyo))
   else (if (< ?edad 18) then (assert (edad adolescente))
    else (if (< ?edad 30) then (assert (edad joven))
      else (if (< ?edad 50) then (assert (edad adulto))
        else (assert (edad anciano))
        )
      )
    )
  )
  (focus salida-recomendaciones)
)


;;; Modulo salida -------------------------------------

(defrule salida-recomendaciones::recomienda-edad "Regla recomendadora"
  ?h <- (edad ?edad)
  =>
  (printout t crlf)
  (if (eq ?edad ninyo) then (printout t "Ninyo" crlf)
    else (if (eq ?edad adolescente) then (printout t "Adolescente" crlf)
      else (if (eq ?edad joven) then (printout t "Joven" crlf)
        else (if (eq ?edad adulto) then (printout t "Adulto" crlf)
          else (if (eq ?edad anciano) then (printout t "Anciano" crlf))
        )
      )
    )
  )
  (retract ?h)
)
