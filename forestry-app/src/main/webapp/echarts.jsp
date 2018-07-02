<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="resource/scripts/echarts.common.min.js" type="text/javascript"></script>
<title></title>
</head>
<body>

<div id="main" style="width: 400px;height:300px;float: left;"></div>
<div id="main2" style="width: 400px;height:300px;float: left;"></div>
<div id="main3" style="width: 400px;height:300px;float: left;"></div>
<div id="main4" style="width: 400px;height:300px;float: left;"></div>
<script>
        // 绘制图表。
        echarts.init(document.getElementById('main2')).setOption({
            series: {
                type: 'pie',
                data: [
                    {name: '苗木花卉', value: 1212},
                    {name: '木制品', value: 3323},
                    {name: '木工艺品', value: 1919},
                    {name: '竹藤制品', value: 231},
                    {name: '艺术品', value: 832}
                ],
                itemStyle: {
                    normal: {
                        color: function(params) {
                            // build a color map as your need.
                            var colorList = [
                              '#206880','#df977f','#90d7ec','#E87C25','#27727B'
                            ];
                            return colorList[params.dataIndex]
                        }
                    }
                }

            }
        });
    // 基于准备好的dom，初始化echarts实例
    var myChart2 = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '采伐情况'
        },
        tooltip: {},
        legend: {
            data:['数量']
        },
        xAxis: {
            data: ["1月","2月","3月","4月","5月","6月"]
        },
        yAxis: {},
        series: [{
            name: '数量',
            type: 'bar',
            itemStyle:{
                normal:{
                    color:'#206880'
                }
            },
            data: [50, 200, 360, 100, 100, 200]
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart2.setOption(option);
    
    function randomData() {
        now = new Date(+now + oneDay);
        value = value + Math.random() * 21 - 10;
        return {
            name: now.toString(),
            value: [
                [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'),
                Math.round(value)
            ]
        }
    }

    var myChart3 = echarts.init(document.getElementById('main3'));
    

    var option3 = {
    			    xAxis: {
    			        type: 'category',
    			        boundaryGap: false,
    			        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    			    },
    			    yAxis: {
    			        type: 'value'
    			    },
    			    series: [{
    			        data: [820, 932, 901, 934, 1290, 1330, 1320],
    			        type: 'line',
    			        areaStyle: {}
    			    }]
    			};
    myChart3.setOption(option3);
    
    
    
    var myChart4 = echarts.init(document.getElementById('main4'));
    
    function randomData() {
        now = new Date(+now + oneDay);
        value = value + Math.random() * 21 - 10;
        return {
            name: now.toString(),
            value: [
                [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'),
                Math.round(value)
            ]
        }
    }

    
    
    var data = [];
    var now = +new Date(2000, 5, 3);
    var oneDay = 24 * 3600 * 1000;
    var value = Math.random() * 1000;
    for (var i = 0; i < 1000; i++) {
        data.push(randomData());
    }

    var option4 = {
        title: {
            text: '动态数据时间轴'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                params = params[0];
                var date = new Date(params.name);
                return date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1];
            },
            axisPointer: {
                animation: false
            }
        },
        xAxis: {
            type: 'time',
            splitLine: {
                show: false
            }
        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%'],
            splitLine: {
                show: false
            }
        },
        series: [{
            name: '模拟数据',
            type: 'line',
            showSymbol: false,
            hoverAnimation: false,
            data: data
        }]
    };

    setInterval(function () {

        for (var i = 0; i < 5; i++) {
            data.shift();
            data.push(randomData());
        }

        myChart4.setOption({
            series: [{
                data: data
            }]
        });
    }, 1000);
    myChart4.setOption(option4);
</script>
</body>

</html>
