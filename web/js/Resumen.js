/* 
 * Axolotech - 6IM8
 * 
 * REWRITE
 */
function agregaPalabra(pal) {
    let palabra = null;
    let icon = null;
    let span = null;
    if (pal.value !== '') {
        palabra = document.createElement('li');
        icon = document.createElement('i');
        span = document.createElement('span');

        palabra.setAttribute('class', 'white-text');
        icon.setAttribute('class', 'tiny material-icons');
        span.setAttribute('class', 'palabra');

        icon.innerHTML = 'check';
        span.innerHTML = pal.value;

        palabra.appendChild(icon);
        palabra.appendChild(span);
        document.getElementById('listaClaves').appendChild(palabra);
        pal.value = '';
    } else {
        return false;
    }
}
function pClaves(){
    let contenido = document.getElementById('contenido');
    let lista = document.getElementsByClassName('palabra');
    let lista1 = [];//Palabras clave en lista
    let lista2 = [];//Palabras en todo texto
    let lista3 = [];//Palabras clave en texto
    let lista4 = [];//Palabras clave FALTANTES en texto
    let numPalabra = 0;
    let numPalabra1 = 0;
    let texto = '';
    let guarda = '';
    texto = contenido.value;
    
    //Extrae palabras de la lista de palabras clave
    for(i = 0; i < lista.length; i++){ 
        lista1[i] = lista[i].innerHTML;
    }
    
    //Extrae palabras del texto ya las mete en arreglo lista2
    for(i = 0; i < texto.length; i++){        
        if(texto.charAt(i) === ' '){
            lista2[numPalabra] = guarda; 
            guarda = '';
            numPalabra++;
        }else{
            guarda = guarda + texto.charAt(i);
        }
    }numPalabra = 0;
    //Comparando palabras de lista1 y lista2
    for(i = 0; i < lista1.length; i++){ 
        for(j = 0; j < lista2.length; j++){ 
            if(lista1[i] === lista2[j]){
                console.log(lista1[i] +'-'+lista2[j]);
                lista3[numPalabra] = lista1[i];
            }
        }   
    }
console.log(lista3);
}
