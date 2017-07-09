# Association Analysis
#Packages("pacman")
#Packages for association analysis (arules and arulesViz)

pacman::p_load(arules, arulesViz)

# Load Transactional Data 

Mahesh_data<- read.transactions("Groceries.csv")   # Load data
#Convert into transaction if data is not in transactional form
#Data_fact <- data.frame(lapply(Caps_Extraction,as.factor))
#Data_trans <- as(Data_fact, 'transactions')

str(Mahesh_data)      # Show structure of data
summary(Mahesh_data)  # Includes 5 most frequent items
# Rules 
# Set minimum support (minSup) to 0.001
# Set minimum confidence (minConf) to 0.90

rules <- apriori(Mahesh_data, parameter = list(supp = 0.001, conf = 0.90)) #Applying Apriori Algorithm

options(digits = 2)
inspect(rules[1:10])

# Scatterplot of support x confidence (colored by lift)

plot(rules)

# Plot 10 rules

plot(rules[1:10],  method = "graph", control = list(type = "items"))
# Parallel coordinates plot of top 10 rules

plot(rules[1:10],  method = "paracoord", control = list(reorder = TRUE))

# Grouped matrix plot of antecedents and consequents

plot(rules[1:10],  method = "grouped")


# Matrix plot of antecedents and consequents
plot(rules[1:10],  method = "matrix", control = list(reorder = TRUE))
rules<-sort(rules, by="confidence", decreasing=TRUE)
plot(rules,method="graph",interactive=TRUE,shading=NA)




