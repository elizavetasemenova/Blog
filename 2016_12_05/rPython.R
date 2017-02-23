library(rPython)

## Show Python version
system("python --version")

## Set directory
setwd("E:/rPython")

## Define and call Python functions directly
python.exec( "def squared(a): return a**2" )
python.call( "squared", 3)

## Inline Python code
py1line.py <- "a = 2;b = 3;c = a + b"
python.exec(py1line.py)
c <- python.get("c")
print(paste('R print: ', c, sep=''))

## Same code saved in a separate *.py file.
## Compute in Python, get the result into R.
python.load("py1.py")
c <- python.get("c")
print(paste('R print: ', c, sep=''))

## Execute the entire Python code from an external file.
system('python py2.py')
