#########################
Nginx
#########################

* `Nginx开发从入门到精通 <http://tengine.taobao.org/book/index.html>`_

------

* `基于 Nginx 的大文件下载服务 <https://github.com/leonzhouwei/nginx-file-download/blob/master/README_zh_CN.md>`_


.. code-block:: sh

    # 在配置proxy_pass代理转发时，如果后面的url加/，表示绝对根路径；如果没有/，表示相对路径

    sudo tee ${HOME}/.nginx/default.conf
    <<-'EOF'
    upstream my_server {                                                        
        server 192.168.1.100:81;                                               
        keepalive 2000;
    }

    server {
        listen       80;                                                        
        server_name  127.0.0.1;                                              
        client_max_body_size 1024M;
        location / {
            proxy_pass http://my_server/videos/;
            proxy_set_header Host $host:$server_port;
        }
    }
    EOF

    sudo docker run -d --restart=always -p 82:80 -v ${HOME}/.nginx/default.conf:/etc/nginx/conf.d/default.conf \
    --name alpine_nginx_proxy \
    jiangxumin/alpine-nginx:latest

    
