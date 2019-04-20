
var Person = {

    Nombre: 'Ronaldo',
    Apellido: 'Nazario',
    Edad: 40,
    Ingeniero: false,
    Calvo: true,
    Futbolista: true,
    Activo: false,
    Inactivo: true,
    Cocinero: false,
    djcojo: false,   

}

var Mamut = {

    Nombre: 'Joe',
    Apellido: 'Campell',
    Edad: 17

}

function ImprimirAtributos(Person){

    console.log(`${Person.Nombre} ${Person.Apellido} es: `)

    if(Person.Ingeniero){
        console.log('Ingeniero')
    }

    if(Person.Calvo){
        console.log('Calvo')
    }

    if(Person.Futbolista){
        console.log('Futbolista')
    }

    if(Person.Activo){
        console.log('Está activo')
    }

    if(Person.Inactivo){
        console.log('Está inactivo')
    }

}

//ARROW FUNTIONS OTRO TEMA



const MAYORIA_DE_EDAD = 18;//Constante su valor no varia nunca por eso se pone const y no var (de variable)
                            //Se ponen en mayúsculas por convención
ImprimirAtributos(Person) 


function TrueOrFalse(Person)
{
    return Person.Edad >= MAYORIA_DE_EDAD 
} 


function Mayor_O_Menor(Person)
{
    if(TrueOrFalse(Person))                                  //Llamamos a una función dentro de una función
        console.log(`${Person.Nombre} es mayor de edad`)
    else
        console.log(`${Person.Nombre} es menor de edad`)

    return Person
}

//A CONTINUACIÓN se hará el mismo codigo de arriba pero con Arrow functions

// es como la función TrueOrFalse de arriba. Este tipo funcion se denomina "Funcion anonima"

const esMayorDeEdad = function (persona){

    return persona.Edad >= MAYORIA_DE_EDAD;
}


//Esto es una Arrow function 
const esMayorDeEdad_ArrowFuntion = (persona) => {

    return persona.Edad >= MAYORIA_DE_EDAD;
}

//Si la Arrow functin solo recibe un parámetro podemos quitar los parentesis y si solo devuelve un valor podemos quitar las llaves.
// y quitar el return

const esMayorDeEdad_ArrowFuntion_Dos = persona =>  persona.Edad >= MAYORIA_DE_EDAD;

const esMayorDeEdad_ArrowFuntion_Tres = ({Edad}) => Edad >= MAYORIA_DE_EDAD;//"Destructurando el objeto al solo pedir un atributo"


function imprimirSiEsMayorDeEdad(Person)
{
    //Se puede cambiar por cualquier funcion del ejemplo que verifique la si es mayor o menor de edad
    if(esMayorDeEdad_ArrowFuntion_Tres(Person))                                 //Misma funcion Mayor_O_Menor pero con distinto nombre para este ejemplo
        console.log(`${Person.Nombre} es mayor de edad: ${Person.Edad}`)
    else
        console.log(`${Person.Nombre} es menor de edad: ${Person.Edad}`)

    return Person 
}





