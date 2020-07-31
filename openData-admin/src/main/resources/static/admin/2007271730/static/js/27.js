webpackJsonp([27],{A1zP:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var r=a("AxVU"),o=a("m4/J"),l={components:{UPLOADIMAGE:r.default,EDITOR:o.default},data:function(){return{visible:!1,isLoad:!1,uploadVisible:!1,isClear:!1,categorys:[],dataForm:{id:0,worksName:"",worksDesc:"",pictureUrl:"",isNew:"",isRecommend:"",createTime:"",linkUrl:"",categoryId:"",content:""},dataRule:{worksName:[{required:!0,message:"作品名称不能为空",trigger:"blur"}],worksDesc:[{required:!0,message:"作品描述不能为空",trigger:"blur"}],pictureUrl:[{required:!0,message:"封面图不能为空",trigger:"blur"}],isNew:[{required:!0,message:"最新作品不能为空",trigger:"blur"}],isRecommend:[{required:!0,message:"首页推荐不能为空",trigger:"blur"}],createTime:[{required:!0,message:"创建时间不能为空",trigger:"blur"}],linkUrl:[{required:!0,message:"跳转地址不能为空",trigger:"blur"}],categoryId:[{required:!0,message:"所属类目不能为空",trigger:"blur"}]}}},methods:{init:function(e){var t=this;this.dataForm.id=e||0,this.visible=!0,this.$nextTick(function(){t.$refs.dataForm.resetFields(),t.dataForm.id?t.$http({url:t.$http.adornUrl("/generator/hdhworks/info/"+t.dataForm.id),method:"get",params:t.$http.adornParams()}).then(function(e){var a=e.data;a&&0===a.code&&(t.dataForm.worksName=a.hdhWorks.worksName,t.dataForm.worksDesc=a.hdhWorks.worksDesc,t.dataForm.pictureUrl=a.hdhWorks.pictureUrl,t.dataForm.isNew=a.hdhWorks.isNew,t.dataForm.isRecommend=a.hdhWorks.isRecommend,t.dataForm.createTime=a.hdhWorks.createTime,t.dataForm.linkUrl=a.hdhWorks.linkUrl,t.dataForm.categoryId=a.hdhWorks.categoryId,t.dataForm.content=a.hdhWorks.content,t.isClear=!1,t.isLoad=!0)}):(t.isClear=!0,t.isLoad=!0)}),this.findCategory()},dataFormSubmit:function(){var e=this;this.$refs.dataForm.validate(function(t){t&&e.$http({url:e.$http.adornUrl("/generator/hdhworks/"+(e.dataForm.id?"update":"save")),method:"post",data:e.$http.adornData({id:e.dataForm.id||void 0,worksName:e.dataForm.worksName,worksDesc:e.dataForm.worksDesc,pictureUrl:e.dataForm.pictureUrl,isNew:e.dataForm.isNew,isRecommend:e.dataForm.isRecommend,createTime:e.dataForm.createTime,linkUrl:e.dataForm.linkUrl,categoryId:e.dataForm.categoryId,content:e.dataForm.content})}).then(function(t){var a=t.data;a&&0===a.code?e.$message({message:"操作成功",type:"success",duration:1500,onClose:function(){e.visible=!1,e.$emit("refreshDataList")}}):e.$message.error(a.msg)})})},getBannerUrl:function(e){this.dataForm.pictureUrl=e,console.log(e)},showUpload:function(){var e=this;this.uploadVisible=!0,this.$nextTick(function(){e.$refs.upload.init()})},findCategory:function(){var e=this;this.$http({url:this.$http.adornUrl("/generator/hdhcategory/all"),method:"get"}).then(function(t){var a=t.data;a&&0===a.code&&(e.categorys=a.list)})},reContent:function(e){console.log("a",e),this.dataForm.content=e}}},s={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-dialog",{attrs:{title:e.dataForm.id?"修改":"新增","close-on-click-modal":!1,width:"80%",visible:e.visible},on:{"update:visible":function(t){e.visible=t}}},[a("el-form",{ref:"dataForm",attrs:{model:e.dataForm,rules:e.dataRule,"label-width":"80px"},nativeOn:{keyup:function(t){if(!("button"in t)&&e._k(t.keyCode,"enter",13,t.key,"Enter"))return null;e.dataFormSubmit()}}},[a("el-form-item",{attrs:{label:"作品名称",prop:"worksName"}},[a("el-input",{attrs:{placeholder:"作品名称"},model:{value:e.dataForm.worksName,callback:function(t){e.$set(e.dataForm,"worksName",t)},expression:"dataForm.worksName"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"作品描述",prop:"worksDesc"}},[a("el-input",{attrs:{placeholder:"作品描述"},model:{value:e.dataForm.worksDesc,callback:function(t){e.$set(e.dataForm,"worksDesc",t)},expression:"dataForm.worksDesc"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"封面图",prop:"pictureUrl"}},[a("el-input",{attrs:{placeholder:"图片链接"},model:{value:e.dataForm.pictureUrl,callback:function(t){e.$set(e.dataForm,"pictureUrl",t)},expression:"dataForm.pictureUrl"}}),e._v(" "),a("div",{staticStyle:{color:"#00a0e9"},on:{click:e.showUpload}},[e._v("点击上传图片")])],1),e._v(" "),a("el-form-item",{attrs:{label:"最新作品",prop:"isNew"}},[a("el-select",{attrs:{placeholder:"是否展示"},model:{value:e.dataForm.isNew,callback:function(t){e.$set(e.dataForm,"isNew",t)},expression:"dataForm.isNew"}},[a("el-option",{attrs:{label:"是",value:1}}),e._v(" "),a("el-option",{attrs:{label:"否",value:0}})],1)],1),e._v(" "),a("el-form-item",{attrs:{label:"首页推荐",prop:"isRecommend"}},[a("el-select",{attrs:{placeholder:"是否展示"},model:{value:e.dataForm.isRecommend,callback:function(t){e.$set(e.dataForm,"isRecommend",t)},expression:"dataForm.isRecommend"}},[a("el-option",{attrs:{label:"是",value:1}}),e._v(" "),a("el-option",{attrs:{label:"否",value:0}})],1)],1),e._v(" "),a("el-form-item",{attrs:{label:"跳转地址"}},[a("el-input",{attrs:{placeholder:"跳转地址"},model:{value:e.dataForm.linkUrl,callback:function(t){e.$set(e.dataForm,"linkUrl",t)},expression:"dataForm.linkUrl"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"所属类目",prop:"categoryId"}},[a("el-select",{attrs:{placeholder:"是否展示"},model:{value:e.dataForm.categoryId,callback:function(t){e.$set(e.dataForm,"categoryId",t)},expression:"dataForm.categoryId"}},e._l(e.categorys,function(e,t){return a("el-option",{key:t,attrs:{label:e.categoryName,value:e.id}})}))],1),e._v(" "),a("el-form-item",{attrs:{label:"详情"}},[a("EDITOR",{attrs:{isClear:e.isClear},model:{value:e.dataForm.content,callback:function(t){e.$set(e.dataForm,"content",t)},expression:"dataForm.content"}})],1)],1),e._v(" "),e.uploadVisible?a("UPLOADIMAGE",{ref:"upload",on:{reUrl:e.getBannerUrl}}):e._e(),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.visible=!1}}},[e._v("取消")]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(t){e.dataFormSubmit()}}},[e._v("确定")])],1)],1)},staticRenderFns:[]},i=a("VU/8")(l,s,!1,null,null,null);t.default=i.exports}});