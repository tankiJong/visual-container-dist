ui:
	docker build -t daocloud.io/realityone/vg-ui .

release:
	docker push daocloud.io/realityone/vg-ui