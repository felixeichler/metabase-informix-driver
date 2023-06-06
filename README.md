# metabase-informix-driver
Driver for connecting IBM Informix DB to metabase

Works with IBM Informix Version 12.10

Also needed in the /metabase/plugins/ is the ifxjdbc.jar

https://www.ibm.com/de-de/products/informix/developer-tools

For instructions on how to install the IBM Informix JDBC Driver:

https://www.ibm.com/docs/en/informix-servers/12.10?topic=driver-files-in-informix-jdbc

### IMPORTANT 1
Build with tools.deps/tools.build/Depstar
* IBMinformix Metabase v0.41.0 Driver - tag v.1.2.0

Build with leiningen
* IBMinformix Metabase v0.40 Driver - tag v.1.1.1   
* IBMinformix Metabase v0.37 Driver - tag v.1.0.0 

as of Metabase v0.41.0 building drivers with LEININGEN is deprecated: see Branch built-with-leiningen

## IMPORTANT 2
this is a work in progress; testing is not completed, so errors may occur when querying an Informix DB in metabase. Feedback is welcome.

## HOW TO BUILD 
with tools.deps/tools.build/Depstar (as of Metabase v0.41.0)

### Prereq: Install Metabase locally
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
and put it into the `plugins` directory of the metbase repository.
```
cp jdbc.jar ../metabase/plugins/jdbc.jar
```

TODO: Figure out if we can just add this maven dependency to the `deps.edn` file to auto-download the latest jar and the copy it to the plguins folder?? https://clojure.org/reference/deps_and_cli#_maven 


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

### Build it

```sh
./build.sh
```

will create `target/ibminformix.metabase-driver.jar`. 

### Copy it to your plugins dir, restart Metabase and the driver will show up.

```bash
cp target/ibminformix.metabase-driver.jar ../metabase/plugins/
```

### Restart metabase, watch the logs for any errors, and expect the driver to show up when adding a new datasource
```
cd ../metabase
clojure -M:run
```
