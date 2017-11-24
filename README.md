Exporter postgresql for Prometheus and Grafana

How to use:

* Launch install.sh with default parameters. If you want, you can edit the paramaters for adjusted your DB.
```
sh install.sh 
```

* If you have a DB, then you can start this process.
		Exec the makefile with set-app, before change the parameters of your db.
```
make set-app
```
In this part, you can change the name of the Service, DeploymentConfig and Build. This features are in application-template-dockerbuild.yaml

* Start build in Openshift.
* There is a Template for Grafana with querys of name to DeployConfig, this case, postgres-exporter-dev3.