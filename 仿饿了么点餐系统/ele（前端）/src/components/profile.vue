<template>
	<div class="profile">
		<van-nav-bar title="个人中心" left-text="返回" left-arrow @click-left="onClickLeft" />
		<img src="../assets/img/loginRegister/pic01.png" alt="">
		<van-form @submit="onSubmit">
			<van-field v-model="user_name" name="用户名" label="用户名" placeholder="用户名" :rules="[{ required: true, message: '请填写用户名' }]" />
			<van-field v-model="user_pass" type="password" name="密码" label="密码" placeholder="密码" :rules="[{ required: true, message: '请填写密码' }]" />
			<van-field v-model="phonenum" name="手机号码" label="手机号码" placeholder="手机号码" :rules="[{ pattern, message: '请输入正确的手机号' }]" />
			<div style="margin: 16px;">
				<van-button round block type="info" native-type="submit">
					修改个人信息
				</van-button>
			</div>
		</van-form>
	</div>
</template>

<script>
	import Vue from 'vue';
	import { Dialog } from 'vant';
	//提示
	import { Toast } from 'vant';
	Vue.use(Toast);
	export default{
		name:'App-profile',
		data(){
			return{
				user_id:0,
				user_name:'',
				user_pass:'',
				phonenum:'',
				pattern:/^1\d{10}$/,
			}
		},
		methods:{
			onClickLeft() {
				this.$router.push({
					name: 'mine'
				})
			},
			onSubmit() {
				Dialog.confirm({
						title: '警告',
						message: '您确定修改个人信息？',
					})
					.then(() => {
						// on confirm
						var url ='http://localhost:8080/ele/profile/updateUser.action?user_id='+this.user_id+'&user_name='+this.user_name+'&user_pass='+this.user_pass+'&phonenum='+this.phonenum;
						this.$axios.get(url).then(
							res => {
								var rows = res.data
								console.log(rows)
								if(rows > 0){
									Toast.success('修改成功');
									var obj={user_id:this.user_id,user_name:this.user_name,phonenum:this.phonenum}
									window.localStorage.setItem('logined_user',JSON.stringify(obj))
									window.location.reload()
								}
								
							},
							err => {
								console.log(err)
							}
						)		
					})
					.catch(() => {
						// on cancel
					});
			},
		},
		mounted() {
			var login_user = JSON.parse(window.localStorage.getItem('logined_user'));
			this.user_id = login_user.user_id
			var url ='http://localhost:8080/ele/profile/getUserbyID.action?user_id='+this.user_id;
			this.$axios.get(url).then(
				res => {
					var user = res.data
					console.log(user)
					this.user_id = user.user_id
					this.user_name = user.user_name
					this.user_pass = user.user_pass
					this.phonenum = user.phonenum
				},
				err => {
					console.log(err)
				}
			)
		}
	}
</script>

<style scoped>
	img {
		width: 35%;
		margin: 41px 32.5% 20px 32.5%;
	}
</style>
