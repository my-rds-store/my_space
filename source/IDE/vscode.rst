Vscode
=============

配置
--------

* `转PDF <https://www.jianshu.com/p/4856a78b96b6>`_
*  https://github.com/NightNineCat/markdown-pdf_css

.. code-block:: json

    {
        "workbench.colorTheme": "Monokai",
        "files.autoSave": "off",
        "editor.renderControlCharacters": true,
        "window.zoomLevel": 1,
        "workbench.iconTheme": "material-icon-theme",
        "C_Cpp.updateChannel": "Insiders",
        "cmake.configureOnOpen": true,
        "ycmd.path": "/home/promote/.vim/bundle/YouCompleteMe/third_party/ycmd",
        "ycmd.global_extra_config": "/home/promote/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py",
        "ycmd.enabled_languages": [
        
            "cpp",
            "c"
        ],
        "http.proxySupport": "off",
        "files.exclude": {
            "**/*.pyc": true
        },
        "markdown-pdf.styles": [
            "/home/promote/.vscode/extensions/my-mkdown-pdf.styles/markdown-pdf_css/markdown.css"
        ],

        // "markdown-pdf.headerTemplate": "<div style=\"font-size: 9px; margin-left: 1cm;\"> <span class=\"title\"></span></div> <div style=\"font-size: 9px; margin-left: auto; margin-right: 1cm; \"> <span class='date'></span></div>"
        "markdown-pdf.headerTemplate": 
            "<div style=\"font-size: 9px; margin-left: 1cm;\"> <span>山东派蒙</span></div> <div style=\"font-size: 9px; margin-left: auto; margin-right: 1cm; \"> <span class='date'></span></div>"
    }

