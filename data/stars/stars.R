hhvm <- read.csv("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/facebook-hhvm.csv", header=TRUE)
atom <- read.csv("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/atom-atom.csv", header=TRUE)
roslyn <- read.csv("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/dotnet-roslyn.csv", header=TRUE)
storm1 <- read.csv("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/nathanmarz-storm.csv", header=TRUE)
storm2 <- read.csv("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/apache-storm.csv", header=TRUE)
swift <- read.csv("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/apple-swift.csv", header=TRUE)
zulip <- read.csv("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/zulip-zulip.csv", header=TRUE)
hubot <- read.csv("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/github-hubot.csv", header=TRUE)
plotly <- read.csv("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/plotly-plotly.js.csv", header=TRUE)


pdf("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/stars_plotly.pdf", width=10, height=10)
plot(plotly$sum/ 1000, type="l", xlab="Weeks", ylab="Sum", cex.lab=1.2, lwd=2, axes = FALSE)
axis(1)
pts <- pretty(plotly$sum / 1000)
axis(2, at = pts, labels = paste(pts, "K", sep = ""))
title("plotly")
box()
dev.off()

pdf("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/stars_hubot.pdf", width=10, height=10)
plot(hubot$sum/ 1000, type="l", xlab="Weeks", ylab="Sum", cex.lab=1.2, lwd=2, axes = FALSE)
axis(1)
pts <- pretty(hubot$sum / 1000)
axis(2, at = pts, labels = paste(pts, "K", sep = ""))
title("Hubot")
box()
dev.off()

pdf("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/stars_zulip.pdf", width=10, height=10)
plot(zulip$sum/ 1000, type="l", xlab="Weeks", ylab="Sum", cex.lab=1.2, lwd=2, axes = FALSE)
axis(1)
pts <- pretty(zulip$sum / 1000)
axis(2, at = pts, labels = paste(pts, "K", sep = ""))
title("Zulip")
box()
dev.off()

pdf("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/stars_atom.pdf", width=10, height=10)
plot(atom$sum/ 1000, type="l", xlab="Weeks", ylab="Sum", cex.lab=1.2, lwd=2, axes = FALSE)
axis(1)
pts <- pretty(atom$sum / 1000)
axis(2, at = pts, labels = paste(pts, "K", sep = ""))
title("Atom")
box()
dev.off()

pdf("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/stars_hhvm.pdf", width=10, height=10)
plot(hhvm$sum/ 1000, type="l", xlab="Weeks", ylab="Sum", cex.lab=1.2, lwd=2, axes = FALSE)
axis(1)
pts <- pretty(hhvm$sum / 1000)
axis(2, at = pts, labels = paste(pts, "K", sep = ""))
title("HHVM")
box()
dev.off()

pdf("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/stars_roslyn.pdf", width=10, height=10)

plot(roslyn$sum/ 1000, type="l", xlab="Weeks", ylab="Sum", cex.lab=1.2, lwd=2, axes = FALSE)
axis(1)
pts <- pretty(roslyn$sum / 1000)
axis(2, at = pts, labels = paste(pts, "K", sep = ""))
title("Roslyn")
box()
dev.off()

pdf("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/stars_StormOld.pdf", width=10, height=10)
plot(storm1$sum/ 1000, type="l", xlab="Weeks", ylab="Sum", cex.lab=1.2, lwd=2, axes = FALSE)
lines(storm2$sum/ 1000, type="b", col="black",lty=2,lwd=2)
axis(1)
pts <- pretty(storm1$sum / 1000)
axis(2, at = pts, labels = paste(pts, "K", sep = ""))
title("Storm")
box()
dev.off()

pdf("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/stars_stormApache.pdf", width=10, height=10)
plot(storm2$sum/ 1000, type="l", xlab="Weeks", ylab="Sum", cex.lab=1.2, lwd=2, axes = FALSE)
axis(1)
pts <- pretty(storm2$sum / 1000)
axis(2, at = pts, labels = paste(pts, "K", sep = ""))
title("Storm")
box()
dev.off()

pdf("~/Dropbox/Documents/ifpa/2016/writing_papers/ESEJb/codes/data/stars/stars_swift.pdf", width=10, height=10)
plot(swift$sum/ 1000, type="l", xlab="Weeks", ylab="Sum", cex.lab=1.2, lwd=2, axes = FALSE)
axis(1)
pts <- pretty(swift$sum / 1000)
axis(2, at = pts, labels = paste(pts, "K", sep = ""))
title("Swift")
box()
dev.off()
