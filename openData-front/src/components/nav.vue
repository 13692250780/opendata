<template>
  <div class="TOP_NAV">
    <div class="top">
      <div class="content">
        <!--      logo-->
        <div class="logo">
          <img src="http://data.hdhdeveloper.cn/hdh/20200628/b3b03929932b4363aedbd5f49684cfe2.png"/>
        </div>
        <!--      菜单栏-->
        <div class="nav">
          <div class="li" :style="{'color':currentCate==0?'#000':'rgba(113, 113, 113, 0.48)'}" @click="toIndex">
            首页
          </div>
          <div class="li" v-for="(item,key) in category" @click="toCatePage(item.id)"
               :style="{'color':currentCate==item.id?'#000':'rgba(113, 113, 113, 0.48)'}" >
            {{item.categoryName}}
          </div>

          <!--        清除浮动-->
          <div class="clear"></div>
        </div>

      </div>

    </div>
    <!--        清除浮动-->
    <div class="clear"></div>

  </div>
</template>

<script>
  export default {
    name: "TOP_NAV",
    data() {
      return {
        category: []

      }
    },
    props:{
      currentCate:{
        default:0
      }
    },
    methods: {
      // 获取数据列表
      getDataList() {
        this.$http({
          url: this.$http.adornUrl('/front/hdhcategory/list'),
          method: 'get'
        }).then(({data}) => {
          //console.log(data)
          if (data.code==0){
            this.category=data.list
          }
        })
      },
      //查询类目信息
      findContent(key){
       // console.log(key)
        this.currentCate=key

      },
      //跳转到首页
      toIndex(){
        this.$router.push('/')
      },
      //跳转到分类页
      toCatePage(e){
        this.$router.push({path:'/other',query: {id:e}})
      }
    },
    created() {
      this.getDataList()
    }
  }
</script>

<style scoped>
  /*清除浮动
  */
  .clear{
    clear: both;
  }

  /**
  顶部导航栏
   */
  .top {
    background-color: #ffe300;
    width: 100%;
    height: 56px;
    min-width: 1200px;
  }

  .top .content {
    width: 90%;
    margin: 0 auto;

  }

  /*logo*/
  .top .logo {
    width: 160px;
    padding-top: 4px;
    float: left;
  }

  .top .logo img {
    width: 100%;
  }

  /*  导航栏*/
  .top .nav {
    /*background: indianred;*/
    width: 70%;
    height: 56px;
    float: left;
    margin-left: 60px;
  }

  .top .nav .li {
    float: left;
    width: 120px;
    font-size: 18px;
    margin: 0 10px ;
    padding: 17.5px 0;
    text-align: center;
    vertical-align: middle;
    font-weight: bold;
    color: rgba(113, 113, 113, 0.48);
    cursor: pointer;
  }
  .top .nav .li:hover{
    color: black;
  }
</style>
