package io.renren.modules.generator.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.generator.entity.HdhContentEntity;

import java.util.Map;

/**
 * 
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2020-06-27 22:37:28
 */
public interface HdhContentService extends IService<HdhContentEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

