##################
VS Code 与 Cursor
##################

* `VS Code 文档 <https://code.visualstudio.com/docs>`_

Cursor
======

.. code-block:: bash

   ~/Library/Application\ Support/Cursor    # Cursor AI 聊天历史

VS Code
====================

配置
----

关闭终端自动提示：

.. code-block:: text

   terminal.integrated.suggest

打开用户设置 JSON：Ctrl + Shift + P，执行 Preferences: Open User Settings (JSON)。

* `转 PDF <https://www.jianshu.com/p/4856a78b96b6>`_
* https://github.com/NightNineCat/markdown-pdf_css

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

Git worktree
------------

如果 VS Code 的 Git 版本没问题，却识别不到 worktree，通常是 git.detectWorktrees 设置被关闭了。

启用步骤：

#. 打开设置：Ctrl + ,（macOS 为 Cmd + ,）。
#. 在搜索框输入 git.detectWorktrees。
#. 勾选 “Git: Detect Worktrees” 选项，使其处于启用状态。
#. 重启 VS Code，让设置生效。
