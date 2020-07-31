<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    width="70%"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="页面名称" prop="contentName">
      <el-input v-model="dataForm.contentName" placeholder="页面名称"></el-input>
    </el-form-item>
    <el-form-item label="详情" prop="contentText">
<!--      <el-input v-model="dataForm.contentText" placeholder="详情"></el-input>-->
      <EDITOR v-model="dataForm.contentText" ></EDITOR>
    </el-form-item>

    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  import editor from "./editor"
  export default {
    components:{
      EDITOR:editor
    },
    data () {
      return {
        visible: false,
        isLoad:false,//等待请求成功后，再渲染富文本编辑器
        dataForm: {
          id: 0,
          contentName: '',
          contentText: '',
          createTime: ''
        },
        dataRule: {
          contentName: [
            { required: true, message: '页面名称不能为空', trigger: 'blur' }
          ],
          contentText: [
            { required: true, message: '详情不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/generator/hdhcontent/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                console.log(data)

                this.dataForm.contentName = data.hdhContent.contentName
                this.dataForm.contentText = data.hdhContent.contentText
                this.dataForm.createTime = data.hdhContent.createTime
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
              url: this.$http.adornUrl(`/generator/hdhcontent/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'contentName': this.dataForm.contentName,
                'contentText': this.dataForm.contentText,
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
      //设置详细信息
      reContent(data){
        this.dataForm.contentText=data
      }
    }
  }
</script>
