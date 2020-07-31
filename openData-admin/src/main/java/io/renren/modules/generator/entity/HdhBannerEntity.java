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
@TableName("hdh_banner")
public class HdhBannerEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Integer id;
	/**
	 * 轮播图名称
	 */
	private String bannerName;
	/**
	 * 图片地址
	 */
	private String bannerUrl;
	/**
	 * 跳转地址
	 */
	private String linkUrl;
	/**
	 * 优先级别
	 */
	private Integer priority;
	/**
	 * 是否展示
	 */
	private Integer isShow;
	/**
	 * 创建时间
	 */
	private Date createTime;

}
