

console.log('Hola maje XD');

var nombre, apellido='Strong';
nombre = "El resio";/*los Strings en javascript pueden ir en comillas simples o dobles*/

console.log("Hola " + nombre + ' ' + apellido);/*concatenación de strings*/

var nombre_mayusculas = nombre.toUpperCase();/*Pasar a mayusculas*/

var apellido_minusculas = apellido.toLowerCase();/*Pasar a minusculas*/

var primer_letra_nombre = nombre.charAt(0);/*saber que letra se encuentra en esa poscisión*/

var posicion_letra_del_nombre = nombre.indexOf('E');/*saber en que poscisión se encuentra esa letra*/

var cantidad_caracteres = nombre.length

var nombreCompleto = nombre + ' ' + apellido

var nombreCompleto_interpolacion_strings = `${nombre.toLowerCase()} ${apellido.toUpperCase()}`
/*es interpolacion de strings. Dentro de las llaves se puede escribir codigo*/

var Sub_String = nombre.substr(3,8); /*toma desde el primer numero hasta el segundo numero(comienza desde 0 siempre para contar las poscisiones)*/
/*cadenas dentro de cadenas*/

var nombre_usuario = prompt('Ingresa tu nombre maje por favor XD', 'ejemplo: Ronaldo')

alert("La ultima letra of your name is: " + nombre_usuario.charAt(nombre_usuario.length-1))

















