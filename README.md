
# CIU-7-Sonido

### Autor: Víctor Herrera Delgado
Estudiante de Ingeniería Informática en la Universidad de Las Palmas de Gran Canaria, en último curso de su grado.


## Introducción 
La práctica en cuestión consiste en dados los conocimientos explicados en clase, proponer un concepto que además de las herramientas gráficas utilizadas anteriormente, use síntesis de sonido. En este caso, con el propósito de experimentar con la librería soundcipher, se ha realizado un pentagrama interactivo en el cual el usuario pueda escribir una pequeña melodía y reproducirla.    

**Aviso**: Para la síntesis de audio se ha importado la librería SoundCipher, es necesario importarla para su ejecución. Encontrará un enlace en la sección de referencias para su descarga.

## Programa
El programa permite en un pentagrama que representa dos octavas, escribir negras y blancas en las posiciones deseadas para generar una pequeña melodía. 

Un recuadro gris mostrará el tiempo en el que se encuentra el usuario y una línea gris la nota en la que se encuentra pudiendo moverse entre las notas del tiempo o a otros tiempos con las flechas de control, pudiendo introducir o borrar las blancas o negras deseadas con las teclas específicas. 
Varias notas pueden ser escritas en el mismo momento del tiempo, pudiendo así crear acordes.  

Una vez se pulse la tecla de reproducción no se aplicarán los nuevos cambios realizados. La reproducción actual se puede parar manualmente con la tecla de stop o dándole a reproducir de nuevo (reproduciendo así los cambios realizados).

Además, el programa permite cambiar el tempo de la reproducción, haciendo la separación temporal entre nota mayor o menor dependiendo de este.

También se puede disfrutar del modo PartyMode que es un modo mucho más disfrutable con auriculares puestos, siendo cada nota (ojo, nota no acorde) reproducido de manera distinta de forma que de la sensación que la fuente del sonido se mueve de izquierda a derecha y viceversa de forma rápida para ser notable con pocas notas.

## Código

El código se encuentra todo reunido en un único fichero, en donde creamos las clases Note (notas) y Chord (acordes) que nos servirán para simplificar el pentagrama.

Cada vez que el usuario introduce o elimina alguna nota esto se ve reflejado en las instancias de las clases ya mencionadas.

Cuando se pulsa reproducir, se inicializa un objeto SCScore en el cual declararemos lo necesario para que se reproduzca la melodía escrita por el usuario según las opciones deseadas (tempo y PartyMode). 



## Instrucciones

- **Flechas de control**: Moverse en la partitura (arriba y abajo para las notas y de izquierda a derecha para los tiempos).

- **B**: Insertar una nota blanca.  
- **N**: Insertar una nota negra.   
- **M**: Eliminar una nota. 
- **R**: Eliminar todas las notas del pentagrama.
- **Enter**: Reproducir el conjunto musical.
- **Retroceso**: Parar la reproducción actual.

- **P**: Activar o desactivar el PartyMode.

- **'+' y '-'**: aumentar o disminuir el tempo de la reproducción.  

## Decisiones
Si bien es verdad que la práctica no realiza mucha edición de sonido, el autor no le veía mucha más utilidad que entretenimiento a estas herramientas. Dado que el autor no tiene conocimientos musicales aun queriendo intentar componer algo pequeño, las herramientas encontradas (como MuseScore) eran para gente con conocimiento en música, así que se buscó desarrollar una aplicación sencilla que permitiera componer pequeñas melodías, a pesar de la posible simpleza de esto.

Se intentó implementar visualización gráfica a partir de lo aprendido con la librería minim, sin embargo, era poco satisfactoria la forma en la que se implementaba con processing.

En cuanto a la implementación de gráficos usando SoundCipher, esto obligaba a cambiar la mayor parte del proyecto, así que en sustitución a eso se implementó el PartyMode y el cambio de tempo.



## Funcionamiento
El gif no muestra el verdadero rendimiento de la aplicación.  
![](Practica7.gif)

## Referencias

Librería utilizada:  
http://explodingart.com/soundcipher/index.html

Programa usado para comprobar los tonos musicales:  
https://play.google.com/store/apps/details?id=com.tadaoyamaoka.vocalpitchmonitor&hl=en

Conversor de video a gif  
https://hnet.com/video-to-gif/

Grabación del programa  
https://obsproject.com/



