VERSION=$(shell ./mvnw help:evaluate -Dexpression=project.version -q -DforceStdout)
VERSION_LOWERCASE=$(shell echo $(VERSION) | tr '[:upper:]' '[:lower:]')

compile:
	./mvnw clean compile

quick-build:
	./mvnw clean install -Dtest.skip=true

test:
	./mvnw clean test

full-build:
	./mvnw clean install

boot-run:
	./mvnw spring-boot:run -Dtest.skip=true

jar-run:
	java -jar target/k8-external-secrets-aws-secrets-manager-$(VERSION).jar

docker-build:
	docker build --build-arg JAR_FILE=target/k8-external-secrets-aws-secrets-manager-$(VERSION).jar -t colinbut/k8-external-secrets-aws-secrets-manager:$(VERSION_LOWERCASE) .

build-project: full-build docker-build

docker-run:
	docker run -d -p 8080:8080 colinbut/k8-external-secrets-aws-secrets-manager:$(VERSION_LOWERCASE)
