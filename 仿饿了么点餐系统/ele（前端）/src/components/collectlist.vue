<template>
	<div class="collectList">
		<van-nav-bar title="关注的店铺" left-text="返回" left-arrow @click-left="onClickLeft" />
		<img class="title" src="../assets/img/loginRegister/pic01.png" alt="">
		<div class="storeInf" v-for="(store,index) in storeList" :key="index" @click="toDetail(store.s_id)">
			<van-swipe-cell>
				<p class="img"><img :src="getImgSrc(store.src)" alt=""></p>
				<div class="content">
					<span class="storeName">{{store.s_name}}</span>
					<p class="grade">
						<img class="star" :src="getImgSrc(store.star)" alt="">
						<span class="inf">{{store.grade}} 月售{{store.sale}}单</span>
						<span class="birdsend inf">蜂鸟专送</span>
					</p>
					<p class="pcontent">
						<span class="inf price">{{store.send}}</span>
						<span class="infR dist inf">{{store.spend}}</span>
					</p>
					<p class="labelBox">
						<span class="inf label">{{store.tag}}</span>
					</p>
				</div>
				<template #right>
					<van-button square text="取消关注" type="danger" class="delete-button" @click="cancelCollect(index)" />
				</template>
			</van-swipe-cell>
		</div>
	</div>
</template>

<script>
	import Vue from 'vue';
	import {
		SwipeCell
	} from 'vant';
	Vue.use(SwipeCell);

	import {
		NavBar
	} from 'vant';
	Vue.use(NavBar);

	import { Dialog } from 'vant';
	//toast消息提醒
	import {
		Toast
	} from 'vant';
	
	export default {
		name: 'App-collectList',
		data() {
			return {
				storeList: []
			}
		},
		methods: {
			onClickLeft() {
				this.$router.push({
					name: 'mine'
				})
			},
			getImgSrc(src) {
				return require('../assets/' + src)
			},
			toDetail(val) {
				//链式导航跳转
				this.$router.push({
					name: 'storedetail',
					query: {
						s_id: val
					},
				})
			},
			cancelCollect(val) {
				Dialog.confirm({
						title: '警告',
						message: '您确定取消对该店铺的关注？',
					})
					.then(() => {
						// on confirm
						var url = 'http://localhost:8080/ele/collect/cancelCollect.action?c_id=' + this.storeList[val].c_id;
						this.$axios.get(url).then(
							res => {
								var rows = res.data
								if (rows > 0) {
									Toast.success('取消收藏成功')
									window.location.reload()
								}
							},
							err => {
								console.log(err)
								Toast.fail('取消收藏失败请重试');
							}
						)
					})
					.catch(() => {
						// on cancel
					});
			}
		},
		created() {
			var login_user = JSON.parse(window.localStorage.getItem('logined_user'));
			var url = 'http://localhost:8080/ele/store/getCollectStore.action?user_id=' + login_user.user_id;
			this.$axios.get(url).then(
				res => {
					var storeList = res.data
					if (storeList != null) {
						this.storeList = storeList
						console.log(this.storeList)
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
	.goods-card {
		margin: 0;
		background-color: @white;
	}

	.delete-button {
		height: 100%;
	}

	.title {
		width: 40%;
		margin: 30px 32.5% 20px 32.5%;
	}

	.img {
		width: 17%;
		float: left;
		margin-right: 5px;
		height: 130px;
	}

	.storeInf {
		width: 100%;
		text-align: left;
		padding-left: 20px;
		height: 100px;
		border-bottom: .01rem solid #EDEDED;
		margin-top: 10px;
	}

	.storeName {
		color: #333;
		/* 超出文本省略 */
		overflow: hidden;
		-ms-text-overflow: ellipsis;
		text-overflow: ellipsis;
		white-space: nowrap;
		display: block;


		width: 80%;
		font-weight: 700;
		font-size: 15px;
	}

	.grade {
		padding: 5px 0;
	}

	.grade span {
		margin-left: 0.1rem;
	}

	.star {
		position: relative;
		float: left;
		margin-right: 10px;
	}

	.inf {
		font-size: 0.12rem;
		float: left;
		color: #666;
	}

	.infR {
		color: #999;
		float: right;
		margin-right: 5px;
	}

	.birdsend {
		float: right;
		background-color: #00A9FF;
		color: white;
		padding: 1px 2px;
		border-radius: 1px;
		margin-right: 5px;
	}

	.label {
		margin-right: 0.1rem;
		border: 1px solid rgb(221, 221, 221);
		border-radius: 1px;
		padding: 1px;
	}

	.labelBox {
		padding: 5px 0;
		height: 20px;
	}

	.pcontent {
		margin-top: 15px;
		height: 5px;
	}

	.price {
		float: left;
	}
</style>
