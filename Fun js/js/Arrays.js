
var Cr7 = {
    Nombre: 'Cristiano',
    Apellido: 'Ronaldo',
    Altura: 1.85,
    Salario_Hora: 60
}

var Messi = {
    Nombre: 'Lionel',
    Apellido: 'Messi',
    Altura: 1.70,
    Salario_Hora: 70
}

var Neymar = {
    Nombre: 'Neymar',
    Apellido: 'da silva',
    Altura: 1.74,
    Salario_Hora: 75
}

var Suarez = {
    Nombre: 'Luis',
    Apellido: 'Suarez',
    Altura: 1.82,
    Salario_Hora: 55
}

var Jugadores = [Cr7, Messi, Neymar, Suarez]

for(var i = 0; i < Jugadores.length; i++)
    console.log(`${Jugadores[i].Nombre} mide: ${Jugadores[i].Altura.toFixed(2)} metros`)


//___________________________________________________________________________________________________________________________    
//Filtar un array

//Forma como lo hacia en Java
for(var i = 0; i < Jugadores.length; i++){

    //Si los jugadores miden más de 1.80 se consideran jugadores altos
    if(Jugadores[i].Altura >= 1.80)
        console.log(`${Jugadores[i].Apellido} es alto ya que mide: ${Jugadores[i].Altura}`)
}

// Así se hace el ejmplo en el curso de javascript

const personaAlta = (persona) => persona.Altura >= 1.80;

var PersonasAltas = Jugadores.filter(personaAlta);//Filter devuelve un nuevo array con los objetos que cumplen con la condición de la función
//filter ejecuta la funcion "personaALta" por cada objeto que hay en el array 

console.log(PersonasAltas);

//___________________________________________________________________________________________________________________
//Tranformar un array 

const pasarAlturaCms = persona => {

    // persona.Altura *= 100;
    return{

        ...persona,
        Altura: persona.Altura * 100
        /*con los puntos suspensivos desglosamos el objeto que el cuál es el parametro y con
        esto creamos como una "copia" de ese objeto para así no modifcarlo como la línea de arriba.
        Ya que recordemos al pasar como parámetro un objeto en javascript este se pasa como referencia
        no como valor, por lo tanto es suceptible a los cambios en sus valores*/

        //Si lo hicieramos como la línea de arriba modificaríamos el array original
    }
    
}

var personaCms = Jugadores.map(pasarAlturaCms);/*
Map siempre devuelve un nuevo array y llama a la función pasarAlturaCms por cada objeto del array*/
//lo que modifica el array es la función (map solo devuelve un nuevo array modificado)

console.log(personaCms)

//_____________________________________________________________________________________________
//Reducir un array a un valor 

//Primero como se haría en sin el metodo reduce (a pata como en Java)

var acumulado = 0;

for(var i = 0; i < Jugadores.length; i++)
    acumulado += Jugadores[i].Salario_Hora;

//A continuación lo mismo pero como el profe dice

const reducer = (acumulado, { Salario_Hora }) => acumulado + Salario_Hora;
                            //Destructurando el objeto ya que solo accederemos a un atributo de este

var totalDeSalarios = Jugadores.reduce(reducer, 0)//parametros que le corresponde a la funcion reducer

console.log(acumulado===totalDeSalarios);









    


