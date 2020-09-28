const express = require('express')
const webpack = require('webpack')
const app = express()
var appData = require('./data/test.json') //本地数据json数据
var apiRoutes = express.Router();
app.use('/api', apiRoutes)
module.exports = {
	publicPath: './',
	productionSourceMap: false,
	devServer: {
		before(app) {
			http: //localhost:8080/test
				app.get('/test', (req, res) => {
					res.json({
						data: appData
					})
				})
		},
		/* 代理 */
		proxy: {
			'/api': {
				//target: "http://172.24.10.175",
				target: "http://localhost:8080",
				changeOrigin: true,
				pathRewrite: { //重写路径 比如'/api/aaa/ccc'重写为'/aaa/ccc'
					'^/api': ''
				}

			},


		},
	},
}
