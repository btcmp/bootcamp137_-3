package com.xsis.batch137.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.batch137.model.Item;
import com.xsis.batch137.service.ItemService;


@Controller
@RequestMapping("/item")
public class ItemController {
	@Autowired
	ItemService itemService;
	
	@RequestMapping
	public String index(Model model) {
		List<Item> items=itemService.selectAll();
		model.addAttribute("items", items);
		return "item";
	}
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Item item) {
		itemService.save(item);
	}
	
	@RequestMapping(value="/get-one/{id}")
	@ResponseBody
	public Item getOne (@PathVariable long id) {
		Item item=itemService.getOne(id);
		return item;
	}
	
	@RequestMapping(value="/update",method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Item item) {
		itemService.update(item);
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable long id) {
		Item item=new Item();
		item.setId(id);
		itemService.delete(item);
	}

	
	
}
