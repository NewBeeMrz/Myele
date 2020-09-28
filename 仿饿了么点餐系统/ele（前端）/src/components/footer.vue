<template>
	<van-tabbar route>
		<van-tabbar-item replace to="/" >
			<span class="iconfont home">&#xe600;</span><br/>
			<span>首页</span>
		</van-tabbar-item>
		<van-tabbar-item replace to="/find" >
			<span class="iconfont find">&#xe604;</span><br/>
			<span>发现</span>
		</van-tabbar-item>
		<van-tabbar-item replace to="/order">
			<span class="iconfont order">&#xe608;</span><br/>
			<span>订单</span>
		</van-tabbar-item>
		<van-tabbar-item replace to="/mine">
			<span class="iconfont mine">&#xe606;</span><br/>
			<span>我的</span>
		</van-tabbar-item>
	</van-tabbar>
</template>

<script>
	import Vue from 'vue';
	import {
		Tabbar,
		TabbarItem
	} from 'vant';
	Vue.use(Tabbar);
	Vue.use(TabbarItem);
	export default {
		name: 'App-footer',
		data() {
			return {
				tabnaeNum: 0
			}
		}
	}
</script>

<style scoped="scoped">
	.iconfont {
		font-size: 1.5rem;
	}
</style>
