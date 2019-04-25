
var ctx = document.getElementById('myChart').getContext('2d');
var total = document.getElementById('total').value;
var res = document.getElementById('res').value;
var ens = document.getElementById('ens').value;
var lie = document.getElementById('lie').value;
var lir = document.getElementById('lir').value;
var nar = document.getElementById('nar').value;
Chart.defaults.global.defaultFontColor = 'white';

var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'bar',

    // The data for our dataset
    data: {
        labels: ['Total', 'Lienzo', 'Ensayo', 'Resumen', 'Narrativo', 'Lírico'],
        datasets: [{
            label: 'Obras realizadas',
            backgroundColor: 'rgb(100,181,246)',
            borderColor: 'rgb(155,231,255)',
            data: [total, lie, ens, res, nar, lir],
            fontColor : '#fff'
        }]
    },

    // Configuration options go here
    options: {}
});


