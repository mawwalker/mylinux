#!/bin/bash                                                                                                                                                    
# ~/.config/polybar/script/time.sh脚本内容                                                                                                       
weeknum=$(date +'%u')                                                                                                                                          
weekday="-"                                                                                                                                                    
case "$weeknum" in                                                                                                                                             
    "1")                                                                                                                                                       
       weekday="一"                                                                                                                                            
       ;;                                                                                                                                                      
    "2")                                                                                                                                                       
        weekday="二"                                                                                                                                           
        ;;                                                                                                                                                     
    "3")                                                                                                                                                       
        weekday="三"                                                                                                                                           
        ;;                                                                                                                                                     
    "4")                                                                                                                                                       
        weekday="四"                                                                                                                                           
        ;;                                                                                                                                                     
    "5")                                                                                                                                                       
        weekday="五"                                                                                                                                           
        ;;                                                                                                                                                     
    "6")                                                                                                                                                       
        weekday="六"                                                                                                                                           
        ;;                                                                                                                                                     
    "7")                                                                                                                                                       
        weekday="日"                                                                                                                                           
        ;;                                                                                                                                                     
    *)                                                                                                                                                         
        ;;                                                                                                                                                     
esac                                                                                                                                                           
echo "$(date +'%m-%d %H:%M') 周$weekday"
