FROM kauplan/review2.5:latest

LABEL "com.github.actions.name"="Re:VIEW PDF Generator"
LABEL "com.github.actions.description"="builds PDF from Re:VIEW repository and uploads as Artifacts"
LABEL "com.github.actions.icon"="book"
LABEL "com.github.actions.color"="orange"

ADD entrypoint.sh /entrypoint.sh
ADD copy_build_file.rb /copy_build_file.rb
ENTRYPOINT ["/entrypoint.sh"]