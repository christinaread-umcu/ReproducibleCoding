#initialise the renv and installs necessary packages
install.packages("renv")
renv::init()
renv::install()

#run this to new packages are added to the lockfile
#renv::snapshot()
