<template>
  <div class="index">
    <TOP_NAV :currentCate="categoryId"></TOP_NAV>
    <img src="https://reviveimg.hellorf.com/www/images/4fd2a1f320849af953a38ef78798a07b.gif"
         style="width: 80%;margin: 30px auto;display: block">
    <div class="content">
      <!--      <div class="banner">-->
      <!--        <el-carousel :interval="5000" arrow="always">-->
      <!--          <el-carousel-item v-for="item in 4" :key="item">-->
      <!--            <h3>{{ item }}</h3>-->
      <!--          </el-carousel-item>-->
      <!--        </el-carousel>-->
      <!--      </div>-->
      <div class="search">
        <el-input placeholder="请输入案例名称" v-model="searchValue" :clearable="true">
          <el-button slot="append" icon="el-icon-search" @click="searchWorks"></el-button>
        </el-input>
      </div>
      <div class="attribute">
        <div class="li" :style="{'border-bottom':currentCate==0?'#000 3px solid':'none'}" @click="changeWorks(0)">推荐
        </div>
        <div class="li" :style="{'border-bottom':currentCate==1?'#000 3px solid':'none'}" @click="changeWorks(1)">最新
        </div>
        <div class="clear"></div>
      </div>
      <div class="works">
        <div class="item" v-for="(item,key) in works" :key="key" >
          <router-link :to="{ path: 'show', query: { id: item.id }}"  target="_blank" style="text-decoration: none">
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
      FOOT: foot
    },
    data() {
      return {
        currentCate: 0,//当前类目
        pageIndex: 1,//当前页面
        pageSize: 10,//每页显示条数
        totalPage: 40,//总数量
        isNew: 0,//是否最新
        isRecommend: 1,//是否推荐
        works: [],//项目
        categoryId: 0,//类目id
        searchValue: ""//搜索
      }
    },
    methods: {
      // 获取数据列表
      getDataList() {
        this.$http({
          url: this.$http.adornUrl('/front/hdhworks/list'),
          method: 'get',
          params: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize,
            'isRecommend': this.isRecommend,
            'isNew': this.isNew,
            'categoryId': this.categoryId,
            'worksName': this.searchValue
          })
        }).then(({data}) => {
          if (data.code == 0) {
            this.pageIndex = data.page.currPage
            this.totalPage = data.page.totalCount
            this.works = data.page.list
          }
          console.log(data)
        })
      },
      //推荐 or 最新
      changeWorks(e) {
        this.currentCate = e
        if (e == 1) {
          this.isRecommend = 0
          this.isNew = 1
        }
        if (e == 0) {
          this.isRecommend = 1
          this.isNew = 0
        }
        this.getDataList()
      },
      // 每页数
      sizeChangeHandle(val) {
        this.pageSize = val
        this.pageIndex = 1
        this.getDataList()
      },
      // 当前页
      currentChangeHandle(val) {
        this.pageIndex = val
        this.getDataList()
      },
      //获取url中的id
      getId() {
        //console.log(this.$route.query.id)
        this.categoryId = this.$route.query.id
        this.getDataList()
      },
      //搜索
      searchWorks() {
        this.getDataList()
      }
    },
    watch: {
      $route: 'getId'
    }
    ,
    created() {
      this.categoryId = this.$route.query.id
      this.getDataList()
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

  .el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 200px;
    margin: 0;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }

  .el-card__body {
    padding: 0 !important;
  }

  /*  内容*/
  .content {
    width: 80%;
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

  /*  作品*/
  .works {
    max-width: 1300px;
    margin: 0 auto;
  }

  /*项目*/
  .works .item {
    width: 16%;
    float: left;
    margin: 30px 2%;
    cursor: pointer;
  }

  /*封面图*/
  .works .item .picture {

  }

  .works .item .picture img {
    width: 100%;
  }

  /*  标题*/
  .works .item .title {
    width: 90%;
    margin: 10px auto;
    font-size: 14px;
    overflow: hidden;
    height: 20px;
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
  .pagination {
    margin: 0 auto;
    text-align: center;
  }

  /*  搜索框*/
  .search {
    margin: 30px auto;
    width: 800px;

  }
</style>
