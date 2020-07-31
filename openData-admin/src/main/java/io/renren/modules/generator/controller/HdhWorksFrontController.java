package io.renren.modules.generator.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.generator.entity.HdhWorksEntity;
import io.renren.modules.generator.service.HdhWorksService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2020-06-27 21:24:07
 */
@RestController
@RequestMapping("front/hdhworks")
public class HdhWorksFrontController {
    @Autowired
    private HdhWorksService hdhWorksService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = hdhWorksService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 信息
     */
    @RequestMapping("/info")
    public R info( Integer id){
		HdhWorksEntity hdhWorks = hdhWorksService.getById(id);

        return R.ok().put("hdhWorks", hdhWorks);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody HdhWorksEntity hdhWorks){
		hdhWorksService.save(hdhWorks);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody HdhWorksEntity hdhWorks){
		hdhWorksService.updateById(hdhWorks);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
		hdhWorksService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
