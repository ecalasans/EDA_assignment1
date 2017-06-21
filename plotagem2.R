nomeArq <- "household_power_consumption.txt"
dadosBrutos <- read.table(nomeArq, sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
dadosBrutos$Date <- as.Date(dadosBrutos$Date, format = "%d/%m/%Y")
dados <- subset(dadosBrutos, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

dados$DateTime <- strptime(paste(dados$Date, dados$Time), format = "%Y-%m-%d %H:%M:%S")
dados$DateTime <- as.POSIXct(dados$DateTime)

plot(dados$Global_active_power ~ dados$DateTime, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")

dev.copy(png, file = "plotagem2.png", width = 480, height = 480)
dev.off()
