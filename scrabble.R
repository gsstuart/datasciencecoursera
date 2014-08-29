#lapply(LETTERS, function(a)  sub('$^', a, tiles))
#tiles = c('', 'D', 'A', 'E', 'U', 'S', 'I')
#tiles = c('P', 'E', 'N', 'G', 'U', 'I', 'N')

library('gtools')

findword = function(tiles) {
  if (!exists('dict')) dict <<- readLines('/usr/share/dict/words')
  tiles = strsplit(tiles, '')
  p = permutations(7, 7, tiles[[1]], set=FALSE)
  p = as.list(data.frame(t(p), stringsAsFactors = 0))
  p = lapply(p, paste, collapse='')
  
  as.character ( p[p %in% dict] )
}



