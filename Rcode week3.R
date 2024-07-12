# Linear Regression
fit <- lm(eruptions ~ waiting, data = faithful)
faithful
summary(fit)
coeff <- coefficients(fit)
waiting = 120
duration <- coeff[1] + coeff[2]*waiting
summary(fit)$r.squared
plot(eruptions ~ waiting,data = faithful)
abline(fit$coefficients, col = "red")

# Residual
residual <- resid(fit)
residual <- fit$residuals
plot(fit$residuals ~ fit$fitted.values, data = faithful, col = "blue")
hist(fit$residuals)

plot(fit)
# Normality test
qqPlot(fit, main = "QQ Plot")

library(DAAG)
fit <- lm(mpg ~ disp + hp + drat + wt, data = mtcars)
pred <- predict(fit, data = mtcars)
par(mfrow=c(2,2))
plot(fit)

# ANOVA
str(iris)
data <- boxplot(Sepal.Length ~ Species, data = iris)
means <- tapply(iris$Sepal.Length, iris$Species, mean)
points(means, col ="red", pch = 18, cex = 1.5)
anovatest <- aov(Sepal.Length ~ Species, data = iris)
summary(anovatest)
