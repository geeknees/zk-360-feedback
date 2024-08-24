import type { HardhatUserConfig } from 'hardhat/config'
import '@nomicfoundation/hardhat-toolbox-viem'
import '@nomicfoundation/hardhat-verify'
import 'dotenv/config'

const config: HardhatUserConfig = {
  solidity: '0.8.24',
  networks: {
    scrollTestnet: {
      url: 'https://sepolia-rpc.scroll.io/', // ScrollのテストネットRPC
      accounts: [process.env.PRIVATE_KEY!] // デプロイに使うアカウントの秘密鍵（.envに設定）
    }
  },
  etherscan: {
    apiKey: process.env.SCROLLSCAN_API_KEY, // Scroll用のAPIキー（.envに設定）
    customChains: [
      {
        network: 'scrollTestnet',
        chainId: 534351,
        urls: {
          apiURL: 'https://api-sepolia.scrollscan.com/api',
          browserURL: 'https://sepolia.scrollscan.com'
        }
      }
    ]
  }
}

export default config
