
//Esto no es una función es un "prototype" de persona (Persona tiene un atributo prototype que "Simula un clase")
//Esta funcion se llama "Funcion constructora" (es como un contructor en Java)
function Persona (Nombre, Apellido, Edad){

    this.Nombre = Nombre;
    this.Apellido = Apellido;
    this.Edad = Edad;
    //Implicitamente hay un (return this)
}

/*Aquí decimos:
"Dentro del protipo de Persona va a existir un metodo "saludar" que será una función */
Persona.prototype.Saludar = function () {
    console.log(`Hola soy: ${this.Nombre} ${this.Apellido}`)
}

var Van_Dijk = new Persona('Van', 'Dijk', 26);

Van_Dijk.Saludar()

//Ejercicio

const MAYORIA_EDAD = 18;

var menorDeEdad = ({Edad}) => Edad < MAYORIA_EDAD;

Persona.prototype.soyMenorDeEdad = function() {
    if(menorDeEdad(this))
     console.log(`${this.Nombre} ${this.Apellido} tiene: ${this.Edad} por eso es menor de edad`)
}


var kante = new Persona('N_Golo', 'Kante', 24);
var ben = new Persona ('Ben', 'Yedder', 21);
var Vini_Oficial = new Persona('Sobre', 'Valoradicius', 17);
var De_jong = new Persona('De', 'Jong', 17);

var array = [Van_Dijk, kante, ben, Vini_Oficial, De_jong];

//var menores = array.filter(menorDeEdad);


for(var i = 0; i < array.length; i++){
    array[i].soyMenorDeEdad();
}
//Fin del ejercicio

//Ejercicio de la clase, el anterior lo hice yo

Persona.prototype.soyMayorDeEdad = function () {

    return this.Edad >= MAYORIA_EDAD
}

//Misma funcion pero en versión arrow function

Persona.prototype.mayorDeEdad = () => this.Edad >= MAYORIA_EDAD;


for(var i = 0; i < array.length; i++)
     console.log(array[i].soyMayorDeEdad());   


console.log('a continuación con arrow function')

for(var i = 0; i < array.length; i++)
    console.log(array[i].mayorDeEdad());

/*en las arrow function el (this) no es el objeto sobre el cuál llamamos a la función
si no que es el objeto (hace referencia) window dentro del navegador.

Esto solo ocuure con las arrow function y no con las funciones o funciones anonimas como se muestra

por ello dan 5 false seguidos en la consola ya que la comparación entre el objeto window que as al cuál rerefiere this en las arrow function
se compará con el numero 18 que es valor que contiene la variable MAYORIA_EDAD*/    
    
    




