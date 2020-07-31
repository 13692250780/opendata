package io.renren.modules.generator.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.generator.dao.HdhCategoryDao;
import io.renren.modules.generator.entity.HdhCategoryEntity;
import io.renren.modules.generator.service.HdhCategoryService;


@Service("hdhCategoryService")
public class HdhCategoryServiceImpl extends ServiceImpl<HdhCategoryDao, HdhCategoryEntity> implements HdhCategoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<HdhCategoryEntity> page = this.page(
                new Query<HdhCategoryEntity>().getPage(params),
                new QueryWrapper<HdhCategoryEntity>()
        );

        return new PageUtils(page);
    }

}