.PHONY: build test

test:
	@npx hardhat test

build:
	@npx hardhat build

deploy: test
	@npx hardhat ignition deploy ignition/modules/Iroh.ts

deploy_hoodi: deploy
	@npx hardhat ignition deploy ignition/modules/Iroh.ts --network hoodi

deploy_mainnet: deploy
	@npx hardhat ignition deploy ignition/modules/Iroh.ts --network mainnet
