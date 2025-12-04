# Survival Analysis Example in R
library(survival)
library(survminer)

# Example dataset
data(lung)

# Fit a Cox model
fit <- coxph(Surv(time, status) ~ age + sex, data = lung)

# Print summary
print(summary(fit))

# Plot survival curve
ggsurvplot(survfit(fit), data = lung)
