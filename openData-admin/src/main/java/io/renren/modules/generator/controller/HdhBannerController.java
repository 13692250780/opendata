package io.renren.modules.generator.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.generator.entity.HdhBannerEntity;
import io.renren.modules.generator.service.HdhBannerService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2020-06-27 21:24:07
 */
@RestController
@RequestMapping("generator/hdhbanner")
public class HdhBannerController {
    @Autowired
    private HdhBannerService hdhBannerService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("generator:hdhbanner:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = hdhBannerService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("generator:hdhbanner:info")
    public R info(@PathVariable("id") Integer id){
		HdhBannerEntity hdhBanner = hdhBannerService.getById(id);

        return R.ok().put("hdhBanner", hdhBanner);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("generator:hdhbanner:save")
    public R save(@RequestBody HdhBannerEntity hdhBanner){
        hdhBanner.setCreateTime(new Date());
		hdhBannerService.save(hdhBanner);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("generator:hdhbanner:update")
    public R update(@RequestBody HdhBannerEntity hdhBanner){
		hdhBannerService.updateById(hdhBanner);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("generator:hdhbanner:delete")
    public R delete(@RequestBody Integer[] ids){
		hdhBannerService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
