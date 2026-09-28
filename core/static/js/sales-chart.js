let timeFilter = "week";
let salesChart;

let data_by_week;
let data_by_month;
let data_by_year;


const createChartData = (dateBy) => {
    const resultObj = {};
    dateBy.forEach((obj) => {
        if(!resultObj[obj.date]){
            resultObj[obj.date] = obj.value
        }else{
            resultObj[obj.date] += obj.value
        }
    });
    const result = Object.keys(resultObj).map((key) => ({
        x: key,
        y: resultObj[key]
    }));
    return result.sort((a, b) => new Date(a.x) - new Date(b.x));
}

let salesChartData = createChartData(JSON.parse($("#salesChartData").text()).data_by_week);


const changeTimeFilter = (e) => {
    timeFilter = e.target.value;
    switch (timeFilter) {
        case "month":
            data_by_month = JSON.parse($("#salesChartData").text()).data_by_month;
            salesChartData = createChartData(data_by_month);
            break;
        case "year":
            data_by_year = JSON.parse($("#salesChartData").text()).data_by_year;
            salesChartData = createChartData(data_by_year);
            break;
        default:
            data_by_week = JSON.parse($("#salesChartData").text()).data_by_week;
            salesChartData = createChartData(data_by_week);
            break;
    }
    salesChart.destroy();
    initializeSalesChart();
}


const initializeSalesChart = () => {
    salesChart = new Chart($("#salesChart"), {
        type: "bar",
        data: {
            datasets: [
                {
                    label: "Sales revenue",
                    data: salesChartData,
                    backgroundColor: "rgba(255, 99, 132, 0.2)",
                    borderColor: "rgba(255, 99, 132, 1)",
                    borderWidth: 2,
                    pointRadius: 0,
                    fill: false,
                },
            ],
        },
        options: {
            plugins: {
                legend: {
                    labels: {
                        usePointStyle: true,
                    },
                },
            },
            scales: {
                y: {
                    beginAtZero: true,
                }
            }
        }
    })
}

initializeSalesChart();