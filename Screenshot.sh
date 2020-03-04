export PATH=/usr/local/bin:$PATH

path=/path/to/desired/buffer/folder

#I use $RANDOM, but you can use whichever suffix system you like
filename=screenshot_$RANDOM.png
localfile=$path$filename
url=https://imgs.example.com/$filename

#screen capture, -i is interactive flag
screencapture -i $localfile

#compression through pngquant if desired
#pngquant --strip --ext .png --force  $localfile

#add set ftp:ssl-allow no; inside the quotes to disable ssl
lftp ftp://username:passwordw@server.com   -e "put -O /path/to/desired/remote/folder $localfile; bye"

printf $url | pbcopy
