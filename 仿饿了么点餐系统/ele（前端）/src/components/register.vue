<template>
	<div class="register">
		<van-nav-bar title="注册" left-text="返回" left-arrow @click-left="onClickLeft" />
		<img src="../assets/img/loginRegister/pic01.png" alt="">
		<van-form @submit="onSubmit">
			<van-field v-model="user_name" name="用户名" label="用户名" placeholder="用户名" :rules="[{ required: true, message: '请填写用户名' }]" />
			<van-field v-model="user_pass" type="password" name="密码" label="密码" placeholder="密码" :rules="[{ required: true, message: '请填写密码' }]" />
			<van-field v-model="phonenum" name="手机号码" label="手机号码" placeholder="手机号码" :rules="[{ pattern, message: '请输入正确的手机号' }]" />
			<div style="margin: 16px;">
				<van-button round block type="info" native-type="submit">
					注册
				</van-button>
			</div>
		</van-form>
	</div>
</template>

<script>
	import Vue from 'vue';
	import {Form} from 'vant';
	Vue.use(Form);
	
	//提示
	import { Toast } from 'vant';
	Vue.use(Toast);
	export default {
		name: 'App-register',
		data() {
			return {
				user_name: '',
				user_pass: '',
				phonenum: '',
				pattern:/^1\d{10}$/,
			}
		},
		methods: {
			onClickLeft() {
				this.$router.push({
					name: 'login'
				})
			},
			onSubmit() {
				var url ='http://localhost:8080/ele/register/createUser.action?user_name='+this.user_name+'&user_pass='+this.user_pass+'&phonenum='+this.phonenum;
				this.$axios.get(url).then(
					res => {
						var rows = res.data
						console.log(rows)
						if(rows > 0){
							Toast.success('注册成功,返回登录界面');
							//链式导航跳转
							this.$router.push({
								name:'login'
							})
						}
					},
					err => {
						console.log(err)
						Toast.failed('注册失败');
					}
				)	
			},
		}
	}
</script>

<style scoped>
	img {
		width: 35%;
		margin: 41px 32.5% 20px 32.5%;
	}
</style>
