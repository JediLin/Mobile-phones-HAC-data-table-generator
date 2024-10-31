:start
IF EXIST "mobile-accessibility-phones.xml" (
  del /F /Q mobile-accessibility-phones.bak.xml
  copy /Y mobile-accessibility-phones.xml mobile-accessibility-phones.bak.xml
)

:download
wget --output-document=mobile-accessibility-phones.xml http://gari.info/xml/mobile-accessibility-phones.xml

IF EXIST "mobile-accessibility-phones.xml" (
  GOTO cont
) ELSE (
  GOTO download
)

:cont
perl -i.bak -pe "s|<\?.+\?>|<\?xml version=\"1.0\" encoding=\"UTF-8\"\?>\r<\?xml-stylesheet type=\"text\/xsl\" href=\"mobile-accessibility-phones.xsl\"\?>|;" mobile-accessibility-phones.xml

IF EXIST "mobile-accessibility-phones.xml" (
  del /F /Q mobile-accessibility-phones.xml.bak
  GOTO end
) ELSE (
  copy /Y mobile-accessibility-phones.xml.bak mobile-accessibility-phones.xml
  del /F /Q mobile-accessibility-phones.xml.bak
  GOTO cont
)

:end
del /F /Q /Y *.
exit
