create:
	@echo "==> Creating deployment"
	@kubectl create -f app.yaml

destroy:
	@echo "==> Destroying deployment"
	@kubectl delete pvc --all --grace-period=0 --force
	@kubectl delete pods --all --grace-period=0 --force
	@kubectl delete -f app.yaml
	@kubectl delete pvc -l app=tm

.PHONY: create destroy
