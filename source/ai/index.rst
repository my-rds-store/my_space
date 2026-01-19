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

* agent-browser 
    * https://github.com/vercel-labs/agent-browser.git
        * agent-browser 是 Vercel Labs 出的「专门给 AI Agent 用的」浏览器自动化命令行工具（CLI），核心目标是：让大模型可以像人一样打开网页、点点点、填表、上传文件、截图、获取页面内容，但所有操作都以 CLI 和「AI 友好的数据结构」呈现，非常方便接入各类 LLM / Agent

* Office
    * `Office-Word-MCP-Server <https://github.com/GongRzhe/Office-Word-MCP-Server>`_
    * `excel-mcp-server <https://github.com/negokaz/excel-mcp-server>`_
    * `PowerPoint MCP <https://playbooks.com/mcp/socamalo-powerpoint>`_

* `awesome-mcp-servers <https://github.com/punkpeye/awesome-mcp-servers>`_

**************
Claude
**************

* `Claude Desktop for Debian <https://github.com/aaddrick/claude-desktop-debian>`_


* **Plugins**

    * `claude-mem <https://claude-mem.ai>`_


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
        * `shadcn-vue <https://www.shadcn-vue.com/>`_

        * `context7 <https://context7.com/>`_


***********
VibeCoding
***********

* `vibe-kanban <https://www.vibekanban.com>`_

    * `vibe-guide <https://www.vibekanban.com/vibe-guide>`_


产品设计
--------------

* `OpenSpec <https://github.com/OpenSpec/OpenSpec>`_
    * `【Claude Code】OpenSpec 安装与使用 <https://zhuanlan.zhihu.com/p/1971369431671219035>`_
    * `OpenSpec,SpecKit and AgentOS. <https://www.youtube.com/watch?v=d3Glwdf_xA8>`_

* `planning-with-files <https://github.com/OthmanAdi/planning-with-files.git>`_
    * https://zhuanlan.zhihu.com/p/1994343817332143003


* `Auto-Claude <https://github.com/AndyMik90/Auto-Claude>`_


* chm 转 markdown
    * `chm-converter <https://github.com/DTDucas/chm-converter>`_
    * `sudo apt install kchmviewer`

***********
Tools
***********

* Claude-Cowork
    * https://github.com/DevAgentForge/Claude-Cowork.git
* AionUi
    * https://github.com/iOfficeAI/AionUi

* eigent(支持私有部署-未验证)
    * https://github.com/eigent-ai/eigent


* `cc-switch <https://github.com/farion1231/cc-switch.git>`_

------------

* `Presenton AI 演示文稿生成 <https://github.com/presenton/presenton.git>`_
* `ComfyUI 文字生成图/视频 <https://github.com/Comfy-Org/ComfyUI>`_

-----------

* `langchain  <https://github.com/langchain-ai/langchain>`_

    * 构建 LLM 应用 / Agent 的开源框架 + 生态

-----------

* `Manim <https://docs.manim.community/en/stable/>`_
