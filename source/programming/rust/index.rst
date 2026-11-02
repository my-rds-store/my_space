########
Rust
########

**适用版本**：Rust 1.85+（Edition 2024）；旧项目可能仍使用 Edition 2021。

安装
====

.. code-block:: bash

   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   source "$HOME/.cargo/env"
   rustc --version
   cargo --version

Cargo 常用命令
==============

.. code-block:: bash

   cargo new hello
   cd hello
   cargo run
   cargo test
   cargo build --release
   cargo fmt
   cargo clippy

资料
====

* `Rust 官方学习资源 <https://www.rust-lang.org/zh-CN/learn>`_
* `Rust 程序设计语言（中文版） <https://kaisery.github.io/trpl-zh-cn/>`_
* `Rust By Example <https://doc.rust-lang.org/stable/rust-by-example/>`_
* `Rust 编程入门（B 站） <https://www.bilibili.com/video/BV1zQ4y147kN>`_
* `Rust 语言核心原理与实践（豆瓣） <https://book.douban.com/subject/34931557/>`_
* `Cargo 文档 <https://doc.rust-lang.org/cargo/>`_
