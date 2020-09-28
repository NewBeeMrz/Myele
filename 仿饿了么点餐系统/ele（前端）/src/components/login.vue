<template>
	<div class="login">
		<van-nav-bar title="登录/注册" left-text="返回" left-arrow @click-left="onClickLeft" />
		<img src="../assets/img/loginRegister/pic01.png" alt="">
		<van-form class="loginForm" @submit="onSubmit">
			<van-field v-if="!phoneflag" v-model="user_name" name="用户名" label="用户名" placeholder="用户名" :rules="[{ required: true, message: '请填写用户名' }]" />
			<van-field v-if="phoneflag" v-model="phonenum" name="手机号码" label="手机号码" placeholder="手机号码" :rules="[{ required: true, message: '请填写手机号' }]" />
			<van-field v-model="user_pass" type="password" name="密码" label="密码" placeholder="密码" :rules="[{ required: true, message: '请填写密码' }]" />
			<div style="margin-top: 5px;">
				<div style="float: left;margin-left: 20px;">
					<span class="iconfont">&#xe616;</span>
					<span style="color: gray;" @click="changeLogin()">{{msg}}</span>
				</div>
				<div style="float: right;margin-right: 20px;">
					<span class="iconfont">&#xe642;</span>
					<span style="color: #0000FE;" @click="turnToregister()">注册账号</span>
				</div>
			</div>
			<div style="margin-top: 50px;margin-left: 16px;margin-right: 16px;">
				<van-button round block type="info" native-type="submit">
					登录
				</van-button>
			</div>
		</van-form>
	</div>
</template>

<script>
	import Vue from 'vue';
	//表单
	import { Form } from 'vant';
	Vue.use(Form);
	
	//按钮
	import { Button } from 'vant';
	Vue.use(Button);
	
	//输入框
	import { Field } from 'vant';
	Vue.use(Field);
	
	//提示
	import { Toast } from 'vant';
    Vue.use(Toast);
	
	//消息提示
	import { Notify } from 'vant';
    Vue.use(Notify);
	export default {
		name: 'App-login',
		data(){
			return{
				user_name:'',
				user_pass:'',
				phonenum:'',
				msg:'手机号登录',
				user:[],
				phoneflag:false
			}
		},
		methods: {
			onClickLeft() {
				this.$router.push({
					name: 'mine'
				})
			},
			onSubmit() {
				var url
				if(this.phoneflag == false)
				url = 'http://localhost:8080/ele/login/getloginuser.action?user_name='+this.user_name+'&user_pass='+this.user_pass;
				else
				url = 'http://localhost:8080/ele/login/getloginuserbyPhone.action?phonenum='+this.phonenum+'&user_pass='+this.user_pass;
				this.$axios.get(url).then(
					res => {
						this.user = res.data
						console.log(this.user)
						if(this.user.user_id > 0){
							var obj={user_id:this.user.user_id,user_name:this.user.user_name,phonenum:this.user.phonenum}
							window.localStorage.setItem('logined_user',JSON.stringify(obj))
							Toast.success('登录成功');
							//链式导航跳转
							this.$router.push({
								name:'mine'
							})
						}else{
							// 警告通知
							Notify({ type: 'warning', message: '用户名(手机号)或密码错误' });
						}
					},
					err => {
						console.log(err)
						Toast.fail('网络出错，请重试');
					}
				)	
			},
			changeLogin(){
				if(this.phoneflag == false){
					this.phoneflag = true;
					this.msg='用户名密码登录'
					this.user_pass=''
					this.user_name=''
					this.phonenum=''
				}else{
					this.phoneflag = false;
					this.msg='手机号登录'
					this.user_pass=''
					this.user_name=''
					this.phonenum=''
				}
			},
			turnToregister(){
				//链式导航跳转
				this.$router.push({
					name:'register'
				})
			}
		},
	}
</script>

<style scoped>
	img {
		width: 35%;
		margin: 41px 32.5% 20px 32.5%;
	}
</style>
