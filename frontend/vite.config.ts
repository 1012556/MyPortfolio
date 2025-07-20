import { defineConfig } from 'vite'

export default defineConfig({
  server: {
    port: 3000,
    proxy: {
      '/api': {
        target: 'https://localhost:7001',
        changeOrigin: true,
        secure: false
      }
    }
  },
  build: {
    outDir: '../MyWebsite/wwwroot',
    emptyOutDir: true
  }
})
