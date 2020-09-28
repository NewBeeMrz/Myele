<template>
	<div class="storedetail">
		<header>
			<span class="iconfont" @click="back()">&#xe6da;</span>
			<img :src="store.src ? require(`../assets/${store.src}`) : ''" alt="">
		</header>
		<div class="inf">
			<h2>
				{{store.s_name}}
				<span v-if="!collected" class="iconfont" @click="collect()">&#xe647;</span>
				<span v-if="collected" class="iconfont" @click="collect()">&#xe61b;</span>
			</h2>
			<p class="details">评价{{store.grade}} <span>月售{{store.sale}}单 </span>蜂鸟专送 {{store.spend}}</p>
		</div>
		<p class="active">
			<span class="activInf otherWord">减</span>
			<span class="activInf otherActivity">{{store.activityA}} | {{store.activityB}}</span>
			<span class="iconfont r activInf">2个优惠</span>
		</p>
		<ul class="link">
			<li :class="{activeLink:show=='orderFood'}" @click="changeContent()">
				点餐
			</li>
			<li :class="{activeLink:show=='comment'}" @click="changeContent()">
				评价
			</li>
		</ul>
		<p id="emty"></p>
		<div v-if="show=='orderFood'">
			<div class="foodList">
				<div class="foodsdetail" v-for="(food,index) in store.foodList" :key="index">
					<img :src="store.src ? require(`../assets/${store.src}`) : ''" alt="">
					<h4>{{food.f_name}}</h4>
					<p class="sale">月售{{food.sale}}份</p>
					<div>
						<p class="fDiscount"><span>优惠价</span> ￥{{food.price}}</p>
						<div class="stepper">
							<button class="minus" id="brands_button" :disabled="minflag[index]" @click="minusNum(index)">
								<span class="glyphicon">-</span>
							</button>
							<span id="countnum">{{food.num}}</span>
							<button class="plus" id="brands_button" :disabled="maxflag[index]" @click="addNum(index)">
								<span class="glyphicon">+</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<van-submit-bar :price="total" button-text="去支付" button-type="info" @submit="onSubmit" />
		</div>
		<div v-if="show=='comment'">
			<div style="margin-bottom: 10px;">
				<textarea v-model="content" class="comment" rows="4" cols="40" placeholder="请发表对该店铺的评价"></textarea>
				<van-button round type="info" size="small" style="margin-left: 65%;" @click="newComment()">评论</van-button>
			</div>
			<van-panel v-for="(comment,index) in commentList" :key="index" :title="comment.userName" :desc="comment.time" style="text-align: left;">
				<p style="margin-left: 4%;">{{comment.content}}</p>
			</van-panel>

		</div>
	</div>
</template>

<script>
	import Vue from 'vue';
	//toast消息提醒
	import {
		Toast
	} from 'vant';

	//标签栏
	import {
		Tab,
		Tabs
	} from 'vant';
	Vue.use(Tab);
	Vue.use(Tabs);

	import {
		SubmitBar
	} from 'vant';
	Vue.use(SubmitBar);

	//面板
	import {
		Panel
	} from 'vant';
	Vue.use(Panel);
	
	import { Notify } from 'vant';
	Vue.use(Notify);
	
	import { Dialog } from 'vant';

	import bus from '../bus.js'
	export default {
		name: 'App-storedetail',
		data() {
			return {
				store: [],
				s_id: 0,
				show: 'orderFood',
				minflag: [],
				maxflag: [],
				total: 0,
				numtotal: 0,
				collected: false,
				c_id: 0,
				commentList: [],
				content: ''
			}
		},
		methods: {
			back() {
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
								name: 'store'
							})
						}

					},
					err => {
						console.log(err)
						Toast.fail('跳转失败请重试');
					}
				)
			},
			changeContent() {
				if (this.show == 'orderFood') {
					this.show = 'comment';
					var url = 'http://localhost:8080/ele/comment/getAllComment.action';
					this.$axios.get(url).then(
						res => {
							var commentList = res.data
							if (commentList != null) {
								this.commentList = commentList
							}
						},
						err => {
							console.log(err)
							Toast.fail('请求失败请重试');
						}
					)

				} else {
					this.show = 'orderFood';
				}
			},
			addNum(val) {
				if (this.store.foodList[val].num == 0) {
					this.minflag[val] = false
				}
				this.store.foodList[val].num++;
				this.numtotal++;

				if (this.store.foodList[val].num >= 99) {
					this.maxflag[val] = true
				}
			},
			minusNum(val) {
				if (this.store.foodList[val].num == 99) {
					this.maxflag[val] = false
				}
				this.store.foodList[val].num--
				if (this.store.foodList[val].num <= 0) {
					this.minflag[val] = true
				}
				this.numtotal--;
			},
			collect() {
				var login_user = JSON.parse(window.localStorage.getItem('logined_user'));
				if (!this.collected) {
					var url = 'http://localhost:8080/ele/collect/collected.action?user_id=' + login_user.user_id + '&s_id=' + this.s_id;
					this.$axios.get(url).then(
						res => {
							var rows = res.data
							if (rows > 0) {
								setTimeout(() => {
									this.collected = true
								}, 100)
								Toast.success('收藏成功')
							}
						},
						err => {
							console.log(err)
							Toast.fail('收藏失败请重试');
						}
					)
				} else {
					var url3 = 'http://localhost:8080/ele/collect/cancelCollect.action?c_id=' + this.c_id;
					this.$axios.get(url3).then(
						res => {
							var rows = res.data
							if (rows > 0) {
								setTimeout(() => {
									this.collected = false
								}, 100)
								Toast.success('取消收藏成功')
							}
						},
						err => {
							console.log(err)
							Toast.fail('取消收藏失败请重试');
						}
					)
				}
			},
			newComment() {
				var login_user = JSON.parse(window.localStorage.getItem('logined_user'));
				var url = 'http://localhost:8080/ele/comment/newComment.action?userName=' + login_user.user_name + '&content=' +
					this.content;
				this.$axios.get(url).then(
					res => {
						var rows = res.data
						if (rows > 0) {
							Toast.success('评论成功')
							window.location.reload()
						}
					},
					err => {
						console.log(err)
						Toast.fail('评论失败请重试');
					}
				)
			},
			onSubmit() {
				if(this.numtotal <= 0){
					Notify({ type: 'warning', message: '您还未选择商品' });
				}else{
					Dialog.confirm({
							title: '警告',
							message: '您确定要下单吗？',
						})
						.then(() => {
							// on confirm
							var login_user = JSON.parse(window.localStorage.getItem('logined_user'));
							var url = 'http://localhost:8080/ele/order/createOrder.action?user_id=' + login_user.user_id + '&store_id=' +
								this.s_id + '&price=' + this.total/100 + '&count=' + this.numtotal;
							this.$axios.get(url).then(
								res => {
									var rows = res.data
									if (rows > 0) {
										Toast.success('下单成功')
										this.$router.push({
											name:'order'
										})
									}
								},
								err => {
									console.log(err)
									Toast.fail('响应超时');
								}
							)
						})
						.catch(() => {
							// on cancel
						});
				}
			}
		},
		watch: {
			numtotal: function() {
				this.total = 0;
				for (var i = 0; i < this.store.foodList.length; ++i) {
					this.total += this.store.foodList[i].price * this.store.foodList[i].num
				}
				this.total *= 100
			},
			//监测collected的变化
			collected: function() {
				var login_user = JSON.parse(window.localStorage.getItem('logined_user'));
				//收藏后获取c_id
				var url2 = 'http://localhost:8080/ele/collect/getCollectbyID.action?user_id=' + login_user.user_id + '&s_id=' +
					this.s_id;
				this.$axios.get(url2).then(
					res => {
						var collect = res.data
						if (collect.c_id > 0) {
							setTimeout(() => {
								this.c_id = collect.c_id
							}, 100)
						}
					},
					err => {
						console.log(err)
						Toast.fail('请求失败请重试');
					}
				)
			}
		},
		created() {
			this.collected = false
			this.c_id = 0
			this.s_id = this.$route.query.s_id
			var url = 'http://localhost:8080/ele/store/getStorebyID.action?s_id=' + this.s_id;
			this.$axios.get(url).then(
				res => {
					var store = res.data
					if (store != null) {
						this.store = store
						for (var i = 0; i < this.store.foodList.length; ++i) {
							this.minflag[i] = true
							this.maxflag[i] = false
						}
					}

				},
				err => {
					console.log(err)
					Toast.fail('请求失败请重试');
				}
			)

			var login_user = JSON.parse(window.localStorage.getItem('logined_user'));
			var url2 = 'http://localhost:8080/ele/collect/getCollectbyID.action?user_id=' + login_user.user_id + '&s_id=' + this
				.$route.query.s_id;
			this.$axios.get(url2).then(
				res => {
					var collect = res.data
					if (collect.c_id > 0) {
						this.collected = true
						this.c_id = collect.c_id
					}

				},
				err => {
					console.log(err)
					Toast.fail('请求失败请重试');
				}
			)
		}
	}
</script>

<style scoped>
	header {
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		-o-box-sizing: border-box;
		box-sizing: border-box;
		padding: 5px, 0.12rem, 0, 0.12rem;
		width: 100%;
		background-size: 100%;
		background-image: url(../../data/img/store/store01.jpg);
		text-align: left;
	}

	header span {
		color: white;
		font-size: 20px;
		padding: 5px;
		margin: 5px;
	}

	header img {
		width: 21%;
		display: block;
		position: relative;
		left: 50%;
		bottom: -15px;
		transform: translateX(-50%);
	}

	.inf {
		text-align: center;
		margin-top: 30px;
	}

	.details {
		font-size: 10px;
	}

	.active {
		width: 100%;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		-o-box-sizing: border-box;
		box-sizing: border-box;
		padding: 0, 0.36rem, 0, 0.36rem;
	}

	.activInf {
		font-size: .12rem;
		color: #999;
	}

	.otherWord {
		color: white;
		background-color: #F07373FF;
		padding: 0 .02rem;
		margin-right: .03rem;
	}

	.otherActivity {
		display: inline-block;
		position: relative;
		top: 5px;
		width: 70%;
		overflow: hidden;
		-ms-text-overflow: ellipsis;
		text-overflow: ellipsis;
		white-space: nowrap;
		color: #666;
	}

	.link {
		width: 100%;
		text-align: center;

		overflow: hidden;
		padding: 10px 0;
		z-index: 99;

	}

	.link .activeLink::after {
		display: block;
		content: '';
		width: 32px;
		height: 2.2px;
		background-color: #00A9FF;
		position: absolute;
		bottom: -8px;
		left: calc(50% - 16px);
	}

	.link li {
		width: 50%;
		font-size: 10px;
		font-weight: 400;
		color: #666;
		float: left;
		position: relative;
	}

	.link .activeLink {
		color: #333;
		font-weight: 600;
	}

	#emty {
		display: none;
		width: 100%;
		height: 18px;
	}

	.foodsdetail {
		height: 90px;
	}

	.foodsdetail img {
		width: 21%;
		display: block;
		position: relative;
		float: left;
		margin-right: 10px;
	}

	.foodsdetail h4 {
		text-align: left;
	}

	.sale {
		font-size: 5px;
		text-align: left;
		color: #666;
	}

	.fDiscount {
		width: 50%;
		float: left;
		text-align: left;
		color: rgb(255, 83, 57);
		font-size: 10px;
	}

	.fDiscount span {
		font-size: 0.12rem;
		border: .133333vw solid hsla(8, 79%, 62%, .3);
		color: rgb(255, 83, 57);
	}

	.minus {
		width: 20px;
		height: 20px;
		text-align: center;
		font-size: 10px;
		line-height: 1.428571429;
		border-radius: 15px;
		float: left;
		margin-left: 15px;
		background-color: #00A9FF;
		border: 1px solid #d5d5d5;
	}

	.plus {
		width: 20px;
		height: 20px;
		text-align: center;
		font-size: 10px;
		line-height: 1.428571429;
		border-radius: 15px;
		float: right;
		margin-right: 15px;
		background-color: #00A9FF;
		border: 1px solid #d5d5d5;
	}

	.foodList {
		margin-bottom: 40px;
	}

	.comment {
		resize: none;
		border-radius: 5px;
		padding: 10px
	}
</style>
