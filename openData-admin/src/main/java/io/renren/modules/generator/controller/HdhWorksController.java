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

import io.renren.modules.generator.entity.HdhWorksEntity;
import io.renren.modules.generator.service.HdhWorksService;
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
@RequestMapping("generator/hdhworks")
public class HdhWorksController {
    @Autowired
    private HdhWorksService hdhWorksService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("generator:hdhworks:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = hdhWorksService.queryPage1(params);

        return R.ok().put("page", page);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("generator:hdhworks:info")
    public R info(@PathVariable("id") Integer id){
		HdhWorksEntity hdhWorks = hdhWorksService.getById(id);

        return R.ok().put("hdhWorks", hdhWorks);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("generator:hdhworks:save")
    public R save(@RequestBody HdhWorksEntity hdhWorks){
        hdhWorks.setCreateTime(new Date());
		hdhWorksService.save(hdhWorks);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("generator:hdhworks:update")
    public R update(@RequestBody HdhWorksEntity hdhWorks){
		hdhWorksService.updateById(hdhWorks);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("generator:hdhworks:delete")
    public R delete(@RequestBody Integer[] ids){
		hdhWorksService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
