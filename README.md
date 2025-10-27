**Cómo se usa**

0. Crear las asignaturas en el campus virutal
Si aún se está a tiempo, es mejor crear la asignatura con los dos turnos (A, B) fusionados. En caso de que se hayan creado por separado, más adelante habrá que unir las dos listas exportadas.

1. Exportar la lista en formato CSV
Ya en el campus virutal, en el margen izquierdo está el enlace a Calificaciones.  Se habrá abierto una página con la lista de estudiantes con mucha información. Para exportarla, vaya a la pestaña Exportar arriba a la derecha.
Ahora desaparecen los estudiantes y aparecen nuevas pestañas con las opciones de formatos para exportar. Elija Archivo de texto CSV.  Ası́ tal cual se exportarán muchas columnas innecesarias. Aunque no afecta al funcionamiento de Sı́sifo, puede quitar todo lo innecesario para generar ficheros más manejables.
Ya puede pulsar en el botón Descargar.
Ahora viene un paso truculento en algunos sistemas operativos. Normalmente, el navegador le preguntará si quiere guardar el archivo o abrirlo con alguna aplicación. Guarde el archivo en el mismo directorio (carpeta, folder, como se diga en su sistema) donde tiene a SISIFO3.R y cambie el nombre para que Sı́sifo

2. Ejecutar SISIFO3.R
Como Sı́sifo está escrito en R, es necesario tenerlo en el ordenata, claro. El proceso de instalación cambia un poco dependiendo del sistema, pero viene muy bien explicado en https://cran.rediris.es/
Para hacer funcionar el programa, abrimos una ventana con un terminalde sistema. En la terminal, vaya al directorio donde tenga la carpeta SISIFO3. Muévase por los directorios con la orden [cd "nombre-de-directorio"] sin los corchetes, para volver al directorio anterior escriba [cd ..]. En Linux y MacOSX puede navegar por el escritorio/ventanas hasta el directorio y, una vez allı́, abrir la terminal. En güindols no, que yo sepa. Una vez en el susodicho, ejecute la orden Rscript SISIFO3.R (en Linux y MacOSX, en windous –dependiendo de la versión– lo más probable es que tenga que especificar la localización del programa Rscript.exe).

3. Y ya está
Listo. En el directorio habrán aparecido 12 nuevos archivos (las dos listas totales de los dos turnos, más los 2 × 5 listados de grupos de las asignaturas.  El formato de los archivos es texto plano con codificación UNICODE (UTF-8) para preservar tildes y letras raras como la ñ. Cualquier procesador de texto u hoja de cálculo decente podrá importarlos sin problemas, manteniendo las columnas y formato, independientemente del sistema operativo.
