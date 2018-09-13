while true; do
ffmpeg -re -rtsp_transport tcp -i "rtsp://operator:password@CAMERA_IP/rtsph2641080p" \
       -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 \
       -c:a libmp3lame -ab 128k -ar 44100 \
       -c:v copy -threads 2 -bufsize 512k \
       -maxrate 1M \
       -f flv "rtmp://a.rtmp.youtube.com/live2/UNIQUE_YOUTUBE_KEY"
echo Uh-oh, failed. Restarting!
done
