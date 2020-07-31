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
 * @date 2020-06-27 22:37:28
 */
@Data
@TableName("hdh_content")
public class HdhContentEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Integer id;
	/**
	 * 页面名称
	 */
	private String contentName;
	/**
	 * 详情
	 */
	private String contentText;
	/**
	 * 创建时间
	 */
	private Date createTime;

}
