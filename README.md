# Performance test framework in Ruby
This framework shows you how to write performance test in Ruby and generate jmx file, run test with Jmeter or with Flood.io.

## Set up
You need to install Jmeter and the ruby gem [ruby-jmeter](https://github.com/flood-io/ruby-jmeter):
```sh
brew install jmeter
```
```sh
gem install ruby-jmeter
```

## Run tests
Generate the jmx file:
```sh
bin/cli jmx pet-signup
```
Run the test in Jmeter non-GUI mode:
```sh
bin/cli jmeter pet-signup
```
To run it in Jmeter GUI mode simply import the file to Jmeter, hit the "Run" button and you can see the real time request details in the "result" tab.

Note that Jmeter can only handle from 300-1000 threads depending on your script on each machine. <br />
If you want to run with more threads then either run with several machines, or [increase Java heap size](https://stackoverflow.com/questions/2286750/jmeter-outofmemoryerror).<br />

If you have subscribed to Flood.io plan then you can save FLOOD_API_TOKEN tp your env and do:
```sh
bin/cli flood pet-signup
```

You can also use airprsr to pass in test duration, concurrency users and ramp up time. grid_instances and project name can also be passed when running with Flood. Different tests having different defaults so only pass via airprsr when you want to run with different values. e.g to run with 100 concurrent users with 2 grids in 60 seconds:
```sh
bin/cli flood pet-signup -d 60 -c 100 -g 2
```
For more details on usage:
```sh
bin/cli -h
```

## See the report
If you ran it locally, generate report and then see the index page in the browser
```sh
jmeter -g pet-signup.jtl -o report
```
If you ran it in Jmeter and used default_report in your code, then just check the report tabs in Jmeter GUI.
If you ran it in Flood then simply check the reports in the dashboard.
