var nombre = 'Diego', edad = 18;


function imprimirEdad(nom, age){

    console.log(`${nom} tiene ${age} años`) /*no es necesario el punto y coma al final de una sentencia en Javascript*/
}

imprimirEdad('Resio', 18)
imprimirEdad(nombre, edad)

/*Mismo temas mas profundizado*/

var nombrenuevo = "Strong";

function imprimirNombreMayusculas(ParametroNombre){

    // 1*- nombrenuevo = nombrenuevo.toUpperCase();
    ParametroNombre = ParametroNombre.toUpperCase();
    console.log(ParametroNombre);
}

imprimirNombreMayusculas(nombrenuevo);
console.log(nombrenuevo);

/*en la sentencia comnetada en la funcion imprimirNombreMayusculas
se cambiaba el valor de la variable nombrenuevo para poder imprimirla en mayúsculas
pero como declaramos que dicha funcion recibirá un parametro (ParametroNombre)
el valor almacenado en nombrenuevo se copia al valor del parametro
para así no modificar el valor de la variable global nombrenuevo*/


//  Objetos Es otro tema
//Objeto
var Persona = {

   /*Clave*/ Name: "Diego", /*Valor*/
    Apellido: "Arias", 
    Edad: 18    

}
//Objeto
var Persona2 = {

    Name: "Cristiano",
    Apellido: "Ronaldo",
    Edad: 17
}

function imprimirDatos(Objeto)
{    
    console.log(`Hola ${Objeto.Name} ${Objeto.Apellido} Tú tienes la edad de ${Objeto.Edad} años`)

    /*Destructurar objetos*/
    //var nombre = Objeto.Name  "Esto es lo mismo que la línea de abajo"
    var {Name} = Objeto;
    console.log(Name.toLowerCase())

}

imprimirDatos(Persona);
imprimirDatos(Persona2);

//También se puede solo pedir por parametro el atributo de un objeto (Tiene que estar escrito exactemente el parametro y el atributo )

function imprimirSoloUnAtributo({Name}){

    console.log(Name.toUpperCase())
}

imprimirSoloUnAtributo(Persona)
imprimirSoloUnAtributo(Persona2)
imprimirSoloUnAtributo( {Name: 'Siuu'} )










