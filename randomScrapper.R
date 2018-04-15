#----------Load a webpage
loadWebPage<-"let(alias=list(
  x='webpage'
  ),expr={
  x <- iconv(x, to='UTF-8')
  x <- sub('ISO-8859-1', 'utf-8', x)
  doc<-htmlTreeParse(x, useInternal = T, encoding='UTF-8', asText=T)
  xmlRoot(doc)
  }
)"


#----------Scrap a webpage
saveWebPage<-function(i=1,url,totPage=1,fPrefix="/trialSearch",upperT=120) {
  library(XML)
  ramT<-sample(20:upperT,1,replace=T)
  consT<-runif(1)
  t<-sample(c(consT+ramT,consT*ramT),1)
  t<-ifelse(t<20,t+20,t)  
  Sys.sleep(t)
  print(paste("Streaming page", (i+1), "in", round(t,2), "seconds:)..."))
  flush.console()
  (suppressWarnings(webpage<-readLines(url)))
  unlink(url)
  doc<-eval(parse(text=loadWebPage))
  id<-sprintf(paste0("%0",nchar(totPage+1),"d"),i+1)
  saveXML(doc,file=paste0(wkDir,fPrefix,id,".xml"),compression=9)
} 