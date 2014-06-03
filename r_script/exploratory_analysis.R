# ==== TRAIN ==== #

# Reading training data
train <- read.csv('data/train.csv',
                  stringsAsFactors=TRUE,
                  colClasses=c('character', 'character', 'character', 'character','character', 
                               'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 
                               'numeric', 'numeric'
                               )
                  )

# Transfer variable types
train$datetime   <- strftime(train$datetime, '%Y-%m-%d %H:%M:%S')
train$season     <- as.factor(train$season)
train$holiday    <- as.factor(train$holiday)
train$workingday <- as.factor(train$workingday)
train$weather    <- as.factor(train$weather)

summary(train)

# One-hot encoding
train$is.spring <- as.factor(ifelse(train$season==1, 1, 0))
train$is.summer <- as.factor(ifelse(train$season==2, 1, 0))
train$is.autumn <- as.factor(ifelse(train$season==3, 1, 0))
train$is.winter <- as.factor(ifelse(train$season==4, 1, 0))

train$is.clear         <- as.factor(ifelse(train$weather==1, 1, 0))
train$is.cloudy        <- as.factor(ifelse(train$weather==2, 1, 0))
train$is.little.rain   <- as.factor(ifelse(train$weather==3, 1, 0))
train$is.heavy.rain    <- as.factor(ifelse(train$weather==4, 1, 0))

# Remove columns
train$season  <- NULL
train$weather <- NULL

View(train)
summary(train)

# ==== TEST ==== #

# Read test data
test <- read.csv('data/test.csv',
                  stringsAsFactors=TRUE,
                  colClasses=c('character', 'character', 'character', 'character','character', 
                               'numeric', 'numeric', 'numeric', 'numeric'
                               )
                 )

# Transfer variable types
test$datetime   <- strftime(test$datetime, '%Y-%m-%d %H:%M:%S')
test$season     <- as.factor(test$season)
test$holiday    <- as.factor(test$holiday)
test$workingday <- as.factor(test$workingday)
test$weather    <- as.factor(test$weather)

# One-hot encoding
test$is.spring <- as.factor(ifelse(test$season==1, 1, 0))
test$is.summer <- as.factor(ifelse(test$season==2, 1, 0))
test$is.autumn <- as.factor(ifelse(test$season==3, 1, 0))
test$is.winter <- as.factor(ifelse(test$season==4, 1, 0))

test$is.clear         <- as.factor(ifelse(test$weather==1, 1, 0))
test$is.cloudy        <- as.factor(ifelse(test$weather==2, 1, 0))
test$is.little.rain   <- as.factor(ifelse(test$weather==3, 1, 0))
test$is.heavy.rain    <- as.factor(ifelse(test$weather==4, 1, 0))

# Remove columns
test$season  <- NULL
test$weather <- NULL