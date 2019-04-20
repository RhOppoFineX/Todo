
var x = 4, y = '4'

console.log(x==y)//True
console.log(x===y)//False

/*En la compración con dos signos iguales lo que hace es que aunque sean 
de un tipo de dato diferente (uno entero y otro String) javascript pasa 
el entero a string o el string a entero para hacer la comparción */

/*En cambio el triple igual los compara como en java y como son tipos de datos diferentes da Falso*/

var Dt1 = {
    Nombre: 'Mourinho'
}

var Dt11 = {
    Nombre: 'Mourinho'
}

var Dt2 = {
    
    Nombre: 'Guardiola'    
}

var Siuu = Dt1;

console.log('Comparaciones de objetos.......')/*al comparar un objeto verificamos si esas variable "Objeto" apuntan al mismo espacio en
memoria como lo vemos en la variable Siuu
*/
console.log(Dt1==Dt11) //False se compara objetos no sus atributos
console.log(Dt1==Dt2)//False igual 
console.log(Siuu==Dt1)//true estan apuntando al mismo espacio en memoria

Dt11 = {
    ...Dt1 // Si hacemos esto estamos creando un nuevo objeto a partir de la información de Dt1 (Se copia)
            //Por lo tanto no serian el mismo y el resultado es false    
}

console.log(Dt1==Dt11) //false


Siuu.Nombre = 'Strong';//El valor del atributo cambia en las dos variables porque ambas estan apuntando al mismo objeto en memoria

console.log(Siuu.Nombre)
console.log(Dt1.Nombre)



