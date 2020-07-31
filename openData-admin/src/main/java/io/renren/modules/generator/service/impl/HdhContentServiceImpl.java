package io.renren.modules.generator.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.generator.dao.HdhContentDao;
import io.renren.modules.generator.entity.HdhContentEntity;
import io.renren.modules.generator.service.HdhContentService;


@Service("hdhContentService")
public class HdhContentServiceImpl extends ServiceImpl<HdhContentDao, HdhContentEntity> implements HdhContentService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<HdhContentEntity> page = this.page(
                new Query<HdhContentEntity>().getPage(params),
                new QueryWrapper<HdhContentEntity>()
        );

        return new PageUtils(page);
    }

}