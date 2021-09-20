function prescode --argument-names 'filename'
   if test -n "$filename" 
      pygmentize -f rtf $filename | xclip -t text/rtf -selection clipboard
   else
      echo "Please provide a file to pygmentize"
      echo "Usage: prescode FILENAME"
      echo "Description: this command will read from FILENAME and pygmentize its contents, after which the result is copied into the clipboard as text/rtf"
   end
end
