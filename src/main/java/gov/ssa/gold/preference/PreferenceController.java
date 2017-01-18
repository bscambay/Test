/**
 * 
 */
package gov.ssa.gold.preference;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import gov.ssa.gold.account.Account;
import gov.ssa.gold.account.AccountRepository;


/**
 * Controller for managing preferences
 * @author Michael Clair
 */
@Controller
public class PreferenceController 
{
	
	@Autowired
	private PreferenceRepository preferenceRepository;
	
	@Autowired
	private AccountRepository actRep;
	
	
	/**
	 * Handle request to view all preferences
	 * @param model
	 * @return
	 */
	@RequestMapping(value="preferences")
	public String getPreferences(Principal principal, Model model)
	{
		model.addAttribute("preferences", preferenceRepository.findAll());
		Account act = actRep.findByPin(principal.getName());
		model.addAttribute("username", act.getName());
		return "preference/preferences";
	}
	
	
	@RequestMapping(value = "preference")
	public String preference() {
        return "preference/preference";
    }
	
	
	/**
	 * Handle request to get new preference form
	 * @return
	 */
	@RequestMapping(value="preferences/new")
	public String getNewPreference()
	{
		return "preferences/preferences";
	}
	
	/**
	 * Handle new preference post event
	 * @param preference
	 * @return
	 */
	@RequestMapping(value="preferences/saveNew", method=RequestMethod.POST)
	public @ResponseBody String saveNewPreference(@RequestBody Preference preference)
	{
		try
		{
			List<Preference> preferences = preferenceRepository.findAll();
	        
	        for (Preference apref : preferences) {
				if ( apref.getAccountPin().equals(preference.getAccountPin()) ) {
					preference.setPreferenceId(apref.getPreferenceId());
					break;
				}			
			}
			System.out.println("In save new pref" + preference);
			preferenceRepository.save(preference);
			return "{\"result\": \"success\"}";
		}
		catch (Exception ex)
		{
			return "Error";
		}
	}
	
	/**
	 * Handle delete role post event
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/preferences/{id}/delete", method = RequestMethod.POST)
	public String deletePreference(@PathVariable("id") long id) {
		System.out.println("Attempting to delete preference #" + id);
		Preference preference = preferenceRepository.getOne(id);
		preferenceRepository.delete(preference);

		return "redirect:/#/preferences";

	}
}