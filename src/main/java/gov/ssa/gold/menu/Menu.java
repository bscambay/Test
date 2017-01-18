/**
 * 
 */
package gov.ssa.gold.menu;

import java.util.List;
import java.util.Set;

import javax.persistence.AttributeOverride;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import gov.ssa.gold.EntityBase;
import gov.ssa.gold.account.Role;

/**
 * 
 * @author Chris Vaughan
 */
@Entity
@Table(name="dev_menu")
@AttributeOverride(name="id", column=@Column(name="dev_menu_id"))
@SequenceGenerator(name="default_gen", sequenceName="dev_menu_dev_menu_id_seq", allocationSize=1)
public class Menu extends EntityBase
{
	private static final long serialVersionUID = 3591976177371872946L;
	
	private String name;
	private String description;
	@Transient
	private List<Role> allowedRoles;

	@OneToMany(mappedBy="menu", cascade=CascadeType.ALL)
	private Set<MenuItem> items;
	
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getDescription()
	{
		return description;
	}
	
	/**
	 * 
	 * @param description
	 */
	public void setDescription(String description)
	{
		this.description = description;
	}
	
	/**
	 * @return the allowedRoles
	 */
	public List<Role> getAllowedRoles() {
		return allowedRoles;
	}
	/**
	 * @param allowedRoles the allowedRoles to set
	 */
	public void setAllowedRoles(List<Role> allowedRoles) {
		this.allowedRoles = allowedRoles;
	}
	/**
	 * @return the items
	 */
	public Set<MenuItem> getItems() {
		return items;
	}
	/**
	 * @param items the items to set
	 */
	public void setItems(Set<MenuItem> items) {
		this.items = items;
	}
}