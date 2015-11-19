; Thu Nov 19 15:42:52 CET 2015
; 
;+ (version "3.5")
;+ (build "Build 663")
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