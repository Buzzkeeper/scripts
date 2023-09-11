dcp_directory="$1"


# Поиск всех .mxf файлов в DCP-пакете
mxf_files=($(find "$dcp_directory" -type f -name "*.mxf"))



        size1=$(stat -c %s "${mxf_files[0]}")

        size2=$(stat -c %s "${mxf_files[1]}")

#echo "$size1"
#echo "$size2"
if [ "$size1" -gt "$size2" ]; then
    Video="${mxf_files[0]}"
    Audio="${mxf_files[1]}"
else
    Video="${mxf_files[1]}"
    Audio="${mxf_files[0]}"
fi

#echo "Video: $Video"

#echo "Audio: $Audio"    

output_file="$1.mp4"

ffmpeg -i "$Video" -i "$Audio" -c:v libx264 -crf 18 -c:a aac -b:a 192k "$output_file"

