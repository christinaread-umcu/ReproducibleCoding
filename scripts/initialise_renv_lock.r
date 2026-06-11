#this script intialises the renv, then installs necessary packages

install.packages("renv")
renv::init()
renv::install()

