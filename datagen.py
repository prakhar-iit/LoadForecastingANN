import xlrd
import math
import statistics
import numpy as np

'''
Functions for retrieving Elia dataset 
& forming training/testing datasets
'''

# constructs dataset for simulations
def constructData():
  files = ["data/elia/e2009.xls","data/elia/e2010.xls",
  "data/elia/e2011.xls","data/elia/e2012.xls","data/elia/e2013.xls","data/elia/e2014.xls"]
  
  xData = []
  
  for fileName in files:
    book = xlrd.open_workbook(fileName)
    sheet = book.sheet_by_index(0)
    for rx in range(2,sheet.nrows):
      row = sheet.row(rx)[3:]
      	
      row = [row[x].value for x in range(0,len(row)-4)]
      xData.append(row)
  
  series = xData; 
  xData = []
  yData = []

  for x in range(len(series)-1):
    xData.append(series[x])
    yData.append(np.mean(series[x+1]))	
	
  return xData, yData
