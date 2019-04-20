/*Variables numericas
son las mismas operaciones que en otros lenguajes como java 
y se hacen casi de la misma forma */

var precioVino = 200.3;

precioVino *= 3;

/*los deciamles no son exactos en javascript por eso hay que aproximarlos con: */

var total = Math.round(precioVino*100)/100;

var totalStr = total.toFixed(2); /*para indicar cuantos deciamles tendrá el número (este metodo devuelve un String)*/

var total2 = parseFloat(totalStr);

var totalFinal =  parseFloat(precioVino.toFixed(2));






