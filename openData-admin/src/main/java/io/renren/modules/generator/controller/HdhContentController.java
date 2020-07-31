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

import io.renren.modules.generator.entity.HdhContentEntity;
import io.renren.modules.generator.service.HdhContentService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2020-06-27 22:37:28
 */
@RestController
@RequestMapping("generator/hdhcontent")
public class HdhContentController {
    @Autowired
    private HdhContentService hdhContentService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("generator:hdhcontent:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = hdhContentService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("generator:hdhcontent:info")
    public R info(@PathVariable("id") Integer id){
		HdhContentEntity hdhContent = hdhContentService.getById(id);

        return R.ok().put("hdhContent", hdhContent);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("generator:hdhcontent:save")
    public R save(@RequestBody HdhContentEntity hdhContent){
        hdhContent.setCreateTime(new Date());
		hdhContentService.save(hdhContent);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("generator:hdhcontent:update")
    public R update(@RequestBody HdhContentEntity hdhContent){
		hdhContentService.updateById(hdhContent);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("generator:hdhcontent:delete")
    public R delete(@RequestBody Integer[] ids){
		hdhContentService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
