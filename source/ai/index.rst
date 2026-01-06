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

* Office
    * `Office-Word-MCP-Server <https://github.com/GongRzhe/Office-Word-MCP-Server>`_
    * `excel-mcp-server <https://github.com/negokaz/excel-mcp-server>`_
    * `PowerPoint MCP <https://playbooks.com/mcp/socamalo-powerpoint>`_

* `awesome-mcp-servers <https://github.com/punkpeye/awesome-mcp-servers>`_

**************
Claude
**************

* `Claude Desktop for Debian <https://github.com/aaddrick/claude-desktop-debian>`_
