#!/bin/bash

#----------------参数解析----------------#
#第一个参数：每次查询的间隔
#第二个参数：查询的主键
#第三个参数：截取的个数
#----------------------------------------#

#----------------输出定向----------------#
#将结果重定向到test.txt文件中
#----------------------------------------#


#--------------第一个参数----------------#
echo "请输入截取次数"
read time
#----------------------------------------#

#--------------第二个参数----------------#
echo "请输入查询间隔(/s)>"
read limit
#----------------------------------------#

#--------------第三个参数----------------#
echo "参考列表"
echo "3:CPU占用率"
echo "4:内存占用大小"
echo "5:虚拟内存占用大小"
echo "6:实际内存占用大小"
echo "请输入查询主键>"
read pri_key
#----------------------------------------#

#--------------第四个参数----------------#
echo "请输入截取个数>"
read count
#----------------------------------------#

function DynamicGetTop()
{
          while((time))
                    do
                                      echo "working......"$time
                                                      sleep $2s
                                                              echo "------------------------------------------">>test.txt
                                                                              ps -auxf | sort -nr -k $3 | head -$4 >> test.txt
                                                                                              ((time--))
                                                                                                      done

}

