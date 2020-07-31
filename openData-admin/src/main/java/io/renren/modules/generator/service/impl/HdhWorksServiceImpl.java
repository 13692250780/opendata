package io.renren.modules.generator.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.generator.dao.HdhWorksDao;
import io.renren.modules.generator.entity.HdhWorksEntity;
import io.renren.modules.generator.service.HdhWorksService;


@Service("hdhWorksService")
public class HdhWorksServiceImpl extends ServiceImpl<HdhWorksDao, HdhWorksEntity> implements HdhWorksService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        //获取参数
        String isRecommend = (String) params.get("isRecommend");
        String isNew = (String) params.get("isNew");
        String categoryId = (String) params.get("categoryId");
        String worksName = (String) params.get("worksName");
        QueryWrapper<HdhWorksEntity> query  = new QueryWrapper<>();
        //设置过滤参数
        if (isRecommend.equals("1")){
            query.eq("is_recommend",1);
        }
        if (isNew.equals("1")){
            query.eq("is_new",1);
        }
        if (categoryId!=null&&!categoryId.equals("")){
            query.eq("category_id",categoryId);
        }
        if (worksName!=null&&!worksName.equals("")){
            query.like("works_name",worksName);
        }
        query.orderByDesc("create_time");
        IPage<HdhWorksEntity> page = this.page(
                new Query<HdhWorksEntity>().getPage(params),
                query
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage1(Map<String, Object> params) {

        QueryWrapper<HdhWorksEntity> query  = new QueryWrapper<>();

        query.orderByDesc("create_time");
        IPage<HdhWorksEntity> page = this.page(
                new Query<HdhWorksEntity>().getPage(params),
                query
        );

        return new PageUtils(page);
    }
}