 #Load dplyr package via library() function 
>library(dplyr) 

#Read in the MechaCar Data 
> mechaCar_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) 

#Examine data 
> head(mechaCar_table)  
  vehicle_length vehicle_weight spoiler_angle ground_clearance AWD      mpg
1       14.69710       6407.946      48.78998         14.64098   1 49.04918
2       12.53421       5182.081      90.00000         14.36668   1 36.76606
3       20.00000       8337.981      78.63232         12.25371   0 80.00000
4       13.42849       9419.671      55.93903         12.98936   1 18.94149
5       15.44998       3772.667      26.12816         15.10396   1 63.82457
6       14.45357       7286.595      30.58568         13.10695   0 48.54268

#Linear Regression on MechaCar Data (mpg ~ five other columns)
>lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechaCar_table) 

Call:
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    ground_clearance + AWD, data = mechaCar_table)

Coefficients:
     (Intercept)    vehicle_length    vehicle_weight     spoiler_angle  ground_clearance  
      -1.040e+02         6.267e+00         1.245e-03         6.877e-02         3.546e+00  
             AWD  
      -3.411e+00  

#Summary function to find p-value and multiple r-squared 
> summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechaCar_table)) 

Call:
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    ground_clearance + AWD, data = mechaCar_table)

Residuals:
     Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

#Scatterplots:
> plt <- ggplot(mechaCar_table,aes(x=mpg,y=vehicle_length)) #import dataset into ggplot2 mpg by vehicle_length 
> plt + geom_point(size=2) + labs(x="Fuel Efficieny (MPG)",y="Vehicle Length") #add scatter plot

>plt <- ggplot(mechaCar_table,aes(x=mpg,y=vehicle_weight)) #import dataset into ggplot2 mpg by vehicle_weight 
> plt + geom_point(size=2) + labs(x="Fuel Efficieny (MPG)",y="Vehicle Weight") #add scatter plot

>plt <- ggplot(mechaCar_table,aes(x=mpg,y=spoiler_angle)) #import dataset into ggplot2 mgp by spoiler_angle 
> plt + geom_point(size=2) + labs(x="Fuel Efficieny (MPG)",y="Spoiler Angle") #add scatter plot

> plt <- ggplot(mechaCar_table,aes(x=mpg,y=ground_clearance)) #import dataset into ggplot2 mpg by ground_clearance 
> plt + geom_point(size=2) + labs(x="Fuel Efficieny (MPG)",y="Ground Clearance") #add scatter plot

> plt <- ggplot(mechaCar_table,aes(x=mpg,y=AWD)) #import dataset into ggplot2 mpg by AWD 
> plt + geom_point(size=2) + labs(x="Fuel Efficieny (MPG)",y="All Wheel Drive") #add scatter plot


#The input data is numerical and continuous.
#The input data should follow a linear pattern.
#There is variability in the independent x variable. This means that there must be more than one observation in the x-axis and they must be different values.
#The residual error (the distance from each data point to the line) should be normally distributed.

#In addition, the p-value of our linear regression analysis is 5.35 x 10-11, which is much smaller than our assumed significance level(alpha) 
#of 0.05%. Therefore, we can state that there is sufficient evidence to reject our null hypothesis, which means that the slope of our 
#linear model is not zero.
 
#For comparision summarize linear model mpg/vehicle_weight 
> summary(lm(mpg~vehicle_weight,mechaCar_table))

Call:
lm(formula = mpg ~ vehicle_weight, data = mechaCar_table)

Residuals:
    Min      1Q  Median      3Q     Max 
-35.816 -11.252  -2.121   8.573  33.201 

Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
(Intercept)    4.042e+01  7.784e+00   5.193 4.17e-06 ***
vehicle_weight 7.649e-04  1.213e-03   0.631    0.531    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 15.67 on 48 degrees of freedom
Multiple R-squared:  0.008223,	Adjusted R-squared:  -0.01244 
F-statistic: 0.398 on 1 and 48 DF,  p-value: 0.5311



#For comparision summarize linear model mpg/vehicle_length
>summary(lm(formula = mpg ~ vehicle_length, data = mechaCar_table)) 

Call:
lm(formula = mpg ~ vehicle_length, data = mechaCar_table)

Residuals:
    Min      1Q  Median      3Q     Max 
-26.303  -7.160  -1.231   9.374  26.670 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)    -25.0622    13.2960  -1.885   0.0655 .  
vehicle_length   4.6733     0.8774   5.326 2.63e-06 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 12.47 on 48 degrees of freedom
Multiple R-squared:  0.3715,	Adjusted R-squared:  0.3584 
F-statistic: 28.37 on 1 and 48 DF,  p-value: 2.632e-06

#For comparision summarize linear model mpg/ground_clearance 
> summary(lm(formula = mpg ~ ground_clearance, data = mechaCar_table))

Call:
lm(formula = mpg ~ ground_clearance, data = mechaCar_table)

Residuals:
    Min      1Q  Median      3Q     Max 
-28.788  -9.990  -1.615   7.332  35.803 

Coefficients:
                 Estimate Std. Error t value Pr(>|t|)  
(Intercept)       19.4175    10.8662   1.787   0.0803 .
ground_clearance   2.0222     0.8385   2.412   0.0198 *
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 14.86 on 48 degrees of freedom
Multiple R-squared:  0.1081,	Adjusted R-squared:  0.08949 
F-statistic: 5.816 on 1 and 48 DF,  p-value: 0.01975

#For comparision summarize linear model mpg/spoiler_angle 
>summary(lm(formula = mpg ~ spoiler_angle, data = mechaCar_table)) 

Call:
lm(formula = mpg ~ spoiler_angle, data = mechaCar_table)

Residuals:
    Min      1Q  Median      3Q     Max 
-35.024 -11.772  -1.469   9.451  35.228 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)   46.07616    6.92823   6.650 2.53e-08 ***
spoiler_angle -0.01659    0.11488  -0.144    0.886    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 15.73 on 48 degrees of freedom
Multiple R-squared:  0.0004343,	Adjusted R-squared:  -0.02039 
F-statistic: 0.02086 on 1 and 48 DF,  p-value: 0.8858

#Summarize linear model mpg/AWD
> summary(lm(formula = mpg ~ AWD, data = mechaCar_table))

Call:
lm(formula = mpg ~ AWD, data = mechaCar_table)

Residuals:
    Min      1Q  Median      3Q     Max 
-32.945 -12.627   0.363   8.503  32.687 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   47.313      3.115  15.189   <2e-16 ***
AWD           -4.368      4.405  -0.992    0.326    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 15.57 on 48 degrees of freedom
Multiple R-squared:  0.02007,	Adjusted R-squared:  -0.0003449 
F-statistic: 0.9831 on 1 and 48 DF,  p-value: 0.3264


#Deliverable 2: 
# Read in Suspension_Coil data as coil_table.
>coil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#Summarize the suspension coil’s PSI continuous variable across all manufacturing lots as total_summary.
>total_summary <- coil_table %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')

#Summarize the following PSI metrics for each lot: mean, median, variance, and standard deviation.
>lot_summary <- coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI) , .groups = 'keep') 



#Deliverable 3:
# t-test for all the lots, pop mu = 1500 psi
> all_psi = coil_table['PSI']
> t.test(all_psi[['PSI']], mu=1500)

	One Sample t-test

data:  all_psi[["PSI"]]
t = -1.8931, df = 149, p-value = 0.06028
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1497.507 1500.053
sample estimates:
mean of x 
  1498.78 

# t-test for lot 1, pop mu = 1500 psi
> lot1_psi = subset(coil_table, Manufacturing_Lot == "Lot1")
> t.test(lot1_psi[['PSI']], mu=1500)

	One Sample t-test

data:  lot1_psi[["PSI"]]
t = 0, df = 49, p-value = 1
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.719 1500.281
sample estimates:
mean of x 
     1500 

# t-test for lot 2, pop mu = 1500 psi
> lot2_psi = subset(coil_table, Manufacturing_Lot == "Lot2")
> t.test(lot2_psi[['PSI']], mu=1500)

	One Sample t-test

data:  lot2_psi[["PSI"]]
t = 0.51745, df = 49, p-value = 0.6072
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.423 1500.977
sample estimates:
mean of x 
   1500.2 

# t-test for lot 3, pop mu = 1500 psi
>lot3_psi = subset(coil_table, Manufacturing_Lot == "Lot3")
> t.test(lot3_psi[['PSI']], mu=1500)

	One Sample t-test

data:  lot3_psi[["PSI"]]
t = -2.0916, df = 49, p-value = 0.04168
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1492.431 1499.849
sample estimates:
mean of x 
  1496.14 
