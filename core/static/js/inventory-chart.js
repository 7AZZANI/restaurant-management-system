let inventoryChartLabel = JSON.parse($("#inventoryChartData").text()).map(
  (item) => item.name
);
let inventoryChartData = JSON.parse($("#inventoryChartData").text()).map(
  (item) => item.quantity
);
const backgroundColor = [
  "#ffcfa9",
  "#009def",
  "#886f31",
  "#007883",
  "#8ec599",
  "#ffa622",
  "#00b0f7",
  "#00d210",
  "#4200a6",
  "#95ff7b",
  "#ff14af",
  "#007500",
  "#e20087",
  "#7b9b00",
  "#00449f",
  "#00adff",
  "#900000",
  "#8cffff",
  "#8e002f",
  "#00925a",
  "#b761ac",
  "#002702",
  "#fcbdff",
  "#003b43",
  "#73717d",
];

let inventoryChart;

const initializeInventoryChart = () => {
  inventoryChart = new Chart($("#inventoryChart"), {
    type: "doughnut",
    data: {
      labels: inventoryChartLabel,
      datasets: [
        {
          label: "Inventory",
          data: inventoryChartData,
          backgroundColor,
        },
      ],
    },
    options: {
      plugins: {
        legend: {
          position: "right",
          align: "middle",
          labels: {
            usePointStyle: true,
          },
        },
        tooltip: {
          callbacks: {
            label: function (context) {
              return context.parsed + " Kg";
            },
          },
        },
      },
      cutout: "80%",
    },
  });
};

initializeInventoryChart();
