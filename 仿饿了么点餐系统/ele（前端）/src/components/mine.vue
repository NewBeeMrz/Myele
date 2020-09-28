<template>
	<div class="mine">
		<header class="header">
			<div class="inf">
				<div class="userLogo">
				</div>
				<p class="userName">
					<router-link v-if="!loginflag" to="/login" tag="span">{{userName}}</router-link>
					<router-link v-if="loginflag" to="/profile" tag="span">{{userName}}</router-link>
				</p>
				<p class="phoneNum">
					<span class="iconfont">&#xe616;</span>
					<span class="userPhone">{{userphone}}</span>
				</p>
			</div>
			<div class="arrows">
				<span class="iconfont arrows">&#xe62b;</span>
			</div>
		</header>
		<van-grid class="welfare" :border="true" :column-num="2">
			<van-grid-item style="height: 120px;">
				<p class="l lunckBag">
					<span class="iconfont">&#xe696;</span>
					<span class="text">红包</span>
				</p>
			</van-grid-item>
			<van-grid-item>
				<p class="r gold">
					<span class="iconfont">&#xe681;</span>
					<span class="text">金币</span>
				</p>
			</van-grid-item>
		</van-grid>
		<div class="section">
			<div class="list with-divider">
				<a class="item with-avatar">
					<div class="avatar text-gray"><span class="iconfont">&#xe670;</span></div>
					<div class="title" @click="toCollectList()">我的收藏</div>
					<i class="icon icon-chevron-right muted"></i>
				</a>
				<a class="item with-avatar">
					<div class="avatar text-gray"><span class="iconfont">&#xe621;</span></div>
					<div class="title" @click="toComment()">我的评论</div>
					<i class="icon icon-chevron-right muted"></i>
				</a>
				<a v-if="loginflag" class="item with-avatar">
					<div class="avatar text-gray"><span class="iconfont">&#xe90f;</span></div>
					<div class="title" @click="logout()">注销账户</div>
					<i class="icon icon-chevron-right muted"></i>
				</a>
			</div>
		</div>
	</div>
</template>

<script>
	import Vue from 'vue';

	//格子布局
	import {Grid,GridItem} from 'vant';
	Vue.use(Grid);
	Vue.use(GridItem);
	
	import { Toast } from 'vant';
    Vue.use(Toast);
	
	import { Dialog } from 'vant';

	export default {
		data() {
			return {
				userName: '登录/注册',
				userphone: '登录后即享美食盛宴',
				loginflag: false,
			}
		},
		mounted() {
			var login_user = JSON.parse(window.localStorage.getItem('logined_user'));
			if (login_user.user_id > 0) {
				this.userName = "用户 " + login_user.user_name
				this.userphone = login_user.phonenum
				this.loginflag = true
			} else {
				this.userName = '登录/注册'
				this.userphone = '登录后即享美食盛宴'
				this.loginflag = false
			}
		},
		methods: {
			logout() {
				Dialog.confirm({
						title: '警告',
						message: '您确定注销该账户？',
					})
					.then(() => {
						// on confirm
						var obj={user_id:0,user_name:"",phonenum:""}
						window.localStorage.setItem('logined_user',JSON.stringify(obj))
						this.userName = '登录/注册'
						this.userphone = '登录后即享美食盛宴'
						this.loginflag = false
						Toast.success('注销成功');	
					})
					.catch(() => {
						// on cancel
					});
			},
			toCollectList(){
				this.$router.push({
					name:'collectlist'
				})
			},
			toComment(){
				this.$router.push({
					name:'mycomment'
				})
			}
		}
	}
</script>

<style scoped>
	header {
		width: calc(100%);
		padding: 25px 0.16rem;
		overflow: hidden;
		background-color: #00A9FF;
		position: relative;
	}

	.userLogo {
		float: left;
		border-radius: 50%;
		width: 60px;
		height: 60px;
		border-radius: 60px;
		background-image: url(../../data/img/evaluate/user01.png);
		background-size: 60px;
	}

	.inf {
		display: inline-block;
		width: 60%;
		padding: 8px 0 0 0.2rem;
		overflow: hidden;
		color: white;

		.userName {
			font-size: 0.2rem;
			font-weight: bold;
			padding-bottom: .08rem;
		}

		.phoneNum span,
		.phoneNum {
			color: white;
			font-size: 0.12rem;
		}
	}

	header>span {
		color: white;
		right: 0.2rem;
	}

	.lunckBag .iconfont {
		color: #FF5F3E;
	}

	.gold .iconfont {
		color: white;
		background-color: #6AC20B;
		position: relative;
		left: -5px;
	}

	.cont ul {
		overflow: hidden;
	}

	.cont li {
		font-size: 0.14rem;

	}

	.cont span {
		margin-right: 0.1rem;
		display: inline-block;
		font-size: 0.18rem;
	}

	.arrows {
		height: 70.4px;
		float: right;
		color: #666;
		font-size: 20px;
	}

	.arrows.iconfont {
		color: white;
	}

	.arrows span {
		margin-top: 20px;
	}

	.money span {
		color: rgb(148, 217, 74);
	}

	.share span {
		color: rgb(252, 123, 83);
	}

	.address.share {
		border-bottom: 15px solid;
	}

	.bLine {
		border-bottom: 1px solid;
	}

	.cont .elm {
		background-color: ;
		color: white;
		border-radius: 2px;
		font-size: .16rem;
	}

	.welfare {
		margin-bottom: 10px;
	}
</style>
