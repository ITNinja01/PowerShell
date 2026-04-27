'''
PS_Passing_Python.py
Script to display string
passed to script PowerShell
'''
# importing standard module sys
import sys

print("Welcome to Python\n")
print("Data passed from PowerShell script:\n")

for eachLine in sys.stdin:
    print(eachLine) 
    