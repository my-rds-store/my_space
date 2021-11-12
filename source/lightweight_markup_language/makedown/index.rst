##########
Makedown  
##########

* `LaTeX公式编辑器 <https://www.latexlive.com/home>`_

* `Makedown 画图 <https://mermaid-js.github.io/mermaid/diagrams-and-syntax-and-examples/>`_

* `在线编辑器 <https://mermaid-js.github.io/mermaid-live-editor>`_

.. code-block:: md

    ```mermaid
    graph TD
        A[Christmas] -->|Get money| B(Go shopping)
        B --> C{Let me think}
        C -->|One| D[Laptop]
        C -->|Two| E[iPhone]
        C -->|Three| F[fa:fa-car Car]
    ```

    ```mermaid
    gantt
        dateFormat  YYYY-MM-DD

        title 软件开发甘特图

        section 设计
            需求:done,des1, 2019-01-06,2019-01-08
            原型:active,des2, 2019-01-09, 3d
            UI设计:des3, after des2, 5d
            未来任务:des4, after des3, 5d

        section 开发
            学习准备理解需求:crit, done, 2019-01-06,24h
            设计框架:crit, done, after des2, 2d
            开发:crit, active, 3d
            未来任务:crit, 5d
            休息时间:2d

        section 测试
            功能测试:active, a1, after des3, 3d
            压力测试:after a1, 20h
            测试报告: 48h
    ```

    ```mermaid
    sequenceDiagram
        小程序 ->> 小程序 : wx.login()获取code
        小程序 ->> + 服务器 : wx.request()发送code
        服务器 ->> + 微信服务器 : code+appid+secret
        微信服务器 -->> - 服务器 : openid
        服务器 ->> 服务器 : 根据openid确定用户并生成token
        服务器 -->> - 小程序 : token
    ```

    ```mermaid
    %%{init: {'theme': 'base', 'themeVariables': { 'primaryColor': '#ff0000'}}}%%
            graph TD
              A[Christmas] -->|Get money| B(Go shopping)
              B --> C{Let me think}
              B --> G[/Another/]
              C ==>|One| D[Laptop]
              C -->|Two| E[iPhone]
              C -->|Three| F[fa:fa-car Car]
              subgraph section
                C
                D
                E
                F
                G
              end
    ```


* `Makedown => PDF 在线生成器 <http://www.mdtr2pdf.com/index.html>`_


* 表格内折行


.. code-block:: md

    |姓名|爱好|
    |----|----|
    |张三|足球<br>篮球
    |李四|羽毛球<br>乒乓球


* 修改图片大小
    * https://stackoverflow.com/questions/14675913/changing-image-size-in-markdown


You could just use some HTML in your Markdown:

.. code-block:: html

    <img src="drawing.jpg" alt="drawing" width="200"/>

Or via style attribute (not supported by GitHub)

.. code-block:: html

    <img src="drawing.jpg" alt="drawing" style="width:200px;"/>

Or you could use a custom CSS file as described in this answer on Markdown and image alignment

.. code-block:: md

    ![drawing](drawing.jpg)

CSS in another file:

.. code-block:: md

    img[alt=drawing] { width: 200px; }