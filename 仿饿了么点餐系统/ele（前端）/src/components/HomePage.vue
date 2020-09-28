<template>
	<div class="home">
		<van-nav-bar style="background: deepskyblue;">
			<template #title>
				<span style="font-size: 1.5625rem;color: white;font-style:oblique">Elem</span>
			</template>
		</van-nav-bar>
		<van-notice-bar text="饿了没,没饿就再饿一会儿! 饿了没,没饿就再饿一会儿! 饿了没,没饿就再饿一会儿!" left-icon="volume-o" :scrollable="true" />
		<van-search @search="onSearch" shape="round" v-model="search_content" placeholder="请输入店铺或食物名称" />
		<van-swipe class="swipe" :autoplay="3000">
			<van-swipe-item v-for="(image, index) in images" :key="index">
				<img v-lazy="image" width="100%" height="80%" />
			</van-swipe-item>
		</van-swipe>

		<van-grid class="menu" :border="true" :column-num="4" :clickable="true">
			<van-grid-item @click="toStoreList()">
				<div>
					<img style="" src="../assets/img/home/pic14.webp" alt=""><br />
					<span>美食</span>
				</div>
			</van-grid-item>
			<van-grid-item @click="toStoreList()">
				<div>
					<img style="" src="../assets/img/home/pic02.webp" alt=""><br />
					<span>商店便利</span>
				</div>
			</van-grid-item>
			<van-grid-item @click="toStoreList()">
				<div>
					<img style="" src="../assets/img/home/pic03.webp" alt=""><br />
					<span>水果</span>
				</div>
			</van-grid-item>
			<van-grid-item @click="toStoreList()">
				<div>
					<img style="" src="../assets/img/home/pic05.webp" alt=""><br />
					<span>浪漫鲜花</span>
				</div>
			</van-grid-item>
			<van-grid-item @click="toStoreList()">
				<div>
					<img style="" src="../assets/img/home/pic06.webp" alt=""><br />
					<span>跑腿代购</span>
				</div>
			</van-grid-item>
			<van-grid-item @click="toStoreList()">
				<div>
					<img style="" src="../assets/img/home/pic04.webp" alt=""><br />
					<span>医疗健康</span>
				</div>
			</van-grid-item>
			<van-grid-item @click="toStoreList()">
				<div>
					<img style="" src="../assets/img/home/pic07.webp" alt=""><br />
					<span>汉堡披萨</span>
				</div>
			</van-grid-item>
			<van-grid-item @click="toStoreList()">
				<div>
					<img style="" src="../assets/img/home/pic09.webp" alt=""><br />
					<span>甜品饮品</span>
				</div>
			</van-grid-item>
		</van-grid>
	</div>
</template>

<script>
	import Vue from 'vue';
	//Navbar
	import {
		NavBar
	} from 'vant';

	Vue.use(NavBar);

	//搜索框引入
	import {
		Search
	} from 'vant';

	Vue.use(Search);

	//滑动轮播
	import {
		Swipe,
		SwipeItem
	} from 'vant';

	Vue.use(Swipe);
	Vue.use(SwipeItem);
	//toast消息提醒
	import {
		Toast
	} from 'vant';

	//滚动消息提示
	import {
		NoticeBar
	} from 'vant';
	Vue.use(NoticeBar);

	//宫格布局
	import {
		Grid,
		GridItem
	} from 'vant';
	Vue.use(Grid);
	Vue.use(GridItem);

	//引入数据中转站
	import bus from '../bus.js';
	export default {
		name: 'App-homepage',
		data() {
			return {
				search_content: '',
				images: [
					require('../assets/img1.png'),
					require('../assets/img2.png'),
					require('../assets/img3.png'),
					require('../assets/img4.png')
				],
				storeList: [],
			}
		},
		methods: {
			onSearch() {
				if (this.search_content != null && this.search_content != '') {
					var url = 'http://localhost:8080/ele/store/searchStore.action?search_content=' + this.search_content;
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
				}
			},
			toStoreList() {
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
			}
		},
	}
</script>
<style scoped="scoped">
	.home {
		height: 30%
	}

	.swipe {
		height: 135px;
	}

	.menu {
		padding: 16px;
		margin-bottom: 50px;
	}

	.menu span {
		color: #666;
	}

	.menu img {
		width: 50%;
	}
</style>
