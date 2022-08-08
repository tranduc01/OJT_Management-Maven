
// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["SE", "AI", "BA","EL","MC","GD","HM","IB","IA","JL"],
    datasets: [{
      data: [25,5,9,5,15,20,5,6,7,3],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc','#EE5007','#816797','#E4DCCF','#7D9D9C','#FFBD69','#EE81B3','#3C2C3E'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
