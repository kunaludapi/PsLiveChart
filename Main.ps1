#========================================================================
# Author 	: Kevin RAHETILAHY                                          #
#========================================================================

##############################################################
#                      LOAD ASSEMBLY                         #
##############################################################

[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 	| out-null
[System.Reflection.Assembly]::LoadWithPartialName('PresentationCore')      	| out-null
[System.Reflection.Assembly]::LoadFrom('assembly\LiveCharts.dll')       	
[System.Reflection.Assembly]::LoadFrom('assembly\LiveCharts.Wpf.dll') 		


##############################################################
#                      LOAD FUNCTION                         #
##############################################################
                      
function LoadXml ($Global:filename)
{
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}

# Load MainWindow
$XamlMainWindow=LoadXml(".\Main.xaml")
$Reader=(New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form=[Windows.Markup.XamlReader]::Load($Reader)


##############################################################
#                CONTROL INITIALIZATION                      #
##############################################################

$pieChart = $Form.FindName("pieChart")
$lineChart = $Form.FindName("lineChart")
$GeoMap = $Form.FindName("GeoMap")
$Doughnut = $Form.FindName("Doughnut")

##############################################################
#                PIE CHART                                   #
##############################################################


##############################################################
#                BASIC LINE CHART                            #
##############################################################


$seriesCollection = [LiveCharts.SeriesCollection]::new()

# == Serie 1 ===
$lineserie1 = [LiveCharts.Wpf.LineSeries]::new()
    $lineserie1.Title = "serie 1"
    $chartValues = [LiveCharts.ChartValues[double]]::new( )
    $chartValues.Add(7)
    $chartValues.Add(5)
    $chartValues.Add(6)
    $chartValues.Add(3)
    $lineserie1.Values  = $chartValues

# == Serie 2 ===

$lineserie2 = [LiveCharts.Wpf.LineSeries]::new()
    $lineserie2.Title = "serie 2"
    $chartValues = [LiveCharts.ChartValues[double]]::new( )
    $chartValues.Add(3)
    $chartValues.Add(6)
    $chartValues.Add(5)
    $chartValues.Add(9)
    $lineserie2.Values  = $chartValues


# == Serie 3 ===
$lineserie3 = [LiveCharts.Wpf.LineSeries]::new()
    $lineserie3.Title = "serie 3"
    $chartValues = [LiveCharts.ChartValues[double]]::new( )
    $chartValues.Add(7)
    $chartValues.Add(2)
    $chartValues.Add(6)
    $chartValues.Add(5)
    $lineserie3.Values  = $chartValues


$seriesCollection.Add($lineserie1)
$seriesCollection.Add($lineserie2)
$seriesCollection.Add($lineserie3)

 $lineChart.Series = $seriesCollection




##############################################################
#                GEOMAP                               #
##############################################################
$GeoMap.EnableZoomingAndPanning = $False




##############################################################
#                Doughnut                                    #
##############################################################


$DoughnutCollection = [LiveCharts.SeriesCollection]::new()

$chartvalue1 = [LiveCharts.ChartValues[LiveCharts.Defaults.ObservableValue]]::new()
$pieSeries = [LiveCharts.Wpf.PieSeries]::new()
$chartvalue1.Add([LiveCharts.Defaults.ObservableValue]::new(8))
$pieSeries.Values = $chartvalue1
$pieSeries.Title = "Chrome"
$pieSeries.DataLabels = $true

$DoughnutCollection.Add($pieSeries)


$chartvalue2 = [LiveCharts.ChartValues[LiveCharts.Defaults.ObservableValue]]::new()
$pieSeries = [LiveCharts.Wpf.PieSeries]::new()
$chartvalue2.Add([LiveCharts.Defaults.ObservableValue]::new(6))
$pieSeries.Values = $chartvalue2
$pieSeries.Title = "Mozilla"
$pieSeries.DataLabels = $true

$DoughnutCollection.Add($pieSeries)


$chartvalue3 = [LiveCharts.ChartValues[LiveCharts.Defaults.ObservableValue]]::new()
$pieSeries = [LiveCharts.Wpf.PieSeries]::new()
$chartvalue3.Add([LiveCharts.Defaults.ObservableValue]::new(10))
$pieSeries.Values = $chartvalue3
$pieSeries.Title = "Opera"
$pieSeries.DataLabels = $true


$DoughnutCollection.Add($pieSeries)

$chartvalue4 = [LiveCharts.ChartValues[LiveCharts.Defaults.ObservableValue]]::new()
$pieSeries = [LiveCharts.Wpf.PieSeries]::new()
$chartvalue4.Add([LiveCharts.Defaults.ObservableValue]::new(4))
$pieSeries.Values = $chartvalue4
$pieSeries.Title = "Explorer"
$pieSeries.DataLabels = $true


$DoughnutCollection.Add($pieSeries)
$Doughnut.Series = $DoughnutCollection

##############################################################
#                SHOW WINDOW                                 #
##############################################################

$Form.ShowDialog() | Out-Null

