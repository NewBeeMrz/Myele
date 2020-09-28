<template>
	<div>
		<van-nav-bar style="background: deepskyblue;">
			<template #title>
				<span style="font-size: 1.5625rem;color: white;font-style:oblique">Elem</span>
			</template>
		</van-nav-bar>
		<ul class="top">
			<li class="l goldMall">
				<h3 class="title">金币商城</h3>
				<p>0元好物在这里</p>
				<img class="r" src="../assets/img/find/find01.webp" alt="">
			</li>
			<li class="r around">
				<div class="infL l">
					<h3 class="title">周边优惠</h3>
					<p>领取口碑好券</p>
				</div>
				<img class="r" src="../assets/img/find/find03.webp" alt="">
			</li>
		</ul>

		<section class="recommend">
			<h3>
				—
				<span class="iconfont good">&#xe67c;</span>
				为你推荐 —
			</h3>
			<p>你的口味，我都懂得</p>
			<p class="moreLook" @click="toMore()">查看更多></p>
		</section>
		<section class="gif">
			<h3>
				—
				<span class="iconfont clock">&#xe6e7;</span>
				限时好礼 —
			</h3>
			<p>金币换豪礼</p>
			<p class="moreLook" @click="toMore()">查看更多></p>
		</section>
	</div>
</template>

<script>
	import Vue from 'vue';
	//Navbar
	import {
		NavBar
	} from 'vant';

	Vue.use(NavBar);
	//toast消息提醒
	import {
		Toast
	} from 'vant';
	//引入数据中转站
	import bus from '../bus.js';
	export default {
		name: 'App-find',
		methods:{
			toMore(){
				var url = 'http://localhost:8080/ele/store/getStoreList.action';
				this.$axios.get(url).then(
					res => {
						var storeList = res.data
						if (storeList != null) {
							setTimeout(() => {
								//兄弟组件通讯
								bus.$emit('storeList', storeList)
							}, 200)
							//链式导航跳转
							this.$router.push({
								name: 'findmore'
							})
						}
				
					},
					err => {
						console.log(err)
						Toast.fail('跳转失败请重试');
					}
				)
			}
		}
	}
</script>

<style scoped>
	div {
		width: 100%;
	}

	.top {
		border-bottom: 12px solid #F5F5F5FF;
		overflow: hidden;
		margin-top: 50px;

		.title {
			font-size: 0.16rem;
			padding-bottom: 6px;
		}

		li {
			width: 50%;
		}

		li p {
			font-size: 0.12rem;
			color: #F5F5F5FF;
		}

		.goldMall {
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			-o-box-sizing: border-box;
			box-sizing: border-box;
			padding: 20px, 0, 12px, 0.15rem;
			border-right: 1px solid #ededed;
		}

		.goldMall h3 {
			color: rgb(255, 153, 0);
		}

		.goldMall img {
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			-o-box-sizing: border-box;
			box-sizing: border-box;
			padding: 25px, 0.15rem, 0, 0;
			width: 50%;
		}

		.infL {
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			-o-box-sizing: border-box;
			box-sizing: border-box;
			padding: 20px, 0.15rem, 14px, 0.15rem;
			width: 65%;
		}

		.recomGif,
		.around {
			img {
				-webkit-box-sizing: border-box;
				-moz-box-sizing: border-box;
				-o-box-sizing: border-box;
				box-sizing: border-box;
				padding: 20px, 0.15rem, 14px, 0;
				width: 35%;
			}
		}

		.recomGif {
			border-bottom: 1px solid #ededed;

			h3 {
				color: rgb(27, 169, 225);
			}
		}

		.around h3 {
			color: rgb(237, 102, 96);
		}
	}

	.recommend {
		overflow: hidden;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		-o-box-sizing: border-box;
		box-sizing: border-box;
		padding: 20px, 0.07rem, 20px, 0.07rem;

		h3,
		p {
			width: 100%;
			text-align: center;
		}

		h3 {
			font-size: 0.18rem;
		}

		p {
			font-size: 0.1rem;
			color: #999;
		}

		.good {
			color: #F14C1AFF;
			font-size: 0.18rem;
			font-weight: normal;
		}
	}

	.cont {
		overflow: hidden;
		width: 100%;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		-o-box-sizing: border-box;
		box-sizing: border-box;
		padding: 10px, 0.05rem, 20px, 0.05rem;

		li {
			margin: 5px 0.05rem;
			width: calc(50% - 0.1rem - 2px);
			border: 1px solid #eee;
			float: left;

			img {
				width: 100%;
			}

			h3,
			p {
				padding-left: 0.1rem;
				text-align: left;
			}

			h3 {
				font-size: 0.14rem;
			}

			p {
				font-size: 0.12rem;
				line-height: 1.5;
			}

			.price {
				font-size: 0.13rem;
				color: #ff6000;
				font-weight: 800;
				padding-bottom: 3px;
			}

			.store {
				width: 100%;
				-webkit-box-sizing: border-box;
				-moz-box-sizing: border-box;
				-o-box-sizing: border-box;
				box-sizing: border-box;
				padding: 6px, 0.1rem, 6px, 0.1rem;
				border-top: 1px dotted #999;
				color: #999;
				font-size: 0.12rem;

				.iconfont {
					font-size: .14rem;
					color: #999;
				}
			}
		}

		.moreLook {
			font-size: .12rem;
			color: #999;
			width: 100%;
			text-align: center;
			margin-top: 20px;
			border: none;
		}
	}

	.gif .clock {
		font-size: 0.16rem;
		color: #F14C1AFF;
		position: relative;
	}

	.gif {
		width: 100%;
		padding: 20px 0;
		overflow: hidden;
		border-top: 12px solid #F5F5F5FF;
		border-bottom: 22px solid #F5F5F5FF;

		>h3,
		>p {
			text-align: center;
			width: 100%;
		}

		h3 {
			font-size: 0.18rem;
			color: $fontTColor;
		}

		>p {
			font-size: 0.12rem;
			color: #999;
		}

		.gifBox {
			width: calc(100% - 0.28rem);
			margin: 22px 0.14rem;
			overflow: hidden;

			li {
				width: 33.3%;
				float: left;
				text-align: left;

				.label {
					font-size: .12rem;
					color: white;
					width: 44%;
					padding: .03rem;
					background-color: #413d3c;
				}

				img {
					width: 100%;
				}

				.price {
					color: #ff6000;
					font-size: .14rem;
				}

				.inf {
					font-size: .14rem;
					color: #333;
					line-height: 2.5;
				}

				.delPrice {
					font-size: .12rem;
					color: #999;
				}
			}
		}
	}

	.iconfont {
		font-size: 1.125rem;
	}
</style>
