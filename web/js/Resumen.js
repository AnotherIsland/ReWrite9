/* 
 * Axolotech - 6IM8
 * 
 * REWRITE
 */
function agregaPalabra(pal) {
    let palabra = null;
    let icon = null;
    let span = null;
    let pala = '';
    let guarda = '';
    let bandera = 0;
    if (pal.value !== '') {
        palabra = document.createElement('li');
        icon = document.createElement('i');
        span = document.createElement('span');

        palabra.setAttribute('class', 'white-text');
        icon.setAttribute('class', 'tiny material-icons');
        span.setAttribute('class', 'palabra');

        icon.innerHTML = 'check';
        
        pala = pal.value;
        
        for(i = 0; i < pala.length; i++){    
            if((i === pala.length-1) && pala.charAt(pala.length-1)===' '){
                bandera = 1;
            }else
                guarda = guarda + pala.charAt(i);
        }
        span.innerHTML = guarda;

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
    let lista1 = [0];//Palabras clave en lista
    let lista2 = [0];//Palabras en todo texto
    let lista3 = [0];//Palabras clave en texto
    let lista4 = [0];//Palabras clave FALTANTES en texto
    let numPalabra = 0;
    let numPalabra1 = 0;
    let noHay = 0;
    let texto = '';
    let guarda = '';
    
    let largo = 0;
    
    largo = lista4.length-1;
    lista4.slice(0,largo);
    
    for(i = 0; i < lista3.length; i++){ 
        lista3.shift();
    }
    for(i = 0; i < lista2.length; i++){ 
        lista2.shift();
    }
    for(i = 0; i < lista1.length+1; i++){ 
        lista1.shift();
    }
    console.log(lista4);
    
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
    //Comparando palabras de lista1 y lista2, agregando a lista 3 las que están, 
    //a lista4 las que faltan
    
    for(i = 0; i < lista1.length; i++){ 
        for(j = 0; j < lista2.length; j++){ 
            if(lista1[i] === lista2[j]){
                lista3[numPalabra] = lista1[i];
                numPalabra++;
                noHay = 1;
            }
        } 
        if(noHay === 0){
            lista4[numPalabra1] = lista1[i];
            numPalabra1++;
        }
    }
    
    //Despliega las palabras que faltan 
    let palabra = null;
    let icon = null;
    let span = null;
    let borra = null;
    
    
    borra = document.getElementsByClassName('palabraClave');
    for(i = 0; i < borra.length;i++){
            document.getElementById('faltanClaves').removeChild(borra[i]);
        }
    
    for(i = 0; i < lista4.length;i++){
        palabra = document.createElement('li');
        icon = document.createElement('i');
        span = document.createElement('span');

        palabra.setAttribute('class', 'palabraClave');
        icon.setAttribute('class', 'tiny material-icons');
        span.setAttribute('class', 'white-text');
        icon.innerHTML = 'priority_high';
        
        span.innerHTML = lista4[i];
        
        palabra.appendChild(icon);
        palabra.appendChild(span);

        document.getElementById('faltanClaves').appendChild(palabra);
    }
            
    
    
    
    
    

    
    
}
