#!/usr/bin/python2

f = open("perfiles.txt","w")

tiempos = ['corto', 'largo']
grupos = ['trepidante','tranquilo', 'etereo', 'feliz', 'triste']
edades = ['ninyo', 'joven', 'adulto']

for tiempo in tiempos:
	for grupo in grupos:
		for edad in edades:
			f.write(grupo + "_" + edad + "_" + tiempo + "\n")
