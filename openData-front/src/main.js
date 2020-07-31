// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import 'babel-polyfill'
import Vue from 'vue'
import App from './App'
import router from './router'
import httpRequest from '@/utils/httpRequest'
Vue.config.productionTip = false
Vue.prototype.$http = httpRequest // ajax请求方法
/* eslint-disable no-new */
import VueWechatTitle from 'vue-wechat-title'
Vue.use(VueWechatTitle)
//引入elementui
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
