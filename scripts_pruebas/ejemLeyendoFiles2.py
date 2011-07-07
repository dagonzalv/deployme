#Este ejemplo lee las lineas de un archivo,

import sys
import os

archivin = open('componentes.txt')


for linea in archivin.read().split('\n'):


    print linea.rstrip('\n')



archivin.close()
