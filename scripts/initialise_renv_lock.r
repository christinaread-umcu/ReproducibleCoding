#this script intialises the renv, then installs necessary packages
install.packages("renv")
renv::init()
renv::install()

#to new packages are added to the lockfile
#renv::snapshot()
