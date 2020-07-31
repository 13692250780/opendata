<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    width="80%"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()"
             label-width="80px">
      <el-form-item label="作品名称" prop="worksName">
        <el-input v-model="dataForm.worksName" placeholder="作品名称"></el-input>
      </el-form-item>
      <el-form-item label="作品描述" prop="worksDesc">
        <el-input v-model="dataForm.worksDesc" placeholder="作品描述"></el-input>
      </el-form-item>
      <el-form-item label="封面图" prop="pictureUrl">
        <el-input v-model="dataForm.pictureUrl" placeholder="图片链接"></el-input>
        <div style="color: #00a0e9" @click="showUpload">点击上传图片</div>
      </el-form-item>
      <el-form-item label="最新作品" prop="isNew">
        <el-select v-model="dataForm.isNew" placeholder="是否展示">
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
      <el-form-item label="首页推荐" prop="isRecommend">
        <el-select v-model="dataForm.isRecommend" placeholder="是否展示">
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
      <el-form-item label="跳转地址">
        <el-input v-model="dataForm.linkUrl" placeholder="跳转地址"></el-input>
      </el-form-item>
      <el-form-item label="所属类目" prop="categoryId">
        <el-select v-model="dataForm.categoryId" placeholder="是否展示">
          <el-option v-for="(item,key) in categorys"
                     :key="key"
                     :label="item.categoryName"
                     :value="item.id">
          </el-option>

        </el-select>
      </el-form-item>
      <el-form-item label="详情">
        <!--      <el-input v-model="dataForm.contentText" placeholder="详情"></el-input>-->
        <EDITOR v-model="dataForm.content" :isClear="isClear"></EDITOR>
      </el-form-item>

    </el-form>
    <UPLOADIMAGE @reUrl="getBannerUrl" ref="upload" v-if="uploadVisible"></UPLOADIMAGE>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  import uploadImage from './uploadImage'
  import editor from './editor'

  export default {
    components: {
      UPLOADIMAGE: uploadImage,
      EDITOR: editor
    },
    data () {
      return {
        visible: false,
        isLoad:false,//等待请求成功后，再渲染富文本编辑器
        uploadVisible: false,
        isClear:false,//是否清楚富文本内容
        categorys: [],
        dataForm: {
          id: 0,
          worksName: '',
          worksDesc: '',
          pictureUrl: '',
          isNew: '',
          isRecommend: '',
          createTime: '',
          linkUrl: '',
          categoryId: '',
          content: ''
        },
        dataRule: {
          worksName: [
            {required: true, message: '作品名称不能为空', trigger: 'blur'}
          ],
          worksDesc: [
            {required: true, message: '作品描述不能为空', trigger: 'blur'}
          ],
          pictureUrl: [
            {required: true, message: '封面图不能为空', trigger: 'blur'}
          ],
          isNew: [
            {required: true, message: '最新作品不能为空', trigger: 'blur'}
          ],
          isRecommend: [
            {required: true, message: '首页推荐不能为空', trigger: 'blur'}
          ],
          createTime: [
            {required: true, message: '创建时间不能为空', trigger: 'blur'}
          ],
          linkUrl: [
            {required: true, message: '跳转地址不能为空', trigger: 'blur'}
          ],
          categoryId: [
            {required: true, message: '所属类目不能为空', trigger: 'blur'}
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
              url: this.$http.adornUrl(`/generator/hdhworks/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {

                this.dataForm.worksName = data.hdhWorks.worksName
                this.dataForm.worksDesc = data.hdhWorks.worksDesc
                this.dataForm.pictureUrl = data.hdhWorks.pictureUrl
                this.dataForm.isNew = data.hdhWorks.isNew
                this.dataForm.isRecommend = data.hdhWorks.isRecommend
                this.dataForm.createTime = data.hdhWorks.createTime
                this.dataForm.linkUrl = data.hdhWorks.linkUrl
                this.dataForm.categoryId = data.hdhWorks.categoryId
                this.dataForm.content = data.hdhWorks.content
                //开启富文本编辑器
               // console.log(this.dataForm.content)
                this.isClear=false
                this.isLoad=true
              }
            })
          }else {
            this.isClear=true
            this.isLoad=true

           // console.log(this.dataForm.content)
          }

        })
        //查询
        this.findCategory()
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/generator/hdhworks/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'worksName': this.dataForm.worksName,
                'worksDesc': this.dataForm.worksDesc,
                'pictureUrl': this.dataForm.pictureUrl,
                'isNew': this.dataForm.isNew,
                'isRecommend': this.dataForm.isRecommend,
                'createTime': this.dataForm.createTime,
                'linkUrl': this.dataForm.linkUrl,
                'categoryId': this.dataForm.categoryId,
                'content': this.dataForm.content
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
      getBannerUrl (data) {
        this.dataForm.pictureUrl = data
        console.log(data)
      },
      //开启上传图片对话框
      showUpload () {
        this.uploadVisible = true
        this.$nextTick(() => {
          this.$refs.upload.init()
        })
      },
      //查询类目
      findCategory () {
        this.$http({
          url: this.$http.adornUrl(`/generator/hdhcategory/all`),
          method: 'get',

        }).then(({data}) => {
          if (data && data.code === 0) {
            //  console.log(data)
            this.categorys = data.list
          }
        })
      },
      //设置详细信息
      reContent(data){
        console.log('a',data)
        this.dataForm.content=data

      }
    }
  }
</script>
