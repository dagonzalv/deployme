#Este ejemplo lee las lineas de un archivo,

import sys
import os

archivin = open('componentes.txt')

wars=[]

for linea in archivin.readlines():

    wars.append(linea.strip('\n'))

    print linea


archivin.close()
