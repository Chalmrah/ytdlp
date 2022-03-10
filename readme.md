# Youtube Downloader container

## Usage

A simple example is the following:
```
docker run -it --rm -e "urls=https://www.youtube.com/watch?v=G1Ke-H8I1uk https://www.youtube.com/watch?v=h74mZp0SvyE" -v $(pwd)/d:/downloads chalmrah/ytdlp:1.1
```

## URLS

- URLs are a space seperated list of urls for the downloader to process if set in the command line.
- Alternatively, a line seperated list in the /config/urls file.

## Config

- Config is either done in an environment variable ```-e "config='-f 137+140'``` or in the config file in /config/config.
- The config file takes all supported arguments for yt-dlp in a list, one argument per line.
- List the arguments as if they were on the command line already. e.g. ```--playlist-items 1,3-10```
- If neither option is stated then the config defaults to ```-f 137+140 -o "%(channel)s_%(id)s_%(title)s.%(ext)s"```

## Cookies

- Cookies are enabled by exporting your browser cookies to a text file and putting them in /config/cookies
- If the file exists, the container will use them.