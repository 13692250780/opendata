package io.renren.modules.generator.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.generator.dao.HdhBannerDao;
import io.renren.modules.generator.entity.HdhBannerEntity;
import io.renren.modules.generator.service.HdhBannerService;


@Service("hdhBannerService")
public class HdhBannerServiceImpl extends ServiceImpl<HdhBannerDao, HdhBannerEntity> implements HdhBannerService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<HdhBannerEntity> page = this.page(
                new Query<HdhBannerEntity>().getPage(params),
                new QueryWrapper<HdhBannerEntity>()
        );

        return new PageUtils(page);
    }

}