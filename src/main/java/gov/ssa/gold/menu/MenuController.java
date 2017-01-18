/**
 * 
 */
package gov.ssa.gold.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 * @author Chris Vaughan
 */
@Controller
public class MenuController 
{
	@Autowired
	private MenuRepository menuRepository;
	
	/**
	 * Return the menu list template
	 * @return
	 */
	@RequestMapping(value="menus", method=RequestMethod.GET)
	public String getMenus()
	{
		return "develop/menu/list";
	}
	
	/**
	 * Return the menu list
	 * @return
	 */
	@RequestMapping(value="menus", method=RequestMethod.POST)
	public @ResponseBody List<Menu> getMenuList()
	{
		return menuRepository.findAll();
	}
}