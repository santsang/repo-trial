require(psych)
par(ps=8)
xlim = c(0, 10)
ylim = c(0, 20)
plot(NA, xlim = xlim, ylim = ylim, main = " ",
axes = FALSE, xlab = "", ylab = "")
u1 <- dia.rect(-2.5, 3.6, labels = "pilot survey", xlim = xlim, ylim = ylim)
dia.curved.arrow(from,to,labels=NULL,scale=1)
l.pt <- dia.ellipse(2.5, 1.3)
dia.arrow(u1$right, u2$left)

fx<-c(vars[[1]],vars[[2]],vars[[3]],vars[[4]],vars[[6]])
fy<-c(vars[[7]],vars[[6]])
l.latent<-fnames[c(1:4,6)]
r.latent<-fnames[c(7,6)]

l.dis<-2
r.dis<-0.5

l.height<-1:length(fx)
r.height<-1:length(fy)
coord<-sum(abs(ylim))/(length(fx)+1)
#r.coord<-sum(abs(ylim))/(length(fy)+1)
r.start<-round((length(fx)-length(fy))/2)+length(r.latent)-1

for (i in 1:length(fx))
dia.rect(0,max(ylim)-l.coord*l.height[i]*l.dis, labels=fx[i], xlim = xlim, ylim = ylim)
r.ylim<-max(ylim)-l.coord*l.height[r.start]*l.dis

for (i in 1:length(fy))
	{for (j in 1:length(r.latent))
		{k<-j-1
		dia.rect(10,r.ylim-l.coord*l.height[i+k]*l.dis, labels=fy[i],
		xlim = xlim, ylim = ylim)
		}
	}



