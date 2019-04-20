

switch (new Date().getDay()) {
    case 0:
     alert("Sunday");
      break;
    case 1:
     alert("Monday");
      break;
    case 2:
      alert("Tuesday");
      break;
    case 3:
     alert("Wednesday");
      break;
    case 4:
     alert("Thursday");
      break;
    case 5:
     alert("Friday");
      break;
    case 6:
     alert("Saturday");
  }

  var numero = parseInt(prompt('Ingresa un numero'))

  switch(numero){

    case 1:
      alert('Maje')
    break;  
    case 2:
      alert('Erazo')
    break;  
    default:
      alert('Siuuu')  

  }

  var string = prompt('Ingresa la palabra maje')

  switch (string){

    case 'Maje'://si ingresa la palabra maje en minisculas la inicial o en mayuscula ejecutará la misma alerta
    case 'maje':

    alert('¡Hola maje!')

    break

    default:
      alert('Muy mal maje')
      break
  }