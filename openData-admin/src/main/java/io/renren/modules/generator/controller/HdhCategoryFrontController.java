package io.renren.modules.generator.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.generator.entity.HdhCategoryEntity;
import io.renren.modules.generator.service.HdhCategoryService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;


/**
 * 
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2020-06-27 21:24:07
 */
@RestController
@RequestMapping("front/hdhcategory")
public class HdhCategoryFrontController {
    @Autowired
    private HdhCategoryService hdhCategoryService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(){
        List<HdhCategoryEntity> list = hdhCategoryService.list();
        return R.ok().put("list", list);
    }




}
