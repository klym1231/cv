package com.ken.undecemberTest.controller;

import com.ken.undecemberTest.model.Items;
import com.ken.undecemberTest.model.SelectNameOption;
import com.ken.undecemberTest.model.SelectPositionOption;
import com.ken.undecemberTest.repositories.ItemRepository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class UndecemberTestController {

    @Autowired
    private ItemRepository itemRepository;

    @GetMapping("/")
    public View index() {
        return new RedirectView("items");
    }

    @GetMapping("/items")
    public ModelAndView listItems(Model model) {
        List<Items> items = itemRepository.findAll();
        ModelAndView mav = new ModelAndView("items");
        mav.addObject("items", items);
        return mav;
    }

    @PostMapping("/items")
    public View newItem() {
        return new RedirectView("items/new");
    }

    // @RequestMapping("/items/new")

    @GetMapping("/items/new")
    public String showNewItemForm(Model model) {
        Items items = new Items();
        model.addAttribute("items", items);
        List<SelectNameOption> options_name = new ArrayList<>();
        options_name.add(new SelectNameOption("1", "艾莉莎"));
        options_name.add(new SelectNameOption("2", "哈馬爾"));
        options_name.add(new SelectNameOption("3", "布雷埃爾"));
        options_name.add(new SelectNameOption("4", "卡斯托勒"));
        options_name.add(new SelectNameOption("5", "阿庫班"));
        options_name.add(new SelectNameOption("6", "阿奎拉"));
        options_name.add(new SelectNameOption("7", "培斯貝勒"));
        options_name.add(new SelectNameOption("8", "賽普塔爾"));
        options_name.add(new SelectNameOption("9", "卡普立"));
        options_name.add(new SelectNameOption("10", "米拉塞堤"));
        model.addAttribute("options_name", options_name);

        List<SelectPositionOption> options_position = new ArrayList<>();
        options_position.add(new SelectPositionOption("1", "top"));
        options_position.add(new SelectPositionOption("2", "top_right"));
        options_position.add(new SelectPositionOption("3", "bottom_right"));
        options_position.add(new SelectPositionOption("4", "bottom"));
        options_position.add(new SelectPositionOption("5", "bottom_left"));
        options_position.add(new SelectPositionOption("6", "top_left"));
        model.addAttribute("options_position", options_position);
        return "new_item";
    }

    /*
     * @GetMapping("/imageFragment")
     * public String getImageFragment(@RequestParam String imageType, Model model) {
     * 
     * if ("cat".equals(imageType)) {
     * model.addAttribute("imageSrc", "/cat.png");
     * } else if ("dog".equals(imageType)) {
     * model.addAttribute("imageSrc", "/dog.png");
     * }
     * return "fragments/image-fragment";
     * }
     */

    @PostMapping("/items/save")
    public String saveItem(@ModelAttribute("Items") Items items) {
        itemRepository.save(items);
        return "redirect:/items";
    }

    @GetMapping("/it")
    public ModelAndView a(Model model) {
        List<Items> items = itemRepository.findAll();
        ModelAndView mav = new ModelAndView("items");
        mav.addObject("items", items);
        return mav;
    }

}
