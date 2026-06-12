#data processing functions


#calculate BMI based on standard formula
calculate_bmi <- function(weight, height) {

  message("calculating BMI")
  if (any(weight <= 30)) {
    warning("Weight value(s) less than 30 kg detected. Please check input")
  }
  if (any(weight >= 150)) {
    warning("Weight value(s) greater than 200 kg detected. Please check input.")
  }
  weight / height^2
}

#convert yes/no binary columns to numeric values for modelling
convert_binary_columns <- function(df, cols) {
  message("converting binary columns to numeric..")
  df[cols] <- lapply(
    df[cols],
    function(x) as.numeric(x == "yes")
  )
  message("conversion of binary columns complete")
  df
}

#convert ordinal columns to numeric values for modelling
convert_ordinal_columns <- function(df,
                                    cols,
                                    levels = c("no", "Sometimes", "Frequently", "Always")) {
  message("converting ordinal columns to numeric..")
  df[cols] <- lapply(
    df[cols],
    function(x) as.numeric(factor(x, levels = levels)) - 1
  )
  message("conversion of ordinal columns complete")
  df
}

# analysis functions

# function to assign class weights to handle class imbalance
generate_class_weights <- function(labels) {
  message("calculating class weights to handle class imbalance..")
  n_classes <- length(unique(labels))
  freq <- table(labels)
  class_weight <- length(labels) / ((n_classes) * as.numeric(freq))
  names(class_weight) <- names(freq)
  message("class weights calculated :)")
  class_weight
}
