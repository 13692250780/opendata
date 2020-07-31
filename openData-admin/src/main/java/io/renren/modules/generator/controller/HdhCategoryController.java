package io.renren.modules.generator.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.generator.entity.HdhCategoryEntity;
import io.renren.modules.generator.service.HdhCategoryService;
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
@RequestMapping("generator/hdhcategory")
public class HdhCategoryController {
    @Autowired
    private HdhCategoryService hdhCategoryService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("generator:hdhcategory:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = hdhCategoryService.queryPage(params);

        return R.ok().put("page", page);
    }
    /**
     * 获取所有类型
     */
    @RequestMapping("/all")
    @RequiresPermissions("generator:hdhcategory:list")
    public R list(){
        List<HdhCategoryEntity> list = hdhCategoryService.list();
        return R.ok().put("list", list);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("generator:hdhcategory:info")
    public R info(@PathVariable("id") Integer id){
		HdhCategoryEntity hdhCategory = hdhCategoryService.getById(id);

        return R.ok().put("hdhCategory", hdhCategory);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("generator:hdhcategory:save")
    public R save(@RequestBody HdhCategoryEntity hdhCategory){
        hdhCategory.setCreateTime(new Date());
		hdhCategoryService.save(hdhCategory);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("generator:hdhcategory:update")
    public R update(@RequestBody HdhCategoryEntity hdhCategory){
		hdhCategoryService.updateById(hdhCategory);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("generator:hdhcategory:delete")
    public R delete(@RequestBody Integer[] ids){
		hdhCategoryService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
