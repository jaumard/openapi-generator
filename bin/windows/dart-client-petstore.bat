set executable=.\modules\swagger-codegen-cli\target\swagger-codegen-cli.jar

If Not Exist %executable% (
  mvn clean package
)

REM set JAVA_OPTS=%JAVA_OPTS% -Xmx1024M -DloggerPath=conf/log4j.properties
set ags=generate -i modules\swagger-codegen\src\test\resources\2_0\petstore.yaml -g dart-jaguar -o samples\client\petstore\dart-jaguar\swagger --additional-properties hideGenerationTimestamp=true,browserClient=false
java %JAVA_OPTS% -jar %executable% %ags%

set ags=generate -i modules\swagger-codegen\src\test\resources\2_0\petstore.yaml -g dart-jaguar -o samples\client\petstore\dart-jaguar\flutter_petstore\swagger --additional-properties hideGenerationTimestamp=true
java %JAVA_OPTS% -jar %executable% %ags%
