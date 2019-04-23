 /* To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
let silabas = 0;
let verso;

function cuentaSilabas(linea){//cuenta las silabas, contando vocales
  
  linea = document.getElementById('prueba').value;
  console.log(linea);
  let i = 0;
  for( i of linea){
    let letra = linea.charAt(i);
    //console.log(i);
    if(linea.charAt(i-1) != ' '){
      if(letra == 'a'||letra == 'e'||letra == 'i'||letra == 'o' ||letra == 'u'||letra == 'h'){
        if(linea.charAt(i-1) != 'a'||linea.charAt(i-1) != 'e'||linea.charAt(i-1) != 'i'||linea.charAt(i-1) != 'o'
          ||linea.charAt(i-1) != 'u'||linea.charAt(i-1) != 'h'){
          silabas = silabas + 1;
        }
      }
    }
  }
  console.log(silabas);
  return silabas;
}



