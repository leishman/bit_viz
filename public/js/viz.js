
var height = 420,
    barWidth = 20;

var y = d3.scale.linear()
    .range([0, height]);

var chart = d3.select(".chart")
    .attr("height", height);

d3.json('/data', function(error, data){
  y.domain([0, d3.max(data, function(d) { return d.value }) * 2]);
  console.log(data);
  chart.attr("width", barWidth * data.length);

  var bar = chart.selectAll("g")
      .data(data)
    .enter().append("g")
      .attr("transform", function(d, i){
        // console.log(Math.floor(height - y(d.value)));
        console.log(d.value)
        var ty = function(value){
          if( value < 0){
            return (height / 2);
          }
          return height / 2 - value;
        };
        return "translate(" + i * barWidth + "," + ty(y(d.value)) + ")";
      });

  bar.append("rect")
    .attr("height", function(d) { return Math.abs(y(d.value)) })
    .attr("width", barWidth - 1)
    .style("fill", function(d){ return d.value > 0 ? "green" : "red"});

    bar.append("text")
      .attr("y", function(d) {return y(d.value); })
      .attr("x", barWidth / 2 - 10)
      .attr("dy", "0.15em")
      .text(function(d) {return d.value / 100000000;})
  });
