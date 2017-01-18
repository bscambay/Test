/**
 * 
 */
package gov.ssa.gold.account;

import java.util.Dictionary;
import java.util.Hashtable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Controller for managing roles
 * 
 * @author Chris Vaughan
 */
@Controller
public class RoleController {
	@Autowired
	private RoleRepository roleRepository;

	/**
	 * Handle request to view all roles
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "roles")
	public String getRoles(Model model) {
		// TODO Make more efficient
		List<Role> roles = roleRepository.findAll();

		Dictionary<Long, String> roleAccounts = new Hashtable<>();

		for (Role role : roles) {
			if (roleRepository.findAccountsByRoleId(role.getId()) != null) {
				roleAccounts.put(role.getId(), roleRepository.findAccountsByRoleId(role.getId()));
			} else {
				roleAccounts.put(role.getId(), "None");
			}

		}

		model.addAttribute("roles", roles);
		model.addAttribute("roleAccounts", roleAccounts);

		return "roles/roles";

	}

	/**
	 * Handle request to get new role form
	 * 
	 * @return
	 */
	@RequestMapping(value = "roles/new")
	public String getNewRole() {
		return "roles/newRole";
	}

	/**
	 * Handle new role post event
	 * 
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "roles/saveNew", method = RequestMethod.POST)
	public @ResponseBody String saveNewRole(@RequestBody Role role) {
		try {
			roleRepository.save(role);

			return "{\"result\": \"success\"}";
		} catch (Exception ex) {
			return "Error";
		}
	}

	/**
	 * Handle delete role post event
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/roles/{id}/delete", method = RequestMethod.POST)
	public String deleteWorkflow(@PathVariable("id") long id) {
		System.out.println("Attempting to delete role #" + id);
		Role role = roleRepository.getOne(id);
		roleRepository.delete(role);

		return "redirect:/#/roles";

	}
}