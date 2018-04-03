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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.batch137.model.Category;
import com.xsis.batch137.service.CategoryService;

@Controller
@RequestMapping(value="category")
public class CategoryController {
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping
	public String view(Model model) {
		List<Category> categories = categoryService.selectAll();
		model.addAttribute("categories", categories);
		return "/category/category-view";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Category category) {
		categoryService.save(category);
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable long id) {
		categoryService.delete(id);
	}
	
	@RequestMapping(value="/take", method=RequestMethod.GET)
	@ResponseBody
	public Category getOne(@RequestParam("id") long id) {
		Category category = categoryService.getOne(id);
		return category;
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.ACCEPTED)
	public void update(@RequestBody Category category) {
		categoryService.update(category);
	}
	
	@RequestMapping(value="/search")
	@ResponseBody
	public List<Category> search(@RequestParam(value="search", defaultValue="") String search){
		List<Category> categories = categoryService.searchCategory(search);
		return categories;
	}
	
	@RequestMapping(value="/get-item-stock", method=RequestMethod.GET)
	@ResponseBody
	public int getJumlahItemByCategory(@RequestParam("id") long id){
		int itemStock = categoryService.getItemStock(id);
		return itemStock;
	}
}
