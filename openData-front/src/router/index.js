import Vue from 'vue'
import Router from 'vue-router'
import index from '@/views/index'
import other from '@/views/cateContent'
import showContent from '@/views/showContent'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: index

    },
    {
      path: '/other',
      name: 'other',
      component: other,

    },
    {
      path: '/show',
      name: 'other',
      component: showContent
    }
  ]
})
