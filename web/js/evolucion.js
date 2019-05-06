
var ctx = document.getElementById('myChart').getContext('2d');
var ctx1 = document.getElementById('myChart1').getContext('2d');
var total = document.getElementById('total').value;
var res = document.getElementById('res').value;
var ens = document.getElementById('ens').value;
var lie = document.getElementById('lie').value;
var lir = document.getElementById('lir').value;
var nar = document.getElementById('nar').value;
var orto = document.getElementById('orto').value;
var estr = document.getElementById('estr').value;
var clar = document.getElementById('clar').value;
var rima = document.getElementById('rima').value;
var metr = document.getElementById('metr').value;
var tram = document.getElementById('tram').value;
var otro = document.getElementById('otro').value;
Chart.defaults.global.defaultFontColor = 'white';

var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'bar',

    // The data for our dataset
    data: {
        labels: ['Total', 'Lienzo', 'Ensayo', 'Resumen', 'Narrativo', 'Lírico'],
        datasets: [{
            label: 'Obras realizadas',
            backgroundColor: ['rgb(34,134,195)','rgb(100,181,246)','rgb(34,134,195)','rgb(100,181,246)',
            'rgb(0,75,160)','rgb(34,134,195)'],
            borderColor: ['rgb(34,134,195)','rgb(100,181,246)','rgb(34,134,195)','rgb(100,181,246)',
            'rgb(0,75,160)','rgb(34,134,195)'],
            data: [total, lie, ens, res, nar, lir],
            fontColor : '#fff'
        }]
    },

    // Configuration options go here
    options: {}
});

var myDoughnutChart = new Chart(ctx1, {
    type: 'doughnut',
    data: {
        labels: ['Ortografía y gramática', 'Claridad', 'Estructura', 'Rima', 'Métrica', 'Trama', 'Otros'],
        datasets: [{
            label: 'Consejos',
            backgroundColor: ['rgb(0,75,160)','rgb(0,92,178)','rgb(25,118,210)','rgb(30,136,229)','rgb(99,164,255)',
            'rgb(106,183,255)','rgb(128,214,255)'],
            borderColor:  ['rgb(0,75,160)','rgb(0,92,178)','rgb(25,118,210)','rgb(30,136,229)','rgb(99,164,255)',
            'rgb(106,183,255)','rgb(128,214,255)'],
            data: [orto, clar, estr, rima, metr, tram,otro],
            fontColor : '#fff'
        }]
    },
    options: {}
});


