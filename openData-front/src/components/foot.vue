<template>
  <div class="foot">
    <div class="content">
      <div class="item">本网站项目，供个人免费学习使用</div>
      <div class="item">一起学习，一起进步</div>
      <div class="item">
        <div class="wechat" style="margin: 0 auto">
          <el-popover
            placement="top-start"
            title=""
            width="60"
            trigger="hover"
            content="">
            <img src="http://data.hdhdeveloper.cn/hdh/20200629/d832dfa8de5c4290ba274852de502fc5.jpg"
                 style="width: 100%"/>

            <div class="wechat" slot="reference"></div>
            <!--  <el-button slot="reference">hover 激活</el-button>-->
          </el-popover>
        </div>
      </div>
      <div class="item">
        <a href="http://beian.miit.gov.cn/" style="text-decoration: none;color: #ccc;">
          粤ICP备xxxxx号-1
        </a>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "foot"
  }
</script>

<style scoped>
  .foot {

    background-color: #282828;
    width: 100%;
    height: 150px;
    margin-top: 120px;
    text-align: center;
    color: #fff;
    padding-top: 10px;
    font-size: 13px;
  }

  .foot .content {
    margin-top: 20px;
  }

  .foot .content .item {
    margin-top: 10px;
  }

  /*  微信*/
  .foot .wechat {
    width: 20px;
    height: 20px;
    background-image: url("http://data.hdhdeveloper.cn/hdh/20200629/0448fedf4adb452e8320164d5616df19.png");
    background-size: 100%;
  }

  .foot .wechat:hover {
    background-image: url("http://data.hdhdeveloper.cn/hdh/20200629/afe171fb03e94c2caa96e2c907fc40d5.png");
  }
</style>
