files_to_source=("~/.bash_aliases" "~/.bashrc_prompt")

for file_to_source in ${files_to_source[@]}
do 
    if [ -f "$file_to_source" ];
    then
        source "$file_to_source"
        echo "Loaded $file_to_source"
    else
        echo "File Not Found: $file_to_source"
        # ... additional error handlings
    fi
done=