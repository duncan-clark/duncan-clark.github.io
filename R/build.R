build_one = function(io) {
  # if output is not older than input, skip the compilation
  if (!blogdown:::require_rebuild(io[2], io[1])) return()

  message('* knitting ', io[1])
  if (blogdown:::Rscript(shQuote(c('R/build_one.R', io))) != 0) {
    unlink(io[2])
    stop('Failed to compile ', io[1], ' to ', io[2])
  }
}

# Rmd files under the root directory
rmds = list.files('.', '[.]Rmd$', recursive = TRUE, full.names = TRUE)
files = cbind(rmds, blogdown:::with_ext(rmds, '.md'))
print(files)

for (i in seq_len(nrow(files))){
  print(i)
  build_one(files[i, ])
  print(files[i,])
  tmp = readChar(files[i,1],17)
  tmp = substr(tmp,nchar(tmp)-3,nchar(tmp))
  print(tmp)
  print(getwd())
  if(tmp == "post"){
   file.copy(paste(substr(files[i,1],1,nchar(files[i,1])-3),"md",sep=""),"_posts" ) 
  }

}
system2('jekyll', 'build')
