##############
AI      
##############

**************
cursor      
**************

* `cursor models <https://docs.cursor.com/settings/models#available-models>`_

.. code-block:: sh

   npm install -g repomix  --registry https://registry.npmmirror.com

   repomix --remote http://192.168.2.100/pmpilot-4.0.0/v2x-2.0/obu/obu_client.git
   repomix --remote http://192.168.2.100/pmpilot-4.0.0/v2x-2.0/obu/obu_client.git --remote-branch main
   repomix --remote http://192.168.2.100/pmpilot-4.0.0/v2x-2.0/obu/obu_client.git --remote-branch 935b695
   repomix --remote http://192.168.2.100/pmpilot-4.0.0/v2x-2.0/mcu/traffic_light_test_ui.git --style markdown,
   repomix  .

*  

.. code-block:: sh

    连接的主机ip地址变了 192.168.110.120 ->192.168.110.127，
    更改连接地址后， Could not establish connection to 192.168.110.127

    MobaXterm 可以成功连接到 192.168.110.127，但 Cursor 的 Remote-SSH 无法连接;

    ssh-keygen -R 192.168.110.127


    根本原因：
        目标主机 IP 从 192.168.110.120 变为 192.168.110.127，但 known_hosts 文件中保留了旧 IP 的主机密钥记录，
        导致 Cursor 的 SSH 客户端因密钥不匹配而拒绝连接。

    解决机制：
        ssh-keygen -R 192.168.110.127 删除了 known_hosts 中与 192.168.110.127 相关的记录，
        允许 Cursor 在下次连接时重新接受主机密钥。

    MobaXterm 的不同表现：
        MobaXterm 可能自动更新或忽略密钥不匹配，而 Cursor 的严格检查导致需要手动清理。


**************
MCP      
**************

* `MCP Official Website <https://mcp.so/>`_
* `Playbooks MCP <https://playbooks.com/mcp>`_

* Figma
    * `Figma-Context-MCP <https://github.com/GLips/Figma-Context-MCP>`_
    * `cursor-talk-to-figma-mcp <https://github.com/sonnylazuardi/cursor-talk-to-figma-mcp>`_

* playwright-mcp
    * https://github.com/microsoft/playwright-mcp
      * 使用 Playwright MCP 打开 http://localhost:3000，运行页面交互，并读取所有 console 消息。如果有错误，分析并修复代码。

* Office
    * `Office-Word-MCP-Server <https://github.com/GongRzhe/Office-Word-MCP-Server>`_
    * `excel-mcp-server <https://github.com/negokaz/excel-mcp-server>`_
    * `PowerPoint MCP <https://playbooks.com/mcp/socamalo-powerpoint>`_

* `awesome-mcp-servers <https://github.com/punkpeye/awesome-mcp-servers>`_

**************
Claude
**************

* `Claude Desktop for Debian <https://github.com/aaddrick/claude-desktop-debian>`_


* **Agent skills**

    * `UI UX Pro Max <https://github.com/nextlevelbuilder/ui-ux-pro-max-skill>`_
    * `frontend-design <https://claudekit.github.io/frontend-design-pro-demo>`_

* **subagents**

    * awesome-claude-code-subagents

        * https://github.com/VoltAgent/awesome-claude-code-subagents

        * Claude Code Subagents & Commands Collection

            * https://github.com/davepoon/buildwithclaude
            * https://www.buildwithclaude.com/browse


* Claude code +subagent + Git Worktree

    * https://www.bilibili.com/video/BV1MdqfB6EDn?spm_id_from=333.788.videopod.sections&vd_source=6c16ccca40aa689dd4c3950c899f53d1

* **voltagent**

    * https://voltagent.dev/ 
    * https://github.com/voltagent/voltagent/

* https://github.com/oraios/serena
* https://github.com/Maciek-roboblog/Claude-Code-Usage-Monitor

* **UI设计**

    * `superdesign <https://app.superdesign.dev/>`_
    * `firecrawl <https://www.firecrawl.dev/>`_

        * `firecrawl-mcp-server <https://github.com/firecrawl/firecrawl-mcp-server>`_

    * `Animatopy <https://sarthology.github.io/Animatopy>`_
    * `coolors <https://coolors.co>`_

    * `drawbridge <https://github.com/breschio/drawbridge>`_

        Drawbridge 是一个开源的 Chrome 扩展程序和 Cursor 规则集，
        主要用于在浏览器中对网页进行视觉标注（类似 Figma 的评论功能），
        并将这些标注直接作为提示发送给 Claude Code 和 Cursor 等 AI 编码工具，
        帮助 AI 自动实现设计修改，极大提升前端开发效率。

    * puppeteer-mcp

    * `tweakcn <https://tweakcn.com/>`_


    * `shadcn-mcp`

        * `shadcn-ui <https://ui.shadcn.com/>`_
        * `shadcn-vue <https://www.shadcn-vue.com/>`