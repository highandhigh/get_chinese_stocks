# get_chinese_stocks
Download stock prices, from netease.

网易数据源比较稳定，用来补充 quantmod 中 yahoo 数据源不能直接获取的问题(已被墙，需vpn)，以及数据准确性问题（复权）。

# 目标

从网易获取数据后直接转为 quantmod 中的 OHLC 对象更为方便；最后将其整合为 package 便于函数的载入和调用。
