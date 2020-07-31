<template>
  <div class="index">
    <TOP_NAV :currentCate="0"></TOP_NAV>
    <div class="content">
      <div class="banner" >
        <el-carousel :interval="5000" arrow="hover" >
          <el-carousel-item v-for="(item,key) in banners" :key="key">
            <el-image :src="item.bannerUrl" style="width: 100%;height: 100%" :fit="'cover'"></el-image>
          </el-carousel-item>
        </el-carousel>
      </div>
      <div class="attribute">
        <div class="li" :style="{'border-bottom':currentCate==0?'#000 3px solid':'none'}" @click="changeWorks(0)">推荐
        </div>
        <div class="li" :style="{'border-bottom':currentCate==1?'#000 3px solid':'none'}" @click="changeWorks(1)">最新
        </div>
        <div class="clear"></div>
      </div>
      <div class="works">
        <div class="item" v-for="(item,key) in works" :key="key">
          <router-link :to="{ path: 'show', query: { id: item.id }}" target="_blank" style="text-decoration: none">
          <el-card shadow="hover">
            <div class="picture">
              <img :src="item.pictureUrl">
            </div>
            <div class="title">{{item.worksName}}</div>
            <div class="desc">{{item.worksDesc}}</div>
          </el-card>
          </router-link>
        </div>

        <div class="clear"></div>
      </div>
      <div class="pagination">
        <el-pagination
          background
          @size-change="sizeChangeHandle"
          @current-change="currentChangeHandle"
          layout="prev, pager, next"
          :page-size="pageSize"
          :total="totalPage">
        </el-pagination>
      </div>
    </div>
    <FOOT></FOOT>
  </div>
</template>

<script>
  import nav from '../components/nav'
  import foot from '../components/foot'
  export default {
    name: "index",
    components: {
      TOP_NAV: nav,
      FOOT:foot
    },
    data() {
      return {
        currentCate: 0,
        pageIndex: 1,
        pageSize: 12,
        totalPage: 40,
        isNew:0,
        isRecommend:1,
        works:[],//项目
        banners:[]//轮播图
      }
    },
    methods: {
      //查询banner图片
      getBanners(){
        this.$http({
          url: this.$http.adornUrl('/front/hdhbanner/list'),
          method: 'get',

        }).then(({data}) => {
          if (data.code==0){
            this.banners=data.list
          }
          console.log(data)
        })
      },
      // 获取数据列表
      getDataList() {
        this.$http({
          url: this.$http.adornUrl('/front/hdhworks/list'),
          method: 'get',
          params: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize,
            'isRecommend':this.isRecommend,
            'isNew':this.isNew
          })
        }).then(({data}) => {
          if (data.code==0){
            this.pageIndex=data.page.currPage
            this.totalPage=data.page.totalCount
            this.works=data.page.list
          }
          console.log(data)
        })
      },
      //推荐 or 最新
      changeWorks(e) {
        this.currentCate = e
        if (e==1){
          this.isRecommend=0
          this.isNew=1
        }
        if (e==0){
          this.isRecommend=1
          this.isNew=0
        }
        this.getDataList()
      },
      // 每页数
      sizeChangeHandle (val) {
        this.pageSize = val
        this.pageIndex = 1
        this.getDataList()
      },
      // 当前页
      currentChangeHandle (val) {
        this.pageIndex = val
        this.getDataList()
      },
    },
    created() {
      this.getDataList()
      this.getBanners()
    }
  }
</script>

<style scoped>
  /*
  清除浮动
  */
  .clear {
    clear: both;
  }


  /*  内容*/
  .content {
    width: 86%;
    margin: 0 auto;
    min-width: 1000px;
  }

  /*  属性*/
  .attribute {
    margin: 30px auto;
    width: 200px;
  }

  .attribute .li {
    width: 80px;
    text-align: center;
    margin: 0 10px;
    padding-bottom: 10px;
    float: left;
    cursor: pointer;
  }
  /*banner*/
  .banner{
    margin: 30px auto;
    width: 96%;
  }
  /*  作品*/
  .works {
    text-decoration: none;
    margin: 0 auto;
  }
  /*项目*/
  .works .item{
    width: 16%;
    float: left;
    margin: 30px 2%;
    cursor: pointer;
  }
  /*封面图*/
  .works .item .picture{

  }
  .works .item .picture img{
      width: 100%;
  }
/*  标题*/
  .works .item .title {
    width: 90%;
    margin: 10px auto;
    font-size: 14px;
    overflow: hidden;
    height: 16px;
  }
  /*  描述*/
  .works .item .desc {
    width: 90%;
    margin: 10px auto;
    font-size: 11px;
    overflow: hidden;
    height: 20px;
    color: #ccc;
  }
/*  分页器*/
   .pagination{
    margin: 0 auto;
     text-align: center;
  }
</style>
