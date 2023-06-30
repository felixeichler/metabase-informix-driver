FROM metabase/metabase

COPY jdbc.jar ./plugins/jdbc.jar
COPY target/ibminformix.metabase-driver.jar ./plugins/

