#########################################################################
# File Name: ToAnalyseXhup.sh
# Author: Kent Lee
# mail: kent1411390610@gmail.com
# Created Time: Sat May 26 04:11:31 2018
#########################################################################
#!/bin/bash

if [ $# != 1 ];
then
	echo -e "\033[31m  Usage: ./ToAnalyseXhup.sh fileInput \033[0m" 
	exit 1
fi

#输入文件
file=$1	
if [ ! -f "$file" ];
then
	echo "输入词库文件不存在，请重新输入"
	exit 1	#失败退出
fi


#删除多余注释行，并创建暂存文件
sed -n '/^啊/,$p' $file >/tmp/xhupdictWithNoComment
cut -f2 /tmp/xhupdictWithNoComment>/tmp/xhupdictEncoding
rm /tmp/xhupdictWithNoComment

fileEncoding=/tmp/xhupdictEncoding
lineCount=$( wc -l $fileEncoding )	#记录文件行数
characterCount=( 0 )

for i in $( seq 1 26 )
do
	characterCount[$i]=0	#初始化记录字符的数组
done
nowLine=0

while read line
do	
	nowLine=`expr $nowLine + 1`
	echo -e "\033[34m 	当前遍历行号为：$nowLine \033[0m" 
	lineLength=` echo "$line"|awk '{print length($0)}' `	#统计一行字符串的长度
	#echo " before lineLength: $lineLength"
	lineLength=`expr $lineLength - 2`	#两个字符不需要处理 \t和 结束符
	i=0

	for i in $( seq 0 $lineLength )
	do
		character=${line:i:1}	#`expr substr $line $i 1` #分离一个字符
		#echo "character: $character"
		case $character in 
			a)
				characterCount[1]=`expr ${characterCount[1]} + 1`
				;;
			b)
				characterCount[2]=`expr ${characterCount[2]} + 1`
				;;
			c)	
				characterCount[3]=`expr ${characterCount[3]} + 1`
				;;
			d)
				characterCount[4]=`expr ${characterCount[4]} + 1`
				;;
			e)
				characterCount[5]=`expr ${characterCount[5]} + 1`
				;;
			f)
			 	characterCount[6]=`expr ${characterCount[6]} + 1`
				;;
			g)
				characterCount[7]=`expr ${characterCount[7]} + 1`
				;;
			h)
				characterCount[8]=`expr ${characterCount[8]} + 1`
				;;
			i)
				characterCount[9]=`expr ${characterCount[9]} + 1`
				;;
			j)
				characterCount[10]=`expr ${characterCount[10]} + 1`
				;;
			k)
				characterCount[11]=`expr ${characterCount[11]} + 1`
				;;
			l)
				characterCount[12]=`expr ${characterCount[12]} + 1`
				;;
			m)
				characterCount[13]=`expr ${characterCount[13]} + 1`
				;;
			n)
				characterCount[14]=`expr ${characterCount[14]} + 1`
				;;
			o)
				characterCount[15]=`expr ${characterCount[15]} + 1`
				;;
			p)
				characterCount[16]=`expr ${characterCount[16]} + 1`
				;;
			q)
				characterCount[17]=`expr ${characterCount[17]} + 1`
				;;
			r)
				characterCount[18]=`expr ${characterCount[18]} + 1`
				;;
			s)
				characterCount[19]=`expr ${characterCount[19]} + 1`
				;;
			t)
				characterCount[20]=`expr ${characterCount[20]} + 1`
				;;
			u)
				characterCount[21]=`expr ${characterCount[21]} + 1`
				;;
			v)
				characterCount[22]=`expr ${characterCount[22]} + 1`
				;;
			w)
				characterCount[23]=`expr ${characterCount[23]} + 1`
				;;
			x)
				characterCount[24]=`expr ${characterCount[24]} + 1`
				;;
			y)
				characterCount[25]=`expr ${characterCount[25]} + 1`
				;;
			z)
				characterCount[26]=`expr ${characterCount[26]} + 1`
				;;
		esac
	done

	
done<$fileEncoding
echo ${characterCount[*]}  
