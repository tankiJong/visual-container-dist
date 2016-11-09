ui:
	docker build -t daocloud.io/alphabeta_com/vg-ui .

release:
	docker push daocloud.io/alphabeta_com/vg-ui
