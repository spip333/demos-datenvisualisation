# Demo Mosaic Plot
UCBAdmissions
help("UCBAdmissions")
str(UCBAdmissions)
ftable(UCBAdmissions)
table(UCBAdmissions[1,,]) # Admit.admitted
table(UCBAdmissions[2,,]) # Admit.rejected
table(UCBAdmissions[,1,]) # Gender.males
table(UCBAdmissions[,2,]) # Gender.females
table(UCBAdmissions[,,1]) # Dept.a
table(UCBAdmissions[,,2]) # Dept.b
table(UCBAdmissions[,,3]) # Dept.c
table(UCBAdmissions[,,4]) # Dept.d
table(UCBAdmissions[,,5]) # Dept.e
table(UCBAdmissions[,,6]) # Dept.f
mosaic(UCBAdmissions)

# Plots
mosaic(~Admit+Gender,data=UCBAdmissions,shade=TRUE)
mosaic(~Admit+Gender+Dept,data=UCBAdmissions,shade=TRUE)
mosaic(~Admit+Gender+Dept,data=UCBAdmissions,
       highlighting = "Gender",
       highlighting_fill=c("lightblue","pink"),
       direction=c("v","v","h"))

