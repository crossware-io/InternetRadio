#######################################                                                                                                                                                                    
# INTERNET RADIO BACKEND                                                                                                                                                                                   
#                                                                                                                                                                                                          
# ARGUMENT 0 100 is for volume                                                                                                                                                                             
#                                                                                                                                                                                                          
# ARGUMENT 101 to 104 is for stations                                                                                                                                                                      
#                                                                                                                                                                                                          
# ARGUMENT 200 value is stop/pause                                                                                                                                                                         
######################################                                                                                                                                                                     

function kill_gst()
{

        killall gst-launch-1.0 > /dev/null                                                                                                                                                                 
        killall gst-launch-1.0 > /dev/null                                                                                                                                                                 
        killall gst-launch-1.0 > /dev/null                                                                                                                                                                 
        killall gst-launch-1.0 > /dev/null                                                                                                                                                                 
}

case $1 in
   "101")                                                                                                                                                                                                  
        echo "station 1 selected "                                                                                                                                                                         
        kill_gst                                                                                                                                                                 
        gst-launch-1.0 playbin uri="https://mp3channels.webradio.antenne.de/antenne" &                                                                                                                     
        ;;                                                                                                                                                                                                 
   "102") echo "station 2 selected "                                                                                                                                                                       
        kill_gst                                                                                                                                                                 
        gst-launch-1.0 playbin uri="http://stream.live.vc.bbcmedia.co.uk/bbc_radio_one"  &                                                                                                                 
        ;;                                                                                                                                                                                                 
   "103") echo "station 2 selected "                                                                                                                                                                       
        kill_gst                                                                                                                                                                 
        gst-launch-1.0 playbin uri="http://stream.live.vc.bbcmedia.co.uk/bbc_radio_one"  &                                                                                                                 
        ;;                                                                                                                                                                                                 
   "104") echo "station 2 selected "                                                                                                                                                                       
        kill_gst                                                                                                                                                                 
        gst-launch-1.0 playbin uri="https://mp3channels.webradio.antenne.de/antenne" &                                                                                                                     
        ;;                                                                                                                                                                                                 
   "500") echo "stop/paue the radio "                                                                                                        
        kill_gst                                                                                                                                                                 
     ;;                                                                                                                                                                                                    
    *) echo "set volume to $1"
       amixer \set Headphone $1
     ;;
esac 
