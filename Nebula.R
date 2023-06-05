set.seed(202302)
install.packages("pacman")
library(pacman)
p_load_gh("mpascariu/PasswordGen")
p_load(gutenbergr,stringr)

info1 <- gutenberg_works(str_detect(title, "Frankenstein; Or, The Modern Prometheus"))
info1$gutenberg_id # this should be 1661

info2 <- gutenberg_works(str_detect(title, "The Complete Works of William Shakespeare"))
info2$gutenberg_id # this should be 1661
info3 <- gutenberg_works(str_detect(title, "The Adventures of Sherlock Holmes"))
info3$gutenberg_id # this should be 1661

info4 <- gutenberg_works(str_detect(title, "The Odyssey"))
info4$gutenberg_id[1] # this should be 1661

info5 <- gutenberg_works(str_detect(title, "The War of the Worlds"))
info5$gutenberg_id # this should be 1661

info6 <- gutenberg_works(str_detect(title, "The Iliad"))
info6$gutenberg_id[1] # this should be 1661

info7 <- gutenberg_works(str_detect(title, "On the Origin of Species By Means of Natural Selection"))
info7$gutenberg_id[1] # this should be 1661

info8 <- gutenberg_works(str_detect(title, "Dracula"))
info8$gutenberg_id[1] # this should be 1661

## [1] 1661

# download the book
my_book1 <- gutenberg_download(gutenberg_id = info1$gutenberg_id, meta_fields = "title",
                              mirror = "http://gutenberg.pglaf.org")
my_book2 <-gutenberg_download(gutenberg_id = info2$gutenberg_id, meta_fields = "title",
                              mirror = "http://gutenberg.pglaf.org")

my_book3 <- gutenberg_download(gutenberg_id = info3$gutenberg_id, meta_fields = "title",
                               mirror = "http://gutenberg.pglaf.org")
my_book4 <-gutenberg_download(gutenberg_id = info4$gutenberg_id[1], meta_fields = "title",
                              mirror = "http://gutenberg.pglaf.org")

my_book5 <-gutenberg_download(gutenberg_id = info5$gutenberg_id, meta_fields = "title",
                              mirror = "http://gutenberg.pglaf.org")
my_book6 <-gutenberg_download(gutenberg_id = info6$gutenberg_id[1], meta_fields = "title",
                              mirror = "http://gutenberg.pglaf.org")

my_book7 <-gutenberg_download(gutenberg_id = info7$gutenberg_id[1], meta_fields = "title",
                              mirror = "http://gutenberg.pglaf.org")

my_book8 <-gutenberg_download(gutenberg_id = info8$gutenberg_id[1], meta_fields = "title",
                              mirror = "http://gutenberg.pglaf.org")


my_books <- my_book1 %>% 
  rbind(my_book2)%>% 
  rbind(my_book3)%>%
  rbind(my_book4)%>%
  rbind(my_book5)%>% 
  rbind(my_book6) %>%
  rbind(my_book7) %>%
  rbind(my_book8)

my_books <- my_books[sample(1:nrow(my_books)),] 

words <- ExtractWords(data.r = my_books$text)
words

password(no_words = 3,     # 5 word password
         data = words,
         numbers = FALSE,   # with numbers
         symbols = FALSE,  # without symbols
         sep = '+') # with a space between the words