########
C/C++   
########


.. toctree::
   :maxdepth: 2
   :caption: Contents:

   cpp/index
   glib
   data_structure
   debug
   ffmpeg

* `C++ 参考手册  <https://zh.cppreference.com/w/%E9%A6%96%E9%A1%B5>`_
* `my cpp node <https://cpp.readthedocs.io/en/latest/index.html>`_

-----------

* `C++ 并发编程 (从C++11到C++17) <https://paul.pub/cpp-concurrency/#id-%E5%B9%B6%E5%8F%91%E4%B8%8E%E5%B9%B6%E8%A1%8C>`_
* `C++并发编程实战 <https://nj.gitbooks.io/c/content/>`_
* `C++并发编程实战 第二版 <https://chenxiaowei.gitbook.io/c-concurrency-in-action-second-edition-2019/>`_


------------


************************************************************************
`系统程序员成长计划 <https://c-language-learn-plan.readthedocs.io>`_
************************************************************************

************************************************
`Unix c <https://unix-c.readthedocs.io>`_
************************************************

*  `C11多线程 <https://www.ibadboy.net/archives/2320.html>`_
    * `C11新增多线程支持库-threads.h参考手册  <https://www.ibadboy.net/archives/2323.html>`_



**********************
Cmake
**********************


* `Cmake-Cookbook (网速慢，需要梯子) <https://app.gitbook.com/@chenxiaowei/s/cmake-cookbook/>`_
    * `cmake教程4(find_package使用) <https://cloud.tencent.com/developer/article/1338349>`_
    * `CMake之find_package <https://www.jianshu.com/p/46e9b8a6cb6a>`_
* `CMake Cookbook中文版 <https://www.bookstack.cn/read/CMake-Cookbook/content-chapter1-1.0-chinese.md>`_
    * https://github.com/xiaoweiChen/CMake-Cookbook.git
    * `cmake 生成 protobuf <https://blog.csdn.net/datase/article/details/82763236>`_
    * `readelf <https://blog.csdn.net/yfldyxl/article/details/81566279>`_

***************************************************************************
`跟我一起写Makefile <https://seisman.github.io/how-to-write-makefile/>`_
***************************************************************************

* https://github.com/seisman/how-to-write-makefile


***************************************************************************
`Learn OpenGL <https://learnopengl-cn.github.io/>`_
***************************************************************************


**********************
Doxygen
**********************

* 待研究
    * `Doxygen 10 分钟入门教程 <http://cedar-renjun.github.io/2014/03/21/learn-doxygen-in-10-minutes/index.html>`_
    * `学习用 doxygen 生成源码文档  <https://www.ibm.com/developerworks/cn/aix/library/au-learningdoxygen/>`_
    * `doxygen 使用 <https://www.cnblogs.com/rongpmcu/p/7662765.html>`_


**********************
Protobuf
**********************

* `protobuf 教程 <待整理> <https://blog.csdn.net/zyboy2000/article/details/94959909>`_

.. code-block:: bash

    # ubuntu install protobuf
    sudo apt-get install  libprotobuf-dev
    sudo apt-get install protobuf-compiler

    #
    g++ write.cpp addressbook.pb.cc  -o write `pkg-config --cflags --libs protobuf`
    g++ read.cpp  addressbook.pb.cc  -o read  `pkg-config --cflags --libs protobuf`

.. code-block:: makefile

    SRC_DIR:=../../proto
    DST_DIR:=.
    all:
            protoc -I=${SRC_DIR} --cpp_out=${DST_DIR}    ${SRC_DIR}/gps_path_tracking.proto
            protoc -I=${SRC_DIR} --python_out=${DST_DIR} ${SRC_DIR}/gps_path_tracking.proto


.. code:: 

        # Qt .pro add this line
        unix|win32: LIBS += -pthread -lprotobuf -pthread -lpthread


**********************
boost
**********************

.. code-block:: zsh

    sudo apt-get install libboost-all-dev

**********************
GeographicLib
**********************

* `GeographicLib 1.50.1 <https://geographiclib.sourceforge.io/html/classGeographicLib_1_1LocalCartesian.html>`_
* `GeographicLib 1.50 <https://geographiclib.sourceforge.io/1.50/classGeographicLib_1_1LocalCartesian.html>`_
* `GeographicLib 1.49 <https://geographiclib.sourceforge.io/1.49/classGeographicLib_1_1LocalCartesian.html>`_

.. code-block:: cpp

    // main.cpp
    #include <iostream>
    #include <exception>
    #include <cmath>
    #include <GeographicLib/Geocentric.hpp>
    #include <GeographicLib/LocalCartesian.hpp>
    
    #include <iomanip>

    using namespace std;
    using namespace GeographicLib;
    int main() {
        cout<<setiosflags(ios::fixed)<<setiosflags(ios::right)<<setprecision(8); //输出一个右对齐的小数点后两位的浮点数。
      try {
        Geocentric earth(Constants::WGS84_a(), Constants::WGS84_f());
        // Alternatively: const Geocentric& earth = Geocentric::WGS84();
        const double lat0 = 48 + 50/60.0, lon0 = 2 + 20/60.0; // Paris
        LocalCartesian proj(lat0, lon0, 0, earth);
        {
          // Sample forward calculation
          double lat = 50.9, lon = 1.8, h = 0; // Calais
          double x, y, z;
          proj.Forward(lat, lon, h, x, y, z);
          cout << x << " " << y << " " << z << "\n";
        }
        {
          // Sample reverse calculation
          double x = -38e3, y = 230e3, z = -4e3;
          double lat, lon, h;
          proj.Reverse(x, y, z, lat, lon, h);
          cout << lat << " " << lon << " " << h << "\n";
        }
      }
      catch (const exception& e) {
        cerr << "Caught exception: " << e.what() << "\n";
        return 1;
      }
    }

.. code-block:: zsh

    apt-get install libgeographic-dev

    g++ main.cpp `pkg-config --cflags --libs geographiclib`



.. code-block:: cmake

    # CMakeLists.txt

    cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
    project(localCartesian_test LANGUAGES CXX)

    #find_package(PkgConfig REQUIRED)
    include(FindPkgConfig)

    #pkg_search_module(GEOGRAPHICLIB REQUIRED IMPORTED_TARGET geographiclib>=1.49) # 检查包并使用第一个可用包
    pkg_check_modules(GEOGRAPHICLIB REQUIRED IMPORTED_TARGET geographiclib>=1.49)  # 检查所有相应的包


    #include_directories(${GEOGRAPHICLIB_INCLUDE_DIRS})
    include_directories(PkgConfig::GEOGRAPHICLIB)

    add_executable(${PROJECT_NAME} main.cpp)

    #target_link_libraries(${PROJECT_NAME}  ${GEOGRAPHICLIB_LIBRARIES})
    target_link_libraries(${PROJECT_NAME}  PkgConfig::GEOGRAPHICLIB)


-------

* `【C++11】随机值获取——random <https://www.jianshu.com/p/05863a00af8d>`_


* `UTF-8 <http://www.cnblogs.com/chenwenbiao/archive/2011/08/11/2134503.html>`_



::

    UTF-8是一种变长字节编码方式。
    对于某一个字符的UTF-8编码，如果只有一个字节则其最高二进制位为0；
    如果是多字节，其第一个字节从最高位开始，连续的二进制位值为1的个数决定了其编码的位数，
    其余各字节均以10开头。UTF-8最多可用到6个字节。 

    如表： 


    1字节 0xxxxxxx 
    2字节 110xxxxx 10xxxxxx 
    3字节 1110xxxx 10xxxxxx 10xxxxxx 
    4字节 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx 
    5字节 111110xx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 
    6字节 1111110x 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 

    因此UTF-8中可以用来表示字符编码的实际位数最多有31位，即上表中x所表示的位。
    除去那些控制位（每字节开头的10等），这些x表示的位与UNICODE编码是一一对应的，位高低顺序也相同。 
    实际将UNICODE转换为UTF-8编码时应先去除高位0，然后根据所剩编码的位数决定所需最小的UTF-8编码位数。 
    因此那些基本ASCII字符集中的字符（UNICODE兼容ASCII）只需要一个字节的UTF-8编码（7个二进制位）便可以表示

******
gcc   
******

* -Wno-unused-function:  发现不使用的函数不警告

* 全局环境变量（ `C_INCLUDE_PATH` / `CPLUS_INCLUDE_PATH` ）添加自定义的头文件路径
* `-rpath: <https://www.coderclan.cc/198.html>`_  用于指定运行动时态库搜索路径


------------------

**************************************************************
`OpenSSL 编程 <https://openssl-programing.readthedocs.io>`_
**************************************************************