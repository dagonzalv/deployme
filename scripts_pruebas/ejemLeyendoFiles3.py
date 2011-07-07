#Este ejemplo lee las lineas de un archivo,

import sys
import os

archivin = open('componente.txt')

#linea3 = archivin.readline()

#print linea1.rstrip('\n')
#print linea2.rstrip('\n')
#print linea3.rstrip('\n')

for linea in archivin.readlines():
	print linea.strip('\n')




archivin.close()
