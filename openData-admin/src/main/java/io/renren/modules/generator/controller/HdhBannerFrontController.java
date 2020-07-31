package io.renren.modules.generator.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.generator.entity.HdhBannerEntity;
import io.renren.modules.generator.service.HdhBannerService;
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
@RequestMapping("front/hdhbanner")
public class HdhBannerFrontController {
    @Autowired
    private HdhBannerService hdhBannerService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(){
        List<HdhBannerEntity> list = hdhBannerService.list();
        return R.ok().put("list", list);
    }




}
