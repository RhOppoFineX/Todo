
function heredaDe(prototipoHijo, prototipoPadre){
    
    var fn = function() {}
    fn.prototype = prototipoPadre.prototype
    prototipoHijo.prototype = new fn
    prototipoHijo.prototype.constructor = prototipoHijo

}

function Persona (Nombre, Apellido, Edad){

    this.Nombre = Nombre;
    this.Apellido = Apellido;
    this.Edad = Edad;
    //Implicitamente hay un (return this)
}

/*Aquí decimos:
"Dentro del protipo de Persona va a existir un metodo "saludar" que será una función */
Persona.prototype.saludar = function () {
    console.log(`Hola me llamo: ${this.Nombre} ${this.Apellido}`)
}

//Otro Prototipo "Desarrollador"

function Desarrollador(Nombre, Apellido){

    this.Nombre = Nombre;
    this.Apellido = Apellido;
}

heredaDe(Desarrollador, Persona);//"Mecanismo de Herencia"

//Sobreescribimos el metodo saludar
Desarrollador.prototype.saludar = function () {
    console.log(`Hola me llamo: ${this.Nombre} ${this.Apellido} y soy desarrolador`);
}

console.log(new Persona('Mamon', 'Erazo', 1.69).saludar())
console.log(new Desarrollador('Cristiano', 'Ronaldo').saludar())






