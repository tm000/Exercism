FROM httpd:latest
# ホスト側のファイルをイメージ側にコピー
COPY ./index.html /usr/local/apache2/htdocs/
 
