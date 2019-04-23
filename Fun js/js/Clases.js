
const Alto_o_bajo = 1.70;

//adentro de la clase
var soyAlto = ({altura}) => altura >= Alto_o_bajo 

class Persona {

    constructor(nombre, apellido, altura){

        this.nombre = nombre;
        this.apellido = apellido;
        this.altura = altura;
    }

    saludar(){
        if(soyAlto(this))
            console.log(`Hola me llamo: ${this.nombre} ${this.apellido} y soy alto/a`)
        else
            console.log(`Hola me llamo: ${this.nombre} ${this.apellido} y soy bajo/a`)
    }
    
}

//Como en Java Siuuuuu
class Desarrollador extends Persona{
    
    constructor(nombre, apellido, altura){

        super(nombre, apellido, altura);
        //Podemos acceder a this pero después de acceder llamar al constructor padre
    }

    saludar(){
        console.log(`Hola me llamo: ${this.nombre} ${this.apellido} y soy desarrollador`)
    }

}

var Majo = new Persona('María José', 'Castellanos', 1.60)
var Diego = new Desarrollador('Diego', 'Arias', 1.70)

console.log(Majo.saludar())
console.log(Diego.saludar())
