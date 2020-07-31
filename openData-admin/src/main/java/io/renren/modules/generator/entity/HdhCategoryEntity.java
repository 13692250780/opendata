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
@TableName("hdh_category")
public class HdhCategoryEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Integer id;
	/**
	 * 类目名称
	 */
	private String categoryName;
	/**
	 * 排序
	 */
	private Integer priority;
	/**
	 * 创建时间
	 */
	private Date createTime;

}
