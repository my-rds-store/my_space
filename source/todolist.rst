############
待办事项
############

本页记录个人待办事项，按状态分为「进行中」「待办」「已完成」三部分。

**标记约定**

* [ ] 未完成
* [x] 已完成

新增事项时，在对应小节下写一行列表项；完成后把方括号里的空格改成字母 x，
再把该条移动到「已完成」小节。需要补充说明时，可在事项下缩进写备注或链接。

**格式示例**

.. code-block:: text

    * [ ] 事项描述
    * [x] 已完成的事项

**********
进行中
**********

暂无。

**********
待办
**********

* [ ] 待整理 Human-Atlas
    * https://github.com/slorksmo/Human-Atlas

* [ ] Microduck 研究
    * https://github.com/fanhao375/microduck-replica.git

* [ ] 研究 iceoryx2
    * Rust 实现的零拷贝 IPC 数据平面，是 iceoryx 的后继者；ROS 2 link adapter/gateway（原型）已用 Humble + rmw_cyclonedds_cpp 验证，也可通过 rmw_iceoryx2（alpha）直接作为 ROS 2 的 RMW。
    * 注意：CycloneDDS 自带的共享内存零拷贝 PSMX 插件对接的是 Iceoryx 2.0（上一代），不是 iceoryx2。
    * https://iceoryx.io/
    * https://github.com/eclipse-iceoryx/iceoryx2
    * https://github.com/ekxide/rmw_iceoryx2

* [ ] Lichee Zero 研究
    * https://wiki.sipeed.com/hardware/zh/lichee/Zero/Zero.html
    * https://licheezero.readthedocs.io/zh/latest/index.html

* [ ] AI（agent 具身智能）相关岗位查询
    * 山东智衍科技（魏桥全资控股的子公司）

**********
已完成
**********

暂无。

.. 注意：本文件不要以 ---- 分隔线结尾，否则 docutils 会报
   "Document may not end with a transition"。
