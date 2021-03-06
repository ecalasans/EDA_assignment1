nomeArq <- "household_power_consumption.txt"
dadosBrutos <- read.table(nomeArq, sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
dadosBrutos$Date <- as.Date(dadosBrutos$Date, format = "%d/%m/%Y")
dados <- subset(dadosBrutos, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

dados$DateTime <- strptime(paste(dados$Date, dados$Time), format = "%Y-%m-%d %H:%M:%S")
dados$DateTime <- as.POSIXct(dados$DateTime)

par(mfrow = c(2,2))

plot(dados$Global_active_power ~ dados$DateTime, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")

plot(dados$Voltage ~ dados$DateTime, type = "l", ylab = "Voltage", xlab = "")


plot(dados$Sub_metering_1 ~ dados$DateTime, type = "n", ylab = "Energy sub metering", xlab = "")
lines(dados$Sub_metering_1 ~ dados$DateTime, type = "l", col = "black") 
lines(dados$Sub_metering_2 ~ dados$DateTime, type = "l", col = "red")
lines(dados$Sub_metering_3 ~ dados$DateTime, type = "l", col = "blue")
legend(lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), "topright", col = c("black", "red", "blue"))

plot(dados$Global_reactive_power ~ dados$DateTime, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")

dev.copy(png, file = "plotagem4.png", width = 480, height = 480)
dev.off()