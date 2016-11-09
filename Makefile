ui:
	docker build -t daocloud.io/alphabeta_com/vg-ui .

release: ui
	docker push daocloud.io/alphabeta_com/vg-ui
