library(shiny)
shinyServer(function(input, output) {  
  
#Data 
  p <- seq(from=0.005, to=0.995, by=0.005)
  T <- 10
  y <-c(0,1,0,1,1,1,0,1,1,1)
  likelihood <- sapply(p, function(p) { prod(p^y * (1-p)^(1-y)) } )
  like.rescale <- 3 * likelihood/max(likelihood)
  
#Plot
output$bayesPlot <- renderPlot({ 
  plot(p, like.rescale, lwd=2, las=1, bty="n",
              ylim=c(0,6), type="l", ylab="density",
              main="Beta prior (blue) x Likelihood (black) = Beta posterior (red)")
  
  alpha.post <- input$alpha + sum(y)
  beta.post <- input$beta + T - sum(y)
  
  lines(p, dbeta(p, input$alpha, input$beta), col="blue", lwd=2)
         polygon(c(p, rev(p)), c(dbeta(p, input$alpha, input$beta),
                                 rep(0, length(p))), col=rgb(0, 0, 1, 0.2), border=NA)
  
  lines(p, dbeta(p, alpha.post, beta.post), col="red", lwd=2)
         polygon(c(p, rev(p)), c(dbeta(p, alpha.post, beta.post),
                                 rep(0, length(p))), col=rgb(1, 0, 0, 0.2), border=NA)

})
  
})
