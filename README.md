# ssHttpClient
This is a proxy client, building with shadowsocks client + privoxy.
Build: docker build -t ss_http_client:1.0 .
Usage: docker run -d --name test_ss -e SS_SERVER=server.com -e SS_PORT=10000 -e SS_PASSWORD=password -e SS_METHOLD=aes-256-cfb -p <your fav port>:8118 ss_http_client:1.0

