#!/bin/sh
# Usage is ./scraping_courses.sh COMP

if [ $# -eq 1 ]
then
	# get first character (for input into web page)
	char=${1:0:1}
	# scrape both postgrad/undergraduate course book
	# search for all available courses at UNSW
	courses=`wget -q -O- "http://www.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=$char" "http://www.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=$char" | egrep "$1[0-9]{4}.html\">[^<]+" -o | sed 's/\s$//' |sed 's/.html">/ /g' | sort | uniq`
	echo "$courses"
fi
