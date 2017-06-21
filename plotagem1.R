nomeArq <- "household_power_consumption.txt"
dadosBrutos <- read.table(nomeArq, sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
dadosBrutos$Date <- as.Date(dadosBrutos$Date, format = "%d/%m/%Y")
dados <- subset(dadosBrutos, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
hist(dados$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.copy(png, file = "plotagem1.png", width = 480, height = 480)
dev.off()

