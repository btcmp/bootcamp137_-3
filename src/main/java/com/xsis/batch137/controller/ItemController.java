package com.xsis.batch137.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;

import com.xsis.batch137.model.Category;
import com.xsis.batch137.model.Item;
import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.ItemVariant;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.TransferStock;
import com.xsis.batch137.service.CategoryService;
import com.xsis.batch137.service.ItemInventoryService;
import com.xsis.batch137.service.ItemService;
import com.xsis.batch137.service.ItemVariantService;
import com.xsis.batch137.service.OutletService;


@Controller
@RequestMapping("/master/item")
public class ItemController {
	@Autowired
	ItemService itemService;
	
	@Autowired
	ItemInventoryService itemInventoryService;
	
	@Autowired
	ItemVariantService itemVariantService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	OutletService outletService;
	
	@Autowired
	HttpSession httpSession;
	
	@RequestMapping
	public String index(Model model) {
		Outlet outlet = (Outlet) httpSession.getAttribute("outletLogin");
		long outId = outlet.getId();
		List<Item> items=itemService.selectAll();
		List<ItemInventory> itemInventories=itemInventoryService.getItemInventoryByOutletLogin(outId);
		List<ItemVariant> itemVariants=itemVariantService.selectAll();
		List<Category> categories=categoryService.selectAll();
		List<Outlet> outlets=outletService.selectAll();		
		model.addAttribute("outlet",outlet);
		model.addAttribute("outlets", outlets);
		model.addAttribute("items", items);
		model.addAttribute("categories", categories);
		model.addAttribute("itemInventories", itemInventories);
		model.addAttribute("itemVariants", itemVariants);
		return "/item/item";
	}
	
	@RequestMapping(value = "/search-inventory", method = RequestMethod.GET)
	public String indexSearch(Model model, @RequestParam(value="search", defaultValue="") Long search) {
		List<ItemInventory> itemInventories = itemInventoryService.listInventoryByOutlet(search);
		List<Outlet> outlets = outletService.selectAll();
		model.addAttribute("outlets", outlets);
		model.addAttribute("itemInventories",itemInventories);
		
		List<Item> items=itemService.selectAll();
		List<ItemVariant> itemVariants=itemVariantService.selectAll();
		List<Category> categories=categoryService.selectAll();
		model.addAttribute("items", items);
		model.addAttribute("categories", categories);
		model.addAttribute("itemVariants", itemVariants);
		
		return "/item/item";
	}
		
	@Autowired
	ServletContext servletContext;
//upload gambar
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	@ResponseBody
	public String upload(@RequestParam("image") MultipartFile file) {
		String name="";
		try {
			String tamp = file.getOriginalFilename().toString();
			String[] type = tamp.split("\\.");
			int len = type.length;
			name = (System.currentTimeMillis())+"."+type[len-1];
			BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
		    File destination = new File(servletContext.getRealPath("/resources/img/"+name));
		    ImageIO.write(src, type[len-1], destination);
		    
		    } catch(Exception e) {
		        e.printStackTrace();
		        
		    }
		return name;
	}
	
	
/*==================================CRUD FOR ITEM============================*/
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Item item) {
		itemService.save(item);
	}
	
	@RequestMapping(value="/get-all", method=RequestMethod.GET)
	@ResponseBody
	public List<Item> getAll(){
		return itemService.selectAll();
	}
	
	@RequestMapping(value="/search-inventory-outlet",method=RequestMethod.GET)
	@ResponseBody
	public List<ItemInventory> searchInventoryOutlet(@RequestParam(value="search", defaultValue="") Long search, @RequestParam(value="outlet-id", defaultValue="") Long id){
		List<ItemInventory > itemInventories = itemInventoryService.getItemInventoryByOutlet(search, id);
		return itemInventories;
	}
	
	
	@RequestMapping(value="/update",method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Item item) {
		itemService.update(item);
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable Long id) {
		Item item=new Item();
		item.setId(id);
		itemService.delete(item);
	}
	
	@RequestMapping(value="/search-item",method=RequestMethod.GET)
	@ResponseBody
	public List<ItemInventory> searchItem(@RequestParam(value="search", defaultValue="") String search){
		List<ItemInventory > itemInventories = itemInventoryService.searchItemInventoryByItemName(search);
		List<ItemInventory> invent = new ArrayList<>();
		Outlet outlet = (Outlet) httpSession.getAttribute("outletLogin");
		long outId = outlet.getId();
		if(itemInventories != null) {
			for (ItemInventory ivt : itemInventories) {
				if(ivt.getOutlet().getId() == outId && ivt.getItemVariant().getActive()==true && ivt.getItemVariant().getItem().getActive()==true) {
					invent.add(ivt);
				}
			}
		}
		
		return invent;
	}
	
/*==================================CRUD FOR ITEMVARIANT============================*/
	@RequestMapping(value="/save-variant",method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void saveVariant(@RequestBody ItemVariant itemVariant) {
		itemVariantService.save(itemVariant);
	}
	
	@RequestMapping(value="/get-all-variant", method=RequestMethod.GET)
	@ResponseBody
	public List<ItemVariant> getAllVariant(){
		return itemVariantService.selectAll();
	}
	
	@RequestMapping(value="/get-one-variant/{id}")
	@ResponseBody
	public ItemVariant getOneVariant(@PathVariable Long id) {
		ItemVariant itemVariant=itemVariantService.getOne(id);
		return itemVariant;
	}
	
	@RequestMapping(value="/update-variant-active/{id}")
	@ResponseBody
	public void updateActiveVariant(@PathVariable Long id) {
		System.out.println(id);
		itemVariantService.updateActiveVariant(id);
	}
	
	//s
	@RequestMapping(value="/update-variant",method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void updateVariant(@RequestBody ItemVariant itemVariant) {
		itemVariantService.update(itemVariant);
	}
	
	@RequestMapping(value="/delete-variant/{id}",method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void deleteVariant(@PathVariable Long id) {
		ItemVariant itemVariant=new ItemVariant();
		itemVariant.setId(id);
		itemVariantService.delete(itemVariant);
	}
/*==================================CRUD FOR ITEMINVENTORY============================*/
	@RequestMapping(value="/save-inventory",method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void saveInventory(@RequestBody ItemInventory itemInventory) {
		itemInventoryService.save(itemInventory);
	}
	
	@RequestMapping(value="/get-one-inventory/{id}")
	@ResponseBody
	public ItemInventory getOneInventory(@PathVariable Long id) {
		ItemInventory itemInventory=itemInventoryService.getOne(id);
		return itemInventory;
	}
	
	@RequestMapping(value="/update-inventory",method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void updateInventory(@RequestBody ItemInventory itemInventory) {
		itemInventoryService.updateTransferStock(itemInventory);
	}
	
	@RequestMapping(value="/update-inventory-so",method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void updateInventorySO(@RequestBody ItemInventory itemInventory) {
		itemInventoryService.updateSalesOrder(itemInventory);
	}
	
	
	
	@RequestMapping(value="/delete-inventory/{id}",method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void deleteInventory(@PathVariable Long id) {
		ItemInventory itemInventory=new ItemInventory();
		itemInventory.setId(id);
		itemInventoryService.delete(itemInventory);
	}
	
	@RequestMapping("/get-inventory")
	@ResponseBody
	public List<ItemInventory> getAllInventory(){
		return itemInventoryService.selectAll();
	}
	
	//cek SKU
	@RequestMapping("/cek-sku")
	@ResponseBody
	public int getVariantSku(@RequestParam(value="sku", defaultValue="") String sku) {
		return itemVariantService.countSku(sku);
	}
	
}
