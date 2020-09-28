<template>
	<div class="order">
		<div class="recentOrder"><span class="iconfont">&#xe662;</span>最近的外卖订单</div>
		<div class="empty"></div>
		<div class="border container" v-for="(order,index) in orderList" :key="index">
			<div class="orderdetail">
				<p class="img"><img :src="getImgSrc(order.src)" alt=""></p>
				<div class="body">
					<div class="header">
						<h5 class="title">{{order.s_name}}</h5>
						<span class="status">{{order.status}}</span>
					</div>
					<div style="height: 8px;">
						<p class="date">{{order.date}}</p>
					</div>
					<van-divider :style="{borderColor: '#1989fa'}" />
					<div class="center">
						<span class="count">共计{{order.count}}件商品</span>
						<span class="price">￥{{order.price}}</span>
					</div>
					<div class="msg" v-if="order.status == '未送达'">预计还有{{order.spend|spend}}送达</div>
				</div>
			</div>
			<p id="emty"></p>
		</div>
	</div>
</template>
<script>
	import Vue from 'vue';
	import {
		Divider
	} from 'vant';
	Vue.use(Divider);

	//toast消息提醒
	import {
		Toast
	} from 'vant';

	export default {
		name: 'App-order',
		data() {
			return {
				orderList: []
			}
		},
		methods: {
			getImgSrc(src) {
				return require('../assets/' + src)
			},
		},
		mounted() {
			var login_user = JSON.parse(window.localStorage.getItem('logined_user'));
			var url = 'http://localhost:8080/ele/order/getOrderList.action?user_id=' + login_user.user_id;
			this.$axios.get(url).then(
				res => {
					var orderList = res.data
					if (orderList != null) {
						this.orderList = orderList
					}
				},
				err => {
					console.log(err)
					Toast.fail('响应超时');
				}
			)
		}
	}
</script>

<style scoped>
	.order {
		margin-bottom: 50px;
	}

	.recentOrder {
		background-color: ghostwhite;
		position: fixed;
		margin: auto;
		left: 0;
		right: 0;
		top: 0;
		width: 100%;
		font-style: italic;

	}
	.empty{
		width: 100%;
		height: 40px;
	}

	.img {
		width: 12%;
		float: left;
		margin-right: 5px;
		height: 70px;
	}

	.orderdetail {
		margin-top: 10px;
		width: 100%;
		padding-left: 20px;
		height: 130px;
		border-bottom: .01rem solid #EDEDED;
	}

	.title {
		float: left;
	}

	.header {
		height: 30px;
	}

	.body {
		width: 90%;
	}

	.status {
		font-size: 12px;
		color: #666;
		float: right;
	}

	.date {
		font-size: 10px;
		color: #666;
		float: left;
	}

	.count {
		font-size: 12px;
		float: left;
	}

	.price {
		font-size: 12px;
		float: right;
	}

	.center {
		height: 25px;
	}

	.msg {
		font-size: 12px;
		float: right;
	}

	.border {
		width: 100%;
		height: 150px;
	}

	#emty {
		display: none;
		width: 100%;
		height: 18px;
	}
</style>
