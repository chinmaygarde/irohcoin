# Run Solidity and Typescript tests.
test:
    @npx hardhat test

# Build all Solidity contracts.
build: deps
    @npx hardhat build

# Install dependencies.
deps:
    @npm install
    @uv sync

# Deploy to the local in-memory testnet.
deploy: test
    @npx hardhat ignition deploy ignition/modules/Iroh.ts

# Deploy to the Hoodi testnet. Requires credentials.
deploy_hoodi: deploy
    @npx hardhat ignition deploy ignition/modules/Iroh.ts --verify --network hoodi

# Deploy to the mainnet (Chain 1). Requires credentials.
deploy_mainnet: deploy
    @npx hardhat ignition deploy ignition/modules/Iroh.ts --verify --network mainnet
