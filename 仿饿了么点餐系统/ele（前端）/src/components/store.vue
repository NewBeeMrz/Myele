<template>
	<div class="store">
		<van-nav-bar title="店铺信息" left-text="返回" left-arrow @click-left="onClickLeft" />
		<img class="title" src="../assets/img/loginRegister/pic01.png" alt="">
		<div class="storeInf" v-for="(store,index) in storeList" :key="index" @click="toDetail(store.s_id)">
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
				<div>
					<span class="iconfont infR inf">2个活动</span>
					<p class="activityB">
						<span class="inf firstWord">首</span>
						<span class="inf activity">{{store.activityA}}</span>
					</p>
					<p class="activityB">
						<span class="inf otherWord">减</span>
						<span class="inf otherActivity">{{store.activityB}}</span>
					</p>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import Vue from 'vue';
	import {
		NavBar
	} from 'vant';
	Vue.use(NavBar);

	import bus from '../bus.js';
	export default {
		name: 'App-store',
		data() {
			return {
				storeList: [],
			}
		},
		methods: {
			onClickLeft() {
				this.$router.push({
					name: 'home'
				})
			},
			getImgSrc(src) {
				return require('../assets/' + src)
			},
			toDetail(val) {
				//链式导航跳转
				this.$router.push({
					name: 'storedetail',
					query: {s_id: val},
					})
			}
		},
		created() {
			bus.$on('storeList', data => {
				setTimeout(() => {
					this.storeList = data
				}, 200)
			})
		}
	}
</script>

<style scoped>
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
		height: 160px;
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
		color: #666;
		float: left;
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

	.firstWord {
		color: white;
		background-color: #70BC46;
		border-radius: 1px;
		padding: 1px 2px;
		margin-right: 0.05rem;
	}

	.otherWord {
		color: white;
		background-color: #F07373;
		border-radius: 1px;
		padding: 1px 2px;
		margin-right: 0.05rem;
	}

	.activity {
		width: 60%;
		/* 超出文本省略 */
		overflow: hidden;
		-ms-text-overflow: ellipsis;
		text-overflow: ellipsis;
		white-space: nowrap;
		display: block;

		margin-left: 2px;
	}

	.otherActivity {
		padding: 1px;
		width: 70%;
		/* 超出文本省略 */
		overflow: hidden;
		-ms-text-overflow: ellipsis;
		text-overflow: ellipsis;
		white-space: nowrap;
		display: block;
		margin-left: 2px;
	}

	.activityB {
		padding: 2px 0;
		margin-top: 20px;
	}
</style>
