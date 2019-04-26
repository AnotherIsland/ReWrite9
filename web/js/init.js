//Implementaciones de Materialize
$(document).ready(function () {
    $('.sidenav').sidenav();
    $('.parallax').parallax();
    $('.collapsible').collapsible();
    $('select').formSelect();
    $('.modal').modal();
    $('.carousel').carousel();
    $('input#input_text, textarea#textarea2').characterCounter();
});

//Funcionalidad de los módulos

function mostrarTipoRef() {
    var btn = document.getElementById('tipoRef');
    if (btn.hidden === true) {
        document.getElementById('tipoRef').hidden = false;
    } else {
        document.getElementById('tipoRef').hidden = true;
    }
}
function mostrarEstrofa() {
    var btn = document.getElementById('tipoEstro');
    if (btn.hidden === true) {
        document.getElementById('tipoEstro').hidden = false;
    } else {
        document.getElementById('tipoEstro').hidden = true;
    }
}
function mostrarCompartir() {
    var btn = document.getElementById('share');
    if (btn.hidden == true) {
        document.getElementById('share').hidden = false;
    } else {
        document.getElementById('share').hidden = true;
    }
}
function cuentaPalabras(texto) {
    var numPalabra = 0;
    var guarda = '';
    var listaP = [];

    //Extrae palabras del texto ya las mete en arreglo listaP
    listaP = texto.split(' ');
    numPalabra = listaP.length;

    var span = document.createElement('span');
    var h6 = document.getElementById('numP');

    span.innerHTML = ' ' + numPalabra;
    span.id = 'spanNumP';
    console.log(numPalabra);
    if (document.getElementById('spanNumP')) {
        h6.removeChild(document.getElementById('spanNumP'));

    }
    document.getElementById('numP').appendChild(span);
}
function agregaPalabra(pal) {
    var palabra = null;
    var icon = null;
    var span = null;
    var pala = '';
    var guarda = '';
    var bandera = 0;
    var inputP = null;
    var numP = 1;
    if (pal.value !== '') {
        palabra = document.createElement('li');
        icon = document.createElement('i');
        span = document.createElement('span');
        inputP = document.createElement('input');
        
        if (document.getElementsByClassName('palabra').length !== 0) {
            numP = document.getElementsByClassName('palabra').length + 1 ;
            console.log(numP);
        }

        palabra.setAttribute('class', 'white-text');
        icon.setAttribute('class', 'tiny material-icons');
        span.setAttribute('class', 'palabra');

        icon.innerHTML = 'check';

        pala = (pal.value).toLowerCase();

        for (i = 0; i < pala.length; i++) {
            if ((i === pala.length - 1) && pala.charAt(pala.length - 1) === ' ') {
                bandera = 1;
            } else
                guarda = guarda + pala.charAt(i);
        }
        span.innerHTML = guarda;
        
        inputP.setAttribute('value',guarda);
        inputP.setAttribute('name','pClaveI'+numP);
        inputP.setAttribute('hidden','true');

        palabra.appendChild(icon);
        palabra.appendChild(span);
        document.getElementById('listaClaves').appendChild(palabra);
        document.getElementById('form1').appendChild(inputP);
        pal.value = '';
    } else {
        return false;
    }
}
function pClaves() {
    var contenido = document.getElementById('contenido');
    var lista = document.getElementsByClassName('palabra');
    var inputP = document.createElement('input');
    var lista1 = [];//Palabras clave en lista
    var lista2 = [];//Palabras en todo texto
    var lista3 = [];//Palabras clave en texto
    var lista4 = [];//Palabras clave FALTANTES en texto
    var numPalabra = 0;
    var numPalabra1 = 0;
    var noHay = 0;
    var texto = '';
    var guarda = '';
    var largo = 0;

    largo = lista4.length - 1;

    console.log(lista4);

    //Extrae palabras de la lista de palabras clave
    for (i = 0; i < lista.length; i++) {
        lista1[i] = lista[i].innerHTML;
        inputP.value =  "," +lista1[i];
        console.log(inputP.value);
    }

    //Extrae palabras del texto y las mete en arreglo lista2
    texto = contenido.value;
    lista2 = texto.split(' ');

    for (i = 0; i < lista2.length; i++) {
        lista2[i] = lista2[i].toLowerCase();
    }
    //Comparando palabras de lista1 y lista2, agregando a lista 3 las que están, 
    //a lista4 las que faltan

    for (i = 0; i < lista1.length; i++) {
        for (j = 0; j < lista2.length; j++) {
            if (lista1[i] === lista2[j]) {
                lista3[numPalabra] = lista1[i];
                numPalabra++;
                noHay = 1;
            }
        }
        if (noHay === 0) {

            lista4[numPalabra1] = lista1[i];
            numPalabra1++;
            console.log(lista4[numPalabra1]);
        }
    }
    console.log(lista4);

    //Despliega las palabras que faltan 
    var palabra = null;
    var icon = null;
    var span = null;
    var borra = null;


    borra = document.getElementsByClassName('palabraClave');
    for (i = 0; i < borra.length; i++) {
        document.getElementById('faltanClaves').removeChild(borra[i]);
    }

    for (i = 0; i < lista4.length; i++) {
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
    
    document.getElementById('pClave').appendChild(inputP);
}
//Revisión por módulos
function revEnsayo() {

    var intro = document.getElementById('intro');
    var desa = document.getElementById('desarrollo');
    var conclu = document.getElementById('conclusion');
    var numRef = 0;
    var inputNRef = document.createElement('input');

    var texto = intro.value + ' ' + desa.value + ' ' + conclu.value;
    console.log(texto);
    cuentaPalabras(texto);
    
    //Revisa si hay referencias en el documento
    if (document.getElementsByClassName('pRef').length !== 0) {
        numRef = document.getElementsByClassName('pRef').length;
        console.log(numRef);
    }
    //Añade input de numero de ref
    inputNRef.value = numRef;
    inputNRef.setAttribute('name','numRef');
    inputNRef.setAttribute('hidden','true');
    document.getElementById('referencias').appendChild(inputNRef);

}
function revResumen() {
    pClaves();
    cuentaPalabras(document.getElementById('contenido').value);
    
    //Revisa si hay referencias en el documento
    if (document.getElementsByClassName('pRef').length !== 0) {
        var numRef = document.getElementsByClassName('pRef').length;
        console.log(numRef);
    }
    //Añade input de numero de ref
    /*var inputNRef;
    inputNRef.value = numRef;
    inputNRef.setAttribute('name','numRef');
    inputNRef.setAttribute('hidden','true');
    document.getElementById('referencias').appendChild(inputNRef);*/
}
//Funcionalidad de referencias
function newRef(ref) {
    var refer = null;//Div donde irán los inputs para añadir una referencia
    var h7 = document.createElement('h7');
    var label = document.createElement('label');
    var br = document.createElement('br');
    var br1 = document.createElement('br');
    var inputs = [1];
    var labels = [1];
    var numDivs = 0;
    var numInputs = 0;
    var inputN = null;
    var numId = 0;
    var labelN = null;

    //Revisa si hay referencias en el documento
    if (document.getElementsByClassName('pRef').length !== 0) {
        numDivs = document.getElementsByClassName('pRef').length;
        numInputs = numDivs * 8;
        numId = numInputs;
    } else {
        numInputs = 8;
    }
    //Primero crea el div para contener los inputs de la referencia
    refer = document.createElement('div');
    refer.setAttribute('class', 'refe');
    refer.id = 'refe' + (numDivs + 1);

    for (var i = 1; i <= 8; i++) {
        inputN = document.createElement('input');
        inputs[i] = inputN;
        inputs[i].type = 'text';
        inputs[i].setAttribute('class', 'input-field oculto refi');
        inputs[i].id = "input" + (numId + 1);
        //Crea las etiquetas para los inputs
        labelN = document.createElement('label');
        labelN.setAttribute('for', inputs[i].id);
        labelN.setAttribute('class', 'active');
        labels[i] = labelN;
        numId++;
    }
    //Para el input de submit
    inputs[8].type = 'button';
    inputs[8].setAttribute('name', 'agregar');
    inputs[8].setAttribute('class', 'btn agregar waves-effect waves-light');
    inputs[8].setAttribute('onclick', 'agregaRef(this)');
    inputs[8].value = 'Agregar';
    inputs[8].id = (numId);

    //Para el span y label
    h7.innerHTML = 'Referencia No. ' + (numDivs + 1);
    h7.id = 'tituloRef' + (numDivs + 1);
    label.innerHTML = 'Fecha de consulta: ';
    label.setAttribute('for', 'fechaConsulta');

    inputs[1].setAttribute('placeholder', 'Apellido, inicial del nombre. Ej. Sánchez, R');

    inputs[1].setAttribute('name', 'autor');
    inputs[2].setAttribute('name', 'titulo');
    inputs[3].setAttribute('name', 'anio');
    inputs[7].setAttribute('hidden', 'true');

    //Para labels
    labels[1].innerHTML = 'Autor: ';
    labels[2].innerHTML = 'Título: ';
    labels[3].innerHTML = 'Año: ';

    //Para validar inputs
    inputs[1].setAttribute('onkeypress', 'validap();');
    inputs[2].setAttribute('onkeypress', 'validap();');
    inputs[3].setAttribute('onkeypress', 'validaNum();validaAnio(this);');
    inputs[3].setAttribute('maxlength', '4');
    inputs[4].setAttribute('onkeypress', 'validap();');

    if (ref.value == '1') {//Si es referencia bibliografica
        inputs[6].setAttribute('placeholder', 'Ej. 224-226');
        inputs[4].setAttribute('name', 'editorial');
        inputs[5].setAttribute('name', 'lugar');
        inputs[6].setAttribute('name', 'paginas');
        labels[4].innerHTML = 'Editorial: ';
        labels[5].innerHTML = 'Lugar: ';
        labels[6].innerHTML = 'Páginas: ';
        inputs[5].setAttribute('onkeypress', 'validap();');
        inputs[6].setAttribute('onkeypress', 'validaNum();');
        inputs[7].value = 'biblio';
    } else if (ref.value == '2') {//Si es referencia web
        inputs[5].setAttribute('placeholder', 'Ej. febrero 12, 2019');
        inputs[4].setAttribute('name', 'sitioWeb');
        inputs[5].setAttribute('name', 'fechaConsulta');
        inputs[6].setAttribute('name', 'URL');
        labels[4].innerHTML = 'Sitio Web: ';
        labels[5].innerHTML = 'Fecha de consulta: ';
        labels[6].innerHTML = 'URL: ';
        inputs[5].type = 'text';
        inputs[6].type = 'URL';
        inputs[7].value = 'web';
    }

    //Añadiendo al div de referencias
    refer.appendChild(h7);
    refer.appendChild(br1);
    for (var i = 1; i <= 8; i++) {
        refer.appendChild(labels[i]);
        refer.appendChild(inputs[i]);
    }

    refer.appendChild(br);
    document.getElementById('referencias').appendChild(refer);
}
function agregaRef(submit) {//Añade por primera vez referencia creada en form 

    var autor = ' ', titulo = ' ', anio = ' ', tipo = ' ';
    var sitio = ' ', fecha = ' ', url = ' ';
    var editorial = ' ', lugar = ' ', pags = ' ';
    var otros = ' ';
    var inputX = ' ';
    var inps = [];
    var ref = document.createElement('p');
    var divX = 0;
    var icon = document.createElement('i');
    var btn = document.createElement('button');
    var inputR = document.createElement('input');
    var divRefs;
    

    //Revisa si hay referencias en el documento
    if (document.getElementsByClassName('refe').length !== 0) {
        divX = document.getElementsByClassName('refe').length;
    }

    var numRef = submit.id - 7;

    for (i = 0; i < 7; i++) {
        inputX = 'input' + (numRef);
        inps[i] = document.getElementById(inputX);
        numRef++;
    }

    autor = inps[0].value;
    titulo = inps[1].value;
    anio = inps[2].value;
    tipo = inps[6].value;

    if (tipo === 'biblio') {
        editorial = inps[3].value;
        lugar = inps[4].value;
        pags = inps[5].value;
        otros = '. (pp.' + pags + '). ' + lugar + ': ' + editorial + '. ';
    } else {
        if (tipo === 'web') {
            sitio = inps[3].value;
            fecha = inps[4].value;
            url = inps[5].value;
            otros = '. Fecha de consulta: ' + fecha + ' en Sitio web: ' + sitio + '. URL: ' + url;
        }
    }
    //Añade botón para editar 
    btn.setAttribute('onclick', 'editaRef(this);');
    btn.setAttribute('class', 'btnRef');
    btn.id = 'btnRef' + (numRef / 8);
    btn.type = 'button';
    icon.setAttribute('class', 'material-icons');
    icon.innerHTML = 'create';
    
    var aux;

    //Hacer input con type button y value editar
    aux = (numRef / 8) + '.- ' + autor + '. (' + anio + '). <i>' + titulo + '</i>' + otros;
    ref.innerHTML = (numRef / 8) + '.- ' + autor + '. (' + anio + '). <i>' + titulo + '</i>' + otros;
    
    ref.id = 'pRef' + (numRef / 8);
    ref.setAttribute('class', 'pRef');
    btn.appendChild(icon);
    ref.appendChild(btn);
    document.getElementById('referencias').appendChild(ref);

    //Quita el div de la referencia
    divRefs = document.getElementById('referencias');
    divRefs.removeChild(document.getElementById('refe' + (numRef / 8)));
    
    //Añade input escondido para mandar ref
    inputR.setAttribute('value',aux);
    inputR.setAttribute('name','vRef'+(numRef / 8));
    inputR.setAttribute('hidden','true');
    
    document.getElementById('referencias').appendChild(inputR);
    

}
function haceReferencia(autor, anio, titulo, numRef) {//Añade la referencia con el formato correspondiente al doc 

    var autor = ' ';
    var titulo = ' ';
    var anio = ' ';
    var otros = ' ';
    var ref = document.createElement('p');
    var icon = document.createElement('i');
    var btn = document.createElement('button');
    var inputR = document.createElement('input');


    //Añade botón para editar 
    btn.setAttribute('onclick', 'editaRef(this);');
    btn.setAttribute('class', 'btnRef');
    btn.id = 'btnRef' + (numRef / 8);
    btn.type = 'button';
    icon.setAttribute('class', 'material-icons');
    icon.innerHTML = 'create';

    //Hacer input con type button y value editar
    ref.innerHTML = (numRef / 8) + '.- ' + autor + '. (' + anio + '). <i>' + titulo + '</i>' + otros;
    ref.id = 'pRef' + (numRef / 8);
    ref.setAttribute('class', 'pRef');
    btn.appendChild(icon);
    ref.appendChild(btn);
    document.getElementById('referencias').appendChild(ref);
    
    //Añade input escondido para mandar ref
    inputR.value = ref.innerHTML;
    inputR.setAttribute('name','vRef'+(numRef / 8));
    //inputR.setAttribute('hidden','true');
    document.getElementById('referencias').appendChild(inputR);
    
}
function editaRef(btnRefEdita) {

    var nomRef = btnRefEdita.id;//Nombre del botón de la referencia
    var numRef = 0;//Número del botón de la referencia
    var inputRef = document.createElement('input');//Input donde se podra editar la referencia
    var pRef = null;//Elemento p de donde saca los valores de la referencia 
    var puntos = 0;//Cuenta los puntos en la referencia
    var contenido = '';
    var autor = ' ';
    var titulo = ' ';
    var anio = ' ';
    var otros = ' ';

    //Para obtener el número de referencia
    for (i = 0; i < nomRef.length; i++) {
        if (nomRef.charAt(i) !== 'btnRef') {
            numRef = nomRef.charAt(i);
        }
    }

    pRef = document.getElementById('pRef' + numRef);

    inputRef.id = 'inputRef' + numRef;
    pRef.innerHTML = '';

    //Para obtener los componentes de la ref
    for (i = 0; i < pRef.innerHTML.length; i++) {
        if (pRef.innerHTML.charAt(i) === '.') {
            if (puntos === 1) {
                autor = contenido;
            } else {
                if (puntos === 2) {
                    anio = contenido;
                } else {
                    if (puntos === 3) {
                        titulo = contenido;
                    } else {
                        if (puntos >= 4) {
                            otros = contenido;
                        }
                    }
                }
            }
            puntos++;
            contenido = '';
            i++;
        } else {
            contenido = contenido + pRef.innerHTML.charAt(i);
        }
    }
    inputRef.value = (numRef) + '.- ' + autor + '. (' + anio + '). <i>' + titulo + '</i>' + otros;
    pRef.appendChild(inputRef);
}

//Validaciones
function validaAnio(num) {
    if (num.length > 4) {
        event.returnValue = false;
    }
}
function validaNum() {
    var x = event.keyCode;
    var tel = '0123456789-';
    var numero = String.fromCharCode(x);

    if (tel.indexOf(numero) === -1) {
        event.returnValue = false;
    }
}
function validap() {
    var x = event.keyCode;
    var varras = 'qwertyuiopasdfghjklñmnbvcxz ,. QWERTYUIOPÑLKJHGFDSAZXCVBNMáéíóú';
    var varra = String.fromCharCode(x);

    if (varras.indexOf(varra) === -1) {
        event.returnValue = false;
    }
}
function vNumyLetras() {
    var x = event.keyCode;
    var varras = 'qwertyuiopasdfghjklñmnbvcxz QWERTYUIOPÑLKJHGFDSAZXCVBNMáéíóú1234567890!?#$%&';
    var varra = String.fromCharCode(x);

    if (varras.indexOf(varra) === -1) {
        event.returnValue = false;
    }
}
function valCorreo() {
    var x = event.keyCode;
    var varras = 'qwertyuiopasdfghjklnmnbvcxzQWERTYUIOPNLKJHGFDSAZXCVBNM-_1234567890@.';
    var varra = String.fromCharCode(x);

    if (varras.indexOf(varra) === -1) {
        event.returnValue = false;
    }
}
function confirmaCorreo(input) {
    console.log(input.value);
    if (document.getElementById('password').value !== input.value) {
        document.getElementById('helper1').setAttribute('class', 'incorrecto');
        document.getElementById('helper1').innerHTML = 'Las contraseñas no coinciden';
        //alert('Las contraseñas no coinciden');
        return false;
    } else {
        console.log(document.getElementById('helper1').getAttribute('class'));
        if (document.getElementById('helper1').getAttribute('class') === 'incorrecto') {
            document.getElementById('helper1').setAttribute('class', 'correcto');
            document.getElementById('helper1').innerHTML = 'Correcto';
        }
        return true;
    }
}
function validaRegistro(formulario) {

    if (formulario.email.value.length === 0) {
        document.getElementById('email').class = 'validate invalid';
        formulario.email.focus();
        return false;
    } else {
        if (formulario.password.value.length === 0) {


            formulario.password.focus();
            return false;
        } else {
            if (formulario.password1.value.length === 0) {

                event.preventDefault();
                formulario.password1.focus();
                return false;
            }
        }
    }
    if (formulario.password.value !== formulario.password1.value) {

        alert('Las contraseñeas no coinciden');
        return false;
    } else {
        return true;
    }

    //Valida que no inserten caracteres especiales
    var nom = formulario.email.value;
    var cadena = 'qwertyuiopasdfghjklmnbvcxzQWERTYUIOPLKJHGFDSAZXCVBNM!#$%&?¿-_@1234567890';
    var nomValid = true;

    for (k = 0; k < 3; k++) {
        if (k === 1) {
            nom = formulario.password.value;
        } else {
            nom = formulario.password1.value;
        }
        for (i = 0; i < nom.length; i++) {
            for (j = 0; j < cadena.length; j++) {
                if (nom.charAt(i) === cadena.charAt(j)) {
                    break;
                }
            }
            if (j === cadena.length) {
                nomValid = false;
                confirm('Caracteres inválidos');
                return false;
            }
        }
    }

}
function validaInicio(formulario) {
    if (formulario.username.value.length === 0) {
        formulario.username.focus();
        return false;
    } else {
        if (formulario.password.value.length === 0) {
            formulario.password.focus();
            return false;
        }
    }
    //Valida que no inserten caracteres especiales
    var nom = formulario.usuario.value;
    var cadena = 'qwertyuiopasdfghjklmnbvcxzQWERTYUIOPLKJHGFDSAZXCVBNM!#$%&?¿-_@1234567890';
    var nomValid = true;

    for (k = 0; k < 2; k++) {
        if (k === 1) {
            nom = formulario.password.value;
        }
        for (i = 0; i < nom.length; i++) {
            for (j = 0; j < cadena.length; j++) {
                if (nom.charAt(i) === cadena.charAt(j)) {
                    break;
                }
            }
            if (j === cadena.length) {
                nomValid = false;
                confirm('Caracteres inválidos');
                return false;
            }
        }
    }
}




