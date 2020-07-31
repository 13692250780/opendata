<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"

    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule"  ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="100px">
    <el-form-item label="轮播图名称" prop="bannerName">
      <el-input v-model="dataForm.bannerName" placeholder="轮播图名称"></el-input>
    </el-form-item>
    <el-form-item label="图片上传" prop="bannerUrl">
      <el-input v-model="dataForm.bannerUrl" disabled ></el-input>
      <div style="color: #00a0e9" @click="showUpload">点击上传图片</div>
    </el-form-item>
    <el-form-item label="跳转地址" >
      <el-input v-model="dataForm.linkUrl" placeholder="跳转地址"></el-input>
    </el-form-item>
    <el-form-item label="优先级别" >
      <el-input v-model="dataForm.priority" placeholder="优先级别"></el-input>
    </el-form-item>
    <el-form-item label="是否展示" prop="isShow">
      <el-select v-model="dataForm.isShow" placeholder="是否展示">
        <el-option
          label="是"
          :value="1">
        </el-option>
        <el-option
          label="否"
          :value="0">
        </el-option>
      </el-select>
    </el-form-item>
<!--    <el-form-item label="创建时间" prop="createTime">-->
<!--      <el-input v-model="dataForm.createTime" placeholder="创建时间"></el-input>-->
<!--    </el-form-item>-->
    </el-form>
    <UPLOADIMAGE @reUrl="getBannerUrl" ref="upload" v-if="uploadVisible"></UPLOADIMAGE>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  import uploadImage from "./uploadImage"
  export default {
    components:{
      UPLOADIMAGE:uploadImage
    },
    data () {
      return {
        visible: false,
        uploadVisible:false,
        dataForm: {
          id: 0,
          bannerName: '',
          bannerUrl: '',
          linkUrl: '',
          priority: '',
          isShow: 1,
          createTime: ''
        },
        dataRule: {
          bannerName: [
            { required: true, message: '轮播图名称不能为空', trigger: 'blur' }
          ],
          bannerUrl: [
            { required: true, message: '图片地址不能为空', trigger: 'blur' }
          ],
          linkUrl: [
            { required: true, message: '跳转地址不能为空', trigger: 'blur' }
          ],
          priority: [
            { required: true, message: '优先级别不能为空', trigger: 'blur' }
          ],
          isShow: [
            { required: true, message: '是否展示不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '创建时间不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/generator/hdhbanner/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.bannerName = data.hdhBanner.bannerName
                this.dataForm.bannerUrl = data.hdhBanner.bannerUrl
                this.dataForm.linkUrl = data.hdhBanner.linkUrl
                this.dataForm.priority = data.hdhBanner.priority
                this.dataForm.isShow = data.hdhBanner.isShow
                this.dataForm.createTime = data.hdhBanner.createTime
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/generator/hdhbanner/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'bannerName': this.dataForm.bannerName,
                'bannerUrl': this.dataForm.bannerUrl,
                'linkUrl': this.dataForm.linkUrl,
                'priority': this.dataForm.priority,
                'isShow': this.dataForm.isShow,
                'createTime': this.dataForm.createTime
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      },
      //图获取图片
      getBannerUrl(data){
        this.dataForm.bannerUrl=data
        console.log(data)
      },
      //开启上传图片对话框
      showUpload(){
        this.uploadVisible = true
        this.$nextTick(() => {
          this.$refs.upload.init()
        })
      }
    }
  }
</script>
