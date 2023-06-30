# metabase-informix-driver
Driver for connecting IBM Informix DB to Metabase.  
Works with IBM Informix Version 12.10

## Building
### Prereq: Clone Metabase repository locally
```
cd ..
git clone https://github.com/metabase/metabase.git
```

### Prereq: Install the Clojure CLI

Make sure you have the `clojure` CLI version `1.10.3.933` or newer installed; you can check this with `clojure
--version`. Follow the instructions at https://clojure.org/guides/getting_started if you need to install a
newer version.

### Prereq: Download Informix JDBC Driver jar
Download the jar from: https://mvnrepository.com/artifact/com.ibm.informix/jdbc   
and copy it into the `plugins` directory of the metabase repository.
```
cp jdbc.jar ../metabase/plugins/jdbc.jar
```

TODO: Automate the download of this file, possibly using Maven/deps.edn

### customize /../deps.edn
replace /PATH/TO/ with the correct information
```
  :exec-args  {:driver      :ibminformix
                :project-dir "/PATH/TO/metabase-informix-driver-1.2.0"
                :target-dir  "/PATH/TO/metabase-informix-driver-1.2.0/target"}}}}
```
replace /PATH/TO/ with the correct information and make sure to reference to your Metabase-Version in :extra-deps

```
  {:extra-deps {metabase/metabase-core {:local/root "/PATH/TO/metabase-0.41.0"}
                metabase/build-drivers {:local/root "/PATH/TO/metabase-0.41.0/bin/build-drivers"}}
```

TODO: Automate that

### Build the driver

```sh
./build.sh
```

will create `target/ibminformix.metabase-driver.jar`. 

### Copy it to Metabase's plugins dir

```bash
cp target/ibminformix.metabase-driver.jar ../metabase/plugins/
```

### Restart Metabase, watch the logs for any errors, and expect the driver to show up when adding a new datasource
```
cd ../metabase
clojure -M:run
```

## Build & run in docker
Prereq: Run through all the build steps
```
docker build . -t metabase-with-informix
docker run -d -p 3000:3000 metabase-with-informix
```


## Disclaimer
This is a work in progress; testing is not completed, so errors may occur when querying an Informix DB in Metabase.  
Feedback is welcome.