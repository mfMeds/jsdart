
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';



import 'dart:js';
import "package:js/js.dart";
import 'package:chartjs/chartjs.dart';

@Component(
  selector: 'zgraph',
  styleUrls: const ['zgraph.css'],
  templateUrl: 'zgraph.html',
  directives: const [coreDirectives, materialDirectives],
  providers: const [
    materialProviders,
  ],
)


class Zgraph implements AfterViewInit {

  @ViewChild('mycanvas')
  Element mycanvas;

  Zgraph() {


  }


  @override
  ngAfterViewInit() {

    List<String> myDays = new List();
    List<double> myData = new List();

    myDays.add('Monday');
    myData.add(12.0);

    var data = new LinearChartData(labels: myDays, datasets: <ChartDataSets>[
      new ChartDataSets(
          label: 'My Label',
          steppedLine: true,
          data: myData),
    ]);


    var aOptions = new ChartAnimationOptions();




    var config = new ChartConfiguration(
        type: 'bar', data: data, options: new ChartOptions(responsive: true,maintainAspectRatio: false,
        legend: new ChartLegendOptions(display: false),
        //scales: new ChartScales(yAxes: [new ChartYAxe(ticks: new TickOptions(max:20))]),
        animation: aOptions,
        tooltips: new ChartTooltipOptions(
          enabled: false,
          custom: allowInterop(customTooltip),

        )
    ));



    new Chart(mycanvas, config);

  }

  void customTooltip(dynamic a) {



    window.console.log(a);
    if (a.opacity == 0) {
      //tooltipEl.style.opacity = '0';
      return;
    }


  }

}
