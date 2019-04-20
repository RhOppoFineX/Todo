
var Persona = {
    Nombre: 'N_Golo',
    Apellido: 'Kante',
    Edad: 26,
    Peso: 75
}

console.log(`Al inicio del año ${Persona.Nombre} ${Persona.Apellido} pesa: ${Persona.Peso} Kg`)

const INCREMENTO = 0.1;
const DECREMENTO = 0.17;
const DIAS_DEL_YEAR = 365;

const aumentarDePeso = Persona  =>  Persona.Peso += INCREMENTO;
const bajarDePeso = Persona => Persona.Peso -= DECREMENTO;

for (var i = 0; i <DIAS_DEL_YEAR; i++){

    var Random = Math.random();
    
    if(Random <= 0.25){
        //Aumenta de peso
        aumentarDePeso(Persona)

    }
    else if (Random >= 0.75){
        //Disminuye de peso
        bajarDePeso(Persona)
    }
}

console.log(`Al final del año ${Persona.Nombre} ${Persona.Apellido} pesa: ${Persona.Peso.toFixed(2)}`)

//BUCLES WHILE

var Persona_Dos = {
    Nombre: 'Maisas',
    Apellido: 'Squena',
    Edad: 16,
    Peso: 70
}

const META_PESO = Persona_Dos.Peso-5;

//Arrow function sin parametros
const comeMucho = () => Math.random() < 0.3;

const haceDeporte = () => Math.random() < 0.4;

var dias = 0;

while(Persona_Dos.Peso >= META_PESO){

    dias ++;
    //debugger si ponemos esta palabra el programa se detendrá en esta línea para que verifiquemos si el funcionamiento es correcto y encontrar un error si lo hay        
    
    if(haceDeporte())
        bajarDePeso(Persona_Dos)      

    else if (comeMucho())
        aumentarDePeso(Persona_Dos)        

}

console.log(`${Persona_Dos.Nombre} ${Persona_Dos.Apellido} ahora pesa: ${Persona_Dos.Peso.toFixed(2)} y tradó: ${dias} días`);

//Buble do-while
var contador = 0;
const llueve = () => Math.random() < 0.25


do{//Hacer

    contador++; 
    
}while(!llueve())//mientras no llueva el "!" significa que la condición tiene que ser falsa para seguir con el bucle

var frecuencia = contador===1 ? "vez" : "veces"//If in-line
//si es verdedera la comparación el valor de la varable frecuencia será "vez"
//si no sera "veces"

console.log(`Salí a ver si llovía ${contador} ${frecuencia}`)





