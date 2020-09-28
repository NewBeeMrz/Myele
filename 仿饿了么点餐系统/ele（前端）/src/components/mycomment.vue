<template>
	<div class="mycomment">
		<van-nav-bar title="我的评论" left-text="返回" left-arrow @click-left="onClickLeft" />
		<img class="title" src="../assets/img/loginRegister/pic01.png" alt="">
		<div v-for="(comment,index) in commentList" :key="index">
			<van-swipe-cell>
				<div>
					<van-panel :title="comment.userName" :desc="comment.time" style="text-align: left;">
						<p style="margin-left: 4%;">{{comment.content}}</p>
					</van-panel>
				</div>
				<template #right>
					<van-button square text="删除评论" type="danger" class="delete-button" @click="deleteComennt(comment.time)" />
				</template>
			</van-swipe-cell>
		</div>
	</div>
</template>

<script>
	import Vue from 'vue';
	import {
		NavBar
	} from 'vant';
	Vue.use(NavBar);

	import {
		SwipeCell
	} from 'vant';
	Vue.use(SwipeCell);

	//toast消息提醒
	import {
		Toast
	} from 'vant';

	import {
		Dialog
	} from 'vant';

	export default {
		name: 'App-mycomment',
		data() {
			return {
				commentList: [],
				content: ''
			}
		},
		methods: {
			onClickLeft() {
				this.$router.push({
					name: 'mine'
				})
			},
			deleteComennt(val) {
				Dialog.confirm({
						title: '警告',
						message: '您确定删除该条评论？',
					})
					.then(() => {
						// on confirm
						var url = 'http://localhost:8080/ele/comment/deleteComment.action?time=' + val;
						this.$axios.get(url).then(
							res => {
								var rows = res.data
								if (rows > 0) {
									Toast.success('删除成功');
									window.location.reload();
								}
							},
							err => {
								console.log(err)
								Toast.fail('请求失败请重试');
							}
						)
					})
					.catch(() => {
						// on cancel
						Toast.fail('删除失败');
					});
			}
		},
		mounted() {
			var login_user = JSON.parse(window.localStorage.getItem('logined_user'));
			var url = 'http://localhost:8080/ele/comment/getCommentbyUser.action?userName=' + login_user.user_name;
			this.$axios.get(url).then(
				res => {
					var commentList = res.data
					if (commentList != null) {
						this.commentList = commentList
						console.log(this.commentList)
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
</style>
