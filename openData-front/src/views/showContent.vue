<template>
  <div class="showContent" v-wechat-title="$route.meta.title=work.worksName">
    <TOP_NAV :currentCate="0"></TOP_NAV>
    <div v-html="work.content" class="content"></div>
    <FOOT></FOOT>
  </div>
</template>

<script>
  import nav from '../components/nav'
  import foot from '../components/foot'
  export default {
    name: "showContent",
    components: {
      TOP_NAV: nav,
      FOOT:foot
    },
    data() {
      return {
        work: "",
        id:0,
        currentCate: 0,
      }
    },
    methods:{
      findContent(){
        this.$http({
          url: this.$http.adornUrl('/front/hdhworks/info'),
          method: 'get',
          params: this.$http.adornParams({
            id:this.id
          })
        }).then(({data}) => {
          if (data.code == 0) {
              this.work=data.hdhWorks
          }
        })
      }
    },
    created() {
        this.id=this.$route.query.id
         this.findContent()
    }
  }
</script>

<style scoped>
  .content{
    min-height: 700px;
    width: 80%;
    margin: 0 auto;
  }
</style>
