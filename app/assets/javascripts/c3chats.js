var chart = c3.generate({
  bindto: '#chart',
  data: {
    columns: [
      ['故障件数', 30, 200, 100, 400, 150, 250],
      ['コメント数', 50, 20, 10, 40, 15, 25]
    ]
  }
});