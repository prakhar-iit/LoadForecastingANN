import datetime
import pandas
import numpy as np
import matplotlib.pyplot as plt
from pandas.tools.plotting import autocorrelation_plot
from pandas.tools.plotting import lag_plot
from scipy import signal

'''
Module for time series visualization
'''
# Plots two time series on the same timeScale from a common date on the same plot
def comparisonPlot(year,month,day,seriesList,nameList,plotName="Comparison of Values over Time", yAxisName="Predicted"):
	date = datetime.date(year,month,day)
	dateList = []
	for x in range(len(seriesList[0])):
		dateList.append(date+datetime.timedelta(days=x))
	colors = ["b","g","r","c","m","y","k","w"]
	currColor = 0
	legendVars = []
	for i in range(len(seriesList)):
		x, = plt.plot_date(x=dateList,y=seriesList[i],color=colors[currColor],linestyle="-",marker=".")
		legendVars.append(x)
		currColor += 1
		if (currColor >= len(colors)):
			currColor = 0
	plt.legend(legendVars, nameList)
	plt.title(plotName)
	plt.ylabel(yAxisName)
	plt.xlabel("Date")
	plt.show()
