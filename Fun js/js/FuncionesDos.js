
var Persona = {

    Nombre: 'Rosa',
    Apellido: 'Meltrozo',
    Edad: 19

}

function cumpleBenjaminButton(Persona){ 

    Persona.Edad -= 1;
    /*Javascript si pasas como parametro un objeto 
    No es lo mismo que con las variables
    ya que cuando pasamos un objeto el valor no se
    copia al parametro sino que sigue referenciando
    al objeto que se pasó por eso podemos acceder directamente 
    a el y modificarlo
    */
}

function cumpleNormal(Persona){

    return{                 /*con estos ... se copia el objeto que pasamos por parametro para no afectar al objeto "Original"
                            (Se crea otro objeto con los mismos valores y atributos y si queremos podemos agregar nuevos
                                y modficar su valor)*/
        ...Persona,
        Edad: Persona.Edad + 1
        
    }    

}

