#!/bin/bash
echo -e ""
echo -e "=================="
echo -e "Youtube Downloader"
echo -e "=================="
echo -e ""
echo -e "Using:"

if [ -n "$urls" ]
then
  echo -e "    URL variable"
  urlList=$urls
elif [ -f "/config/urls" ]
then
  echo -e "    URL configuration file"
  urlList=$(cat /config/urls)
elif [ -f "/config/urls.txt" ]
then
  echo -e "    URL configuration file"
  urlList=$(cat /config/urls.txt)
else
  echo "No url specified or file selected. Terminating."
  exit 1
fi

if [ -f "/config/cookies" ]
then
  echo -e "    Cookie file"
  cookie="--cookies /config/cookies"
elif [ -f "/config/cookies.txt" ]
then 
  echo -e "    Cookie file"
  cookie="--cookies /config/cookies.txt"
else
  cookie="--no-cookies"
fi

if [ -n "$config" ]
then
  echo -e "    Config variable"
  conf=$config
elif [ -f "/config/config" ]
then 
  echo -e "    Config file"
  conf=$(cat /config/config)
elif [ -f "/config/config.txt" ]
then
  echo -e "    Config file"
  conf=$(cat /config/config.txt)
else
  echo -e "    Default config:"
  echo -e "        Video: mp4"
  echo -e "        Audio: m4a"
  echo -e "        Output: ChannelName_VideoID_VideoTitle.Extension"
  conf=('-f 137+140'  '-o "%(channel)s_%(id)s_%(title)s.%(ext)s"')
fi

echo "" 
for u in $urlList; do
  url=$(echo $u | xargs)
  yt-dlp $cookie ${conf[@]} $u
done
