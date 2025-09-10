# Hardhat Live Trades – Windows Quick Start

## Environment Setup

1. Copy `.env.example` to `.env` and fill in all keys.
   - **Never share your `.env` or private keys publicly!**

2. Install dependencies:
   ```
   setup.bat
   ```

## Local Development and Testing

3. Compile contracts:
   ```
   npx hardhat compile
   ```

4. Run all tests (mandatory before trading!):
   ```
   npx hardhat test
   ```

5. Deploy and execute trades locally (simulate logic):
   ```
   npx hardhat run scripts/deploy-and-trade.js --network localhost
   ```

6. For testnet/mainnet (e.g., Goerli):
   ```
   npx hardhat run scripts/deploy-and-trade.js --network goerli
   ```
   - Replace `goerli` with your desired network.

## Environment Variables

Set these in your `.env`:
```
DEPLOYER_PRIVATE_KEY=
ALCHEMY_API_KEY=
INFURA_API_KEY=
ETHERSCAN_API_KEY=
AUTO_FILL_LIVE_TRADES=true
MIN_PROFIT_THRESHOLD=2
MAX_SLIPPAGE=1.5
```

## CI/CD Deployment Flow (GitHub Actions)

1. **Push to GitHub**  
   Triggers automatic tests, deployment, and trade execution across all configured networks.
2. **Monitor CI logs**  
   Review trade execution, deployment status, and alerts.
3. **Always test on testnets before mainnet!**

## Flowchart

```
flowchart TD
    A[Admin Push Code to GitHub] --> B[CI Workflow Triggered]
    B --> C[Compile Contracts]
    C --> D[Test Suite Execution]
    D -->|Pass| E[Deploy Contracts Multi-Network]
    D -->|Fail| F[Stop Deployment / Alert Admin]
    E --> G[Verify Contracts on Etherscan / Scanners]
    G --> H[Fetch Live Token & Router Addresses]
    H --> I[Query Live DEX Prices]
    I --> J{Price Spread >= MIN_PROFIT_THRESHOLD & Slippage <= MAX_SLIPPAGE?}
    J -->|Yes| K[Execute Real Token Swap]
    J -->|No| L[Skip Trade]
    K --> M[Log Transaction & Results]
    L --> M[Log No Trade Executed]
    M --> N[Admin Reviews CI Logs / Deployment Status]
```

