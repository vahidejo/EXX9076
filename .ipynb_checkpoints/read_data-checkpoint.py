# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

"""
Create a function that takes as input the path to a single .csv file in the specdata folder and creates
a data table from its contents. The data types in the output table have to match the data
(date is understood as a date).
"""

import pandas as pd

"""
path_to = 'specdata/001.csv'
data_i = pd.read_csv(path_to, parse_dates = [0])
"""

def data_read_i (path_to):
    return pd.read_csv(path_to, parse_dates = [0])

"""
Task02
Write a for loop that loops through all the file paths in the specdata folder and uses the function
written in previous point to read the data from the .csv files. Create a table with columns that show:
a) ID nr b) the nr of rows in each of the read in tables c) The number of rows where atleast sulfate or
nitrate data is not missing.
"""
from os import listdir, sep

files_list = listdir('specdata')

ID_vec = []
No_data_row_vec = []
No_rows_not_NA_vec = []

for file_i in files_list:
    path_i = 'specdata' + sep + file_i
    data_i = data_read_i (path_i)
    ID = data_i.ID[0]
    No_data_row = len(data_i.ID)
    data_not_NA = data_i.dropna(how = 'all', subset = ['sulfate','nitrate'])
    No_rows_not_NA = len(data_not_NA)
    
    ID_vec.append(ID)
    No_data_row_vec.append(No_data_row)
    No_rows_not_NA_vec.append(No_rows_not_NA)
    
out_tab = pd.DataFrame({'ID' : ID_vec,
                        'No_data_row' : No_data_row_vec,
                        'No_rows_not_NA' : No_rows_not_NA_vec})