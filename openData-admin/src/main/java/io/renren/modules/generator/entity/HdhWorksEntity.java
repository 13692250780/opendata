package io.renren.modules.generator.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2020-06-27 21:24:07
 */
@Data
@TableName("hdh_works")
public class HdhWorksEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Integer id;
	/**
	 * 作品名称
	 */
	private String worksName;
	/**
	 * 作品描述
	 */
	private String worksDesc;
	/**
	 * 封面图
	 */
	private String pictureUrl;
	/**
	 * 最新作品
	 */
	private Integer isNew;
	/**
	 * 首页推荐
	 */
	private Integer isRecommend;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 跳转地址
	 */
	private String linkUrl;
	/**
	 * 所属类目
	 */
	private Integer categoryId;
	/**
	 * 所属类目
	 */
	private String content;

}
