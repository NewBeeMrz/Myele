import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router'
import HomePage from './components/HomePage.vue'
import Footer from './components/footer.vue'
import Find from './components/find.vue'
import Order from './components/order.vue'
import Mine from './components/mine.vue'
import Login from './components/login.vue'
import Register from './components/register.vue'
import Profile from './components/profile.vue'
import Store from './components/store.vue'
import StoreDetail from './components/storedetail.vue'
import CollectList from './components/collectlist.vue'
import FindMore from './components/findmore.vue'
import MyComment from './components/mycomment.vue'

import './assets/iconfont/iconfont.css'
import './assets/css/mzui/dist/css/mzui.css'

import axios from 'axios'
Vue.prototype.$axios = axios
//轮播图片懒加载
import {
	Lazyload
} from 'vant';
Vue.use(Lazyload);

import {
	Dialog
} from 'vant';

Vue.config.productionTip = false

Vue.use(VueRouter) //使用Vuerouter对象

//注册全局过滤器
Vue.filter('spend',function(value){
	return value.slice(8)
})

//自定义指令
Vue.directive('rainbow',{
	bind(el){
		el.style.background="#"+Math.random().toString(16).slice(2,8);
	}
})

//配置路由规则
var router = new VueRouter({
	mode: 'history',
	routes: [{
			name: 'home',
			path: '/',
			components: {
				default: HomePage,
				footer: Footer
			}
		},
		{
			name: 'find',
			path: '/find',
			components: {
				default: Find,
				footer: Footer
			}
		},
		{
			name: 'order',
			path: '/order',
			components: {
				default: Order,
				footer: Footer
			},
			meta: {
				login_required: true
			}
		},
		{
			name: 'mine',
			path: '/mine',
			components: {
				default: Mine,
				footer: Footer
			}
		},
		{
			name: 'login',
			path: '/login',
			components: {
				default: Login,
			}
		},
		{
			name: 'register',
			path: '/register',
			components: {
				default: Register,
			}
		},
		{
			name: 'profile',
			path: '/profile',
			components: {
				default: Profile,
			}
		},
		{
			name: 'store',
			path: '/store',
			components: {
				default: Store,
			}
		},
		{
			name: 'storedetail',
			path: '/storedetail',
			components: {
				default: StoreDetail,
			},
			meta: {
				login_required: true
			}
		},
		{
			name: 'collectlist',
			path: '/collectlist',
			components: {
				default: CollectList,
			},
			meta: {
				login_required: true
			}
		},
		{
			name: 'findmore',
			path: '/findmore',
			components: {
				default: FindMore,
			},
			meta: {
				login_required: true
			}
		},
		{
			name: 'mycomment',
			path: '/mycomment',
			components: {
				default: MyComment,
			},
			meta: {
				login_required: true
			}
		},
	]
});

//验证需要验证的路由
router.beforeEach(function(to, from, next) {
	var logined_in = false;
	// logined_in=window.localStorage.getItem('logined')
	var logined_user = JSON.parse(window.localStorage.getItem('logined_user'))
	if (logined_user.user_id > 0) {
		logined_in = true
	}
	if (!logined_in && to.path == '/order' || !logined_in && to.path == '/collectlist' || !logined_in && to.path == '/findmore' || !logined_in && to.path == '/mycomment') {
		Dialog.alert({
			title: '警告',
			message: '您未登录，请先登录',
		}).then(() => {
			// on close
			next('login')
		});	
	} else {
		next()
	}
	if (!logined_in && to.path == '/storedetail') {
		Dialog.alert({
			title: '警告',
			message: '您未登录，请先登录',
		}).then(() => {
			// on close
			next('./login')
		});	
	} else {
		next()
	}
})

new Vue({
	router,
	render: h => h(App),
}).$mount('#app')
