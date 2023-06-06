# switch to the local checkout of the Metabase repo
cd ../metabase

# get absolute path to the driver project directory
DRIVER_PATH=`readlink -f ../metabase-informix-driver/`

# Build driver. See explanation below
clojure \
  -Sdeps "{:aliases {:ibminformix {:extra-deps {com.metabase/ibminformix-driver {:local/root \"$DRIVER_PATH\"}}}}}"  \
  -X:build:ibminformix \
  build-drivers.build-driver/build-driver! \
  "{:driver :ibminformix, :project-dir \"$DRIVER_PATH\", :target-dir \"$DRIVER_PATH/target\"}"